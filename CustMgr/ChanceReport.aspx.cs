using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Text;

public partial class ChanceReport : System.Web.UI.Page
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
            GetDefaultCondition();
            GetDefaultDisplay();
            hidn_condition.Value += " and substring(z.STARTDATE,1,6)='" + DateTime.Now.ToString("yyyyMM") + "' ";
            SyncQueryCondition();
        }
    }
    private void GetDefaultCondition()
    {
        drList_Crc.Visible = false;
        lab_CrcDisplay.Visible = false;
        LinkBtn_ReportExport.Visible = true;

        RuleDetermine rule = new RuleDetermine();

        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            hidn_condition.Value = " and a.BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC)
        {
            hidn_condition.Value = " and a.BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
            LinkBtn_ReportExport.Visible = true;
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行)
        {
            hidn_condition.Value = " ";
            hidn_conditionBrno.Value = " ";
            drList_Crc.Visible = true;
            lab_CrcDisplay.Visible = true;
            LinkBtn_ReportExport.Visible = true;
        }
        else
        {
            hidn_condition.Value = " and a.BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
    }
    protected void dsCustLisMain_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void btn_Query_Click(object sender, EventArgs e)
    {
        GetDefaultCondition();
        string tempCondition = hidn_condition.Value;
        DateTime dateTimeStart, dateTimeEnd;
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
            hidn_condition.Value += " and  z.STARTDATE BETWEEN '" + txt_VisitDateStart.Text.Trim() + "' and  '" + txt_VisitDateEnd.Text.Trim() + "' ";
        }
        else
        {
            switch (rbtn_Useful.SelectedValue)
            {
                case "0": hidn_condition.Value += " and substring(z.STARTDATE,1,6)='" + DateTime.Now.ToString("yyyyMM") + "' ";
                    break;
                case "1": hidn_condition.Value += " and substring(z.STARTDATE,1,6)='" + DateTime.Now.AddMonths(-1).ToString("yyyyMM") + "' ";
                    break;
                default: break;
            }
        }

        if ((rbtn_EndProject.SelectedIndex != -1 || rbtn_EndProject.SelectedIndex != 0) && rbtn_EndProject.SelectedValue != "0")
        {
            hidn_condition.Value += " and a.ENDPROJECT='" + rbtn_EndProject.SelectedValue + "' ";
        }

        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( isnull(b.SERNO, c.SERNO)  like '%" + txt_SERNO.Text.Trim() + "%' or isnull(b.ACCOUNTNAME, c.ACCOUNTNAME)  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOMAIN.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( isnull(b.ENTSERNOMAIN, c.ENTSERNOMAIN) like '%" + txt_SERNOMAIN.Text.Trim() + "%' or isnull(b.ENTNAMEMAIN, c.ENTNAMEMAIN)  like '%" + txt_SERNOMAIN.Text.Trim() + "%' )  ";


        }

        if (txt_SERNOSUB.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( isnull(b.GROUPNO, c.GROUPNO) like '%" + txt_SERNOMAIN.Text.Trim() + "%' or isnull(b.GROUPNAME, c.GROUPNAME)  like '%" + txt_SERNOMAIN.Text.Trim() + "%' )  ";
        }

        if (drList_Crc.SelectedValue != "-1" && drList_Crc.Visible == true)
        {
            hidn_condition.Value += " and a.BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + drList_Crc.SelectedValue + "' ) ";
        }

        if (drList_Brno.SelectedValue != "-1")
        {
            hidn_condition.Value += " and a.BRNO='" + drList_Brno.SelectedValue + "' ";
        }
        SyncQueryCondition();

        //dsChanceLisMain.Select(DataSourceSelectArguments.Empty);
        //dsChanceLisByBrno.Select(DataSourceSelectArguments.Empty);
        //dsChanceLisByCustSerNo.Select(DataSourceSelectArguments.Empty);
        //dsChanceLisReport.Select(DataSourceSelectArguments.Empty);
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();
        GridView4.DataBind();
        GetDefaultDisplay();
        lab_State.Text = "查詢完畢!";
    }

    private void SyncQueryCondition()
    {
        hidn_condition0.Value = hidn_condition.Value;
        hidn_condition1.Value = hidn_condition.Value;
        hidn_condition2.Value = hidn_condition.Value;
    }

    private void GetDefaultDisplay()
    {
        lab_QueryTitle.Visible = true;
        GridView1.Visible = true;
        lab_BrnoTitle.Visible = false;
        GridView2.Visible = false;
        lab_CustTitle.Visible = false;
        GridView3.Visible = false;
        lab_ReportPring.Visible = false;
        GridView4.Visible = false;
        btn_ExcelDownload.Visible = false;
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        //hidn_BrnoList.Value = string.Empty;
        //List<string> brnoList = new List<string>();
        //foreach (GridViewRow gv in GridView1.Rows)
        //{
        //    if (gv.RowType == DataControlRowType.DataRow)
        //    {
        //        Label lab_Brno = gv.FindControl("lab_Brno") as Label;
        //        brnoList.Add(lab_Brno.Text.Trim());
        //    }
        //}
        //hidn_BrnoList.Value = (brnoList.Count == 0) ? string.Empty : string.Join(",", brnoList.ToArray());
        //GridView2.DataBind();
        //GridView3.DataBind();
        //GridView4.DataBind();
    }
    protected void LinkBtn_BrnoDetail_Click(object sender, EventArgs e)
    {
        //Response.Redirect("http://10.100.7.214/ReportServer?/CustMgrReport/ChanceReportQuery&condition=" + hidn_condition.Value);
        GetDefaultDisplay();
        GridView1.Visible = false;
        lab_QueryTitle.Visible = false;
        GridView2.Visible = true;
        lab_BrnoTitle.Visible = true;
    }
    protected void LinkBtn_CustDetail_Click(object sender, EventArgs e)
    {
        GetDefaultDisplay();
        GridView1.Visible = false;
        lab_QueryTitle.Visible = false;
        GridView3.Visible = true;
        lab_CustTitle.Visible = true;
    }
    protected void LinkBtn_QueryResultDisplay_Click(object sender, EventArgs e)
    {
        GetDefaultDisplay();
    }
    protected void btn_ExcelDownload_Click(object sender, EventArgs e)
    {
        //法一 : 只匯出內容
        GridViewExportUtil.Export("ChanceList" + DateTime.Now.ToString("yyyyMMdd") + ".xls", GridView4);
    }
    protected void LinkBtn_ReportExport_Click(object sender, EventArgs e)
    {
        GetDefaultDisplay();
        GridView1.Visible = false;
        lab_QueryTitle.Visible = false;
        lab_ReportPring.Visible = true;
        GridView4.Visible = true;
        btn_ExcelDownload.Visible = true;
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
    protected void dsChanceLisByBrno_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (TableCell item in e.Row.Cells)
            {
                item.Attributes.Add("style", @"mso-number-format: \@");

            }
        }
    }
    protected void dsChanceLisByCustSerNo_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            for (int i = 1; i < 7; i++)
            {
                e.Row.Cells[e.Row.Cells.Count - i].BackColor = System.Drawing.Color.Gray;
            }
        }
    }
    protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            for (int i = 1; i < 7; i++)
            {
                e.Row.Cells[e.Row.Cells.Count - i].BackColor = System.Drawing.Color.Gray;
            }
        }
    }
    protected void GridView3_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            for (int i = 2; i < 8; i++)
            {
                e.Row.Cells[e.Row.Cells.Count - i].BackColor = System.Drawing.Color.Gray;
            }
        }
    }
    protected void GridView4_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            for (int i = 2; i < 8; i++)
            {
                e.Row.Cells[e.Row.Cells.Count - i].BackColor = System.Drawing.Color.Gray;
            }
        }
    }
}