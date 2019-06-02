using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using System.Data;

public partial class DiaryQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號204665
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];
            lab_QueryDate.Text = "查詢日：" + DateTime.Now.ToString("yyyy/MM/dd");
            //GetDefaultCondition();
            //處理查詢timeout
            //hidn_condition.Value = " and 1<>1 ";

            GetDefaultCondition();
            RuleDetermine rule = new RuleDetermine();
            if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行 || rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC || rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
            {
                hidn_condition.Value += " ";
            }
            else
            {
                hidn_condition.Value += " ";
                // hidn_condition.Value += " and substring(a.VISITDATE,1,6)='" + DateTime.Now.ToString("yyyyMM") + "' ";
            }
        }
    }

    private void GetDefaultCondition()
    {
        drList_Crc.Visible = false;
        lab_CrcDisplay.Visible = false;
        RuleDetermine rule = new RuleDetermine();
        hidn_condition.Value = " ";
        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            hidn_condition.Value += " and a.BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC)
        {
            hidn_condition.Value += "  and a.BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行)
        {
            hidn_conditionBrno.Value = " ";
            drList_Crc.Visible = true;
            lab_CrcDisplay.Visible = true;
        }
        else
        {
            hidn_condition.Value += " and ( a.MGREMPNO = '" + hidn_EmpNo.Value + "'  or  a.EDITEMPNO='" + hidn_EmpNo.Value + "' or a.SERNO in (select SERNO from CUSTMGR_CUSTLIST where MGREMPNO='" + hidn_EmpNo.Value + "') ) ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
    }

    private void GetDefaultBrnoStatus()
    {
        RuleDetermine rule = new RuleDetermine();
        hidn_condition.Value = " ";
        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC)
        {
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行)
        {
            hidn_conditionBrno.Value = " ";
        }
        else
        {
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
    }

    protected void btn_Query_Click(object sender, EventArgs e)
    {
        GetDefaultCondition();
        DateTime dateTimeStart, dateTimeEnd;
        string tempCondition = hidn_condition.Value;
        if (txt_VisitDateStart.Text.Trim().Length != 0 || txt_VisitDateEnd.Text.Trim().Length != 0)
        {
            if (DateTime.TryParseExact(txt_VisitDateStart.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeStart) == false)
            {
                lab_State.Text = "開始日期格式有誤!";
                return;
            }
            if (DateTime.TryParseExact(txt_VisitDateEnd.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeEnd) == false)
            {
                lab_State.Text = "結束日期格式有誤!";
                return;
            }
            TimeSpan ts = dateTimeStart - dateTimeEnd;
            if (ts.Days > 0)
            {
                lab_State.Text = "開始日期必須大於等於結束日期!";
                return;
            }
        }

        if (txt_VisitDateStart.Text.Trim().Length != 0 && txt_VisitDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.VISITDATE BETWEEN '" + txt_VisitDateStart.Text.Trim() + "' and  '" + txt_VisitDateEnd.Text.Trim() + "' ";
        }
        else
        {
            switch (rbtn_Useful.SelectedValue)
            {
                case "0": hidn_condition.Value += " and substring(a.VISITDATE,1,6)='" + DateTime.Now.ToString("yyyyMM") + "' ";
                    break;
                case "1": hidn_condition.Value += " and substring(a.VISITDATE,1,6)='" + DateTime.Now.AddMonths(-1).ToString("yyyyMM") + "' ";
                    break;
                default: break;
            }
        }
        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or isnull(b.ACCOUNTNAME, c.ACCOUNTNAME)  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOSUB.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( isnull(b.GROUPNO, c.GROUPNO) like '%" + txt_SERNOSUB.Text.Trim() + "%' or isnull (b.GROUPNAME, c.GROUPNAME)  like '%" + txt_SERNOSUB.Text.Trim() + "%' )  ";
        }
        if (rbtn_Position.SelectedValue != "5")
        {
            hidn_condition.Value += " and a.EDITPOSTION=" + rbtn_Position.SelectedValue + " ";
        }


        if (drList_Crc.SelectedValue != "-1" && drList_Crc.Visible == true)
        {
            hidn_condition.Value += " and a.BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + drList_Crc.SelectedValue + "' ) ";
        }

        if (drList_Brno.SelectedValue != "-1")
        {
            hidn_condition.Value += " and a.BRNO='" + drList_Brno.SelectedValue + "' ";
            if (drList_MgrId.SelectedValue != "-1")
            {
                hidn_condition.Value += " and a.EDITEMPNO='" + drList_MgrId.SelectedValue + "' ";
            }
        }
        //是否為新戶
        if (rbtn_NewCust.SelectedValue != "-1")
        {
            hidn_condition.Value += " and a.NEWCUST='" + rbtn_NewCust.SelectedValue + "' ";
        }

        //switch (rbList_OrderWay.SelectedValue)
        //{
        //    case "1": hidn_condition.Value += " order by a.VISITDATE desc ";
        //        break;
        //    case "2": hidn_condition.Value += " ORDER BY ACCOUNTNAME ";
        //        break;
        //    case "3": hidn_condition.Value += " ORDER BY a.EDITEMPNO ";
        //        break;
        //    default: break;
        //}
        dsQueryDiary.Select(DataSourceSelectArguments.Empty);
        lab_State.Text = "查詢完畢!";
    }
    protected void dsQueryDiary_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        /*
                StringBuilder sb = new StringBuilder();
                sb.AppendLine(e.Command.CommandText + "<br/>");
                for (int i = 0; i < e.Command.Parameters.Count; i++)
                {
                    sb.AppendLine("參數 (" + i.ToString() + "):" + e.Command.Parameters[i].Value + "<br/>");

                }
                Response.Write(sb.ToString());
                e.Cancel = true;
        */
    }
    protected void btn_ConfirmEdit_Click(object sender, EventArgs e)
    {
        //ResetCustState();

        //TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
        //Label lab_CustState = FormView1.FindControl("lab_CustState") as Label;
        //dsCheckCustList.SelectParameters["SERNO"].DefaultValue = txt_SerNoBind.Text.Trim();
        //DataView dv = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);
        //if (dv.Table.Rows[0][0].ToString() != "0")
        //{
        //    GetSerNoFromCustList();
        //    lab_CustState.Text = "從現有客戶選出!";
        //}
        //else
        //{

        //    FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        //    if (FormView2.CurrentMode == FormViewMode.Edit)
        //    {
        //        FormView2.ChangeMode(FormViewMode.Insert);
        //    }
        //    FormView2.DataBind();
        //    lab_CustState.Text = "新增客戶資料!";
        //}
    }
    protected void btn_ExportExcel_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("日誌總表查詢_" + DateTime.Now.ToString("yyyyMMdd") + ".xls", GridView1);
    }
    protected void drList_Crc_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drList_Crc.SelectedValue == "-1")
        {
            GetDefaultBrnoStatus();
        }
        else
        {
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + drList_Crc.SelectedValue + "') ";
        }
        drList_Brno.DataBind();
        
    }
    protected void drList_Brno_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drList_Crc.SelectedValue == "-1")
        {
            GetDefaultBrnoStatus();
            drList_Brno.DataBind();
            return;
        }
        //TODO:查詢分行代號該分行的登錄員 hidden_brno 
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (TableCell item in e.Row.Cells)
            {
                item.Attributes.Add("style", @"mso-number-format: \@");

            }
        }
    }
    protected void LabelStateFinished(object sender, EventArgs e)
    {

    }
    protected void LabelStateFinished(object sender, GridViewRowEventArgs e)
    {

    }
}

