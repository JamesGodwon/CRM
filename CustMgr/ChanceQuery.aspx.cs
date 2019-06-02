using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;

public partial class ChanceQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];
            lab_QueryDate.Text = "查詢日：" + DateTime.Now.ToString("yyyy/MM/dd");

            GetDefaultCondition();
            hidn_condition.Value += " AND substring(a.RECORDDATE,1,6) BETWEEN '" + DateTime.Now.AddMonths(-2).ToString("yyyyMM") + "' AND '" + DateTime.Now.ToString("yyyyMM") + "' AND a.ENDPROJECT='N' ";
        }
    }

    private void GetDefaultCondition()
    {
        drList_Crc.Visible = false;
        lab_CrcDisplay.Visible = false;
        RuleDetermine rule = new RuleDetermine();
        hidn_condition.Value = " ";
        hidn_condition0.Value = " ";

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
            hidn_condition.Value += " and ( a.EDITEMPNO = '" + hidn_EmpNo.Value + "'  or  d.MGREMPNO='" + hidn_EmpNo.Value + "'   or   e.MGREMPNO='" + hidn_EmpNo.Value + "' ) ";
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

        switch (rbtn_OppEndStatus.SelectedValue)
        {
            case "0":
                hidn_condition.Value += " AND a.ENDPROJECT='N' ";
                if (txt_VisitDateStart.Text.Trim().Length != 0 && txt_VisitDateEnd.Text.Trim().Length != 0)
                {
                    hidn_condition.Value += " AND a.OPPNO in (SELECT OPPNO  from CUSTMGR_DIARYOPPMAPPING WHERE substring(DIARYNO,13,8) BETWEEN '" + txt_VisitDateStart.Text.Trim() + "' AND '" + txt_VisitDateEnd.Text.Trim() + "') ";
                }
                else
                {
                    if (rbtn_NotEndPeiod.SelectedValue == "0")
                    {
                        hidn_condition.Value += " AND substring(a.RECORDDATE,1,6) BETWEEN '" + DateTime.Now.AddMonths(-2).ToString("yyyyMM") + "' AND '" + DateTime.Now.ToString("yyyyMM") + "' ";
                    }
                    if (rbtn_NotEndPeiod.SelectedValue == "1")
                    {
                        hidn_condition.Value += " AND substring(a.RECORDDATE,1,6) < '" + DateTime.Now.AddMonths(-2).ToString("yyyyMM") + "' ";
                    }
                }
                break;

            case "1": hidn_condition.Value += " AND a.ENDPROJECT='Y' ";
                if (txt_VisitDateStart.Text.Trim().Length != 0 && txt_VisitDateEnd.Text.Trim().Length != 0)
                {
                    hidn_condition.Value += " AND a.OPPNO in (SELECT OPPNO  from CUSTMGR_DIARYOPPMAPPING WHERE substring(DIARYNO,13,8) BETWEEN '" + txt_VisitDateStart.Text.Trim() + "' AND '" + txt_VisitDateEnd.Text.Trim() + "') ";
                }
                break;

            case "2":
                if (txt_VisitDateStart.Text.Trim().Length != 0 && txt_VisitDateEnd.Text.Trim().Length != 0)
                {
                    hidn_condition.Value += " AND a.OPPNO in (SELECT OPPNO  from CUSTMGR_DIARYOPPMAPPING WHERE substring(DIARYNO,13,8) BETWEEN '" + txt_VisitDateStart.Text.Trim() + "' AND '" + txt_VisitDateEnd.Text.Trim() + "') ";
                }
                break;
            default:
                //hidn_condition.Value += " AND a.ENDPROJECT='N' ";
                break;
        }

        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or isnull(d.ACCOUNTNAME, e.ACCOUNTNAME)  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOSUB.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( isnull(d.GROUPNO, e.GROUPNO) like '%" + txt_SERNOSUB.Text.Trim() + "%' or isnull (d.GROUPNAME, e.GROUPNAME)  like '%" + txt_SERNOSUB.Text.Trim() + "%' )  ";
        }
        if (rbtn_Position.SelectedValue != "5")
        {
            hidn_condition.Value += "  AND a.EDITEMPNO in(SELECT EDITEMPNO FROM CUSTMGR_DIARY WHERE EDITPOSTION =" + rbtn_Position.SelectedValue + " AND CUSTMGR_DIARY.EDITEMPNO = a.EDITEMPNO) ";
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
        if (drList_OppType.SelectedIndex != -1 && drList_OppType.SelectedValue != "-1")
        {
            hidn_condition.Value += " and a.OPPTYPE='" + drList_OppType.SelectedValue + "' ";
            hidn_condition0.Value = " and CUSTMGR_OPPORTUNITIES.OPPTYPE='" + drList_OppType.SelectedValue + "' ";
        }
        dsQueryOpp.Select(DataSourceSelectArguments.Empty);
        lab_State.Text = "查詢完畢!";
    }
    protected void dsQueryDiary_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //StringBuilder sb = new StringBuilder();
        //sb.AppendLine(e.Command.CommandText + "<br/>");
        //for (int i = 0; i < e.Command.Parameters.Count; i++)
        //{
        //    sb.AppendLine("參數 (" + i.ToString() + "):" + e.Command.Parameters[i].Value + "<br/>");

        //}
        //Response.Write(sb.ToString());
        //e.Cancel = true;
    }
    protected void rbtn_OppEndStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtn_OppEndStatus.SelectedValue == "0")
        {
            rbtn_NotEndPeiod.Visible = true;
        }
        else
        {
            rbtn_NotEndPeiod.Visible = false;
        }
    }

    protected void btn_ExportExcel_Click(object sender, EventArgs e)
    {
        GridViewExportUtil.Export("商機追蹤總表查詢_" + DateTime.Now.ToString("yyyyMMdd") + ".xls", GridView1);
    }
    private void GetDefaultBrnoStatus()
    {
        RuleDetermine rule = new RuleDetermine();

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
}