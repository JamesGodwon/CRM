using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;

public partial class DiaryMonthlyReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Redirect("SysMaintainExpire.aspx");
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];

            txt_VisitYear.Text = DateTime.Now.ToString("yyyy");
            GetDefaultCondition();
            SyncQueryCondition();            
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
    private void GetDefaultCondition()
    {
        drList_Crc.Visible = false;
        lab_CrcDisplay.Visible = false;


        RuleDetermine rule = new RuleDetermine();

        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            hidn_condition.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC)
        {
            hidn_condition.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";

        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行)
        {
            hidn_condition.Value = " ";
            hidn_conditionBrno.Value = " ";
            drList_Crc.Visible = true;
            lab_CrcDisplay.Visible = true;

        }
        else
        {
            hidn_condition.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
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
    protected void btn_Query_Click(object sender, EventArgs e)
    {        
        GetDefaultCondition();
        string tempCondition = hidn_condition.Value;
        DateTime dateTimeStart;
        if (txt_VisitYear.Text.Trim().Length != 0)
        {
            if (DateTime.TryParseExact(txt_VisitYear.Text, "yyyy", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeStart) == false)
            {
                lab_State.Text = "年度格式有誤!";
                return;
            }
            int monthPeriod = int.Parse(txt_VisitDateStart.SelectedValue) - int.Parse(txt_VisitDateEnd.SelectedValue);
            if (monthPeriod > 0)
            {
                lab_State.Text = "開始月份必須大於等於結束月份!";
                return;
            }
        }

        if (drList_Crc.SelectedValue != "-1" && drList_Crc.Visible == true)
        {
            hidn_condition.Value += " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + drList_Crc.SelectedValue + "' ) ";
        }

        if (drList_Brno.SelectedValue != "-1")
        {
            hidn_condition.Value += " and BRNO='" + drList_Brno.SelectedValue + "' ";
        }
        SyncQueryCondition();
        GetColumns();
        lab_QueryTitle.Text = drList_ReportType.SelectedItem.Text;
        btn_ExcelDownload.Enabled =true;
        switch(drList_ReportType.SelectedValue)
        {
            case "1": GridView1.DataSourceID = dsDiaryLisMain.UniqueID;
                if (hidn_BRNO.Value != "0201")
                {
                    btn_ExcelDownload.Enabled = false;
                }
                break;
            case "2": GridView1.DataSourceID = dsDiaryLisByBrno.UniqueID;
                break;
            case "3": GridView1.DataSourceID = dsDiaryLisByCustSerNo.UniqueID;
                break;
            case "4": GridView1.DataSourceID = dsDiaryLisReport.UniqueID;
                break;
        }
        GridView1.DataBind();        
        lab_State.Text = "查詢完畢!";
    }
    private void SyncQueryCondition()
    {
        hidn_condition0.Value = hidn_condition.Value;
        hidn_condition1.Value = hidn_condition.Value;
        hidn_condition2.Value = hidn_condition.Value;
    }
    protected void btn_ExcelDownload_Click(object sender, EventArgs e)
    {
        //法一 : 只匯出內容
        GridViewExportUtil.Export("DiaryMonthList" + DateTime.Now.ToString("yyyyMMdd") + ".xls", GridView1);
    }

    private void GetColumns()
    {
        string monthColumns = string.Empty;
        int monthStart = int.Parse(txt_VisitDateStart.SelectedValue);
        int monthEnd = int.Parse(txt_VisitDateEnd.SelectedValue);
        for (int i = monthStart; i <= monthEnd; i++)
        {
            monthColumns += " , w.[" + i.ToString() + "月] ";
        }       
        dsDiaryLisMain.SelectParameters["columnname"].DefaultValue = monthColumns;
        dsDiaryLisByBrno.SelectParameters["columnname"].DefaultValue = monthColumns;        
        dsDiaryLisByCustSerNo.SelectParameters["columnname"].DefaultValue = monthColumns;
        dsDiaryLisReport.SelectParameters["columnname"].DefaultValue = monthColumns;
    }

    protected void dsDiaryLisMain_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void dsDiaryLisByBrno_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
}