using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class CustQuery : System.Web.UI.Page
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
            //處理timeout
            hidn_condition.Value = " and 1<>1";
        }
    }

    private void GetDefaultCondition()
    {
        drList_Crc.Visible = false;
        lab_CrcDisplay.Visible = false;
        btn_ExportExcel.Visible = false;

        RuleDetermine rule = new RuleDetermine();

        btn_ConverToUseLessTrue.Visible = false;
        Link_AddGroup0.Visible = false;
        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            hidn_condition.Value = " and a.USEFUL='Y'  and a.BRNO='" + hidn_BRNO.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
            btn_ConverToUseLessTrue.Visible = true;
            Link_AddGroup0.Visible = true;
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.CRC)
        {
            hidn_condition.Value = " and a.USEFUL='Y'  and a.BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
            hidn_conditionBrno.Value = " and BRNO in ( SELECT BRNO FROM chb_pub.dbo.crc_rel_br	WHERE CRCNO ='" + hidn_BRNO.Value + "') ";
        }
        else if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.總行)
        {
            btn_ExportExcel.Visible = true;
            hidn_condition.Value = " and a.USEFUL='Y' ";
            hidn_conditionBrno.Value = " ";
            drList_Crc.Visible = true;
            lab_CrcDisplay.Visible = true;
            if (hidn_EmpNo.Value == "155953")
            {
                Link_AddGroup0.Visible = true;

                btn_ConverToUseLessTrue.Visible = true;
            }
            if (hidn_BRNO.Value == "0201")
            {

                btn_ConverToUseLessTrue.Visible = true;
            }
        }
        else
        {
            hidn_condition.Value = " and a.USEFUL='Y'  and a.MGREMPNO = '" + hidn_EmpNo.Value + "' ";
            hidn_conditionBrno.Value = " and BRNO='" + hidn_BRNO.Value + "' ";
        }
    }
    protected void btn_Query_Click(object sender, EventArgs e)
    {
        GetResultFromKeyin();
        lab_State.Text = "查詢完畢!";
    }

    private void GetResultFromKeyin()
    {
        GetDefaultCondition();        
        string tempCondition = hidn_condition.Value;
        switch (rbtn_Useful.SelectedValue)
        {
            case "2": hidn_condition.Value = tempCondition.Replace("and a.USEFUL='Y'", " and a.USEFUL='N' ");
                break;
            case "3": hidn_condition.Value = tempCondition.Replace("and a.USEFUL='Y'", " ");
                break;
            default: break;
        }
        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or a.ACCOUNTNAME  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOSUB.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.GROUPNO like '%" + txt_SERNOSUB.Text.Trim() + "%' or a.GROUPNAME  like '%" + txt_SERNOSUB.Text.Trim() + "%' )  ";
        }
        if (rbtn_Position.SelectedValue != "5")
        {
            hidn_condition.Value += " and a.MGREMPNO in ( select MGREMPNO from CUSTMGR_EDITMGR  where  POSITION=" + rbtn_Position.SelectedValue + ") ";
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
                hidn_condition.Value += " and a.MGREMPNO='" + drList_MgrId.SelectedValue + "' ";
            }
        }
        dsCustListQuery.Select(DataSourceSelectArguments.Empty);
    }
    protected void dsCustListQuery_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        RuleDetermine rule = new RuleDetermine();
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                HyperLink link = row.FindControl("Link_AccountName") as HyperLink;
                Label serno = row.FindControl("Lab_SerNo") as Label;
                Label brno = row.FindControl("lab_Brno") as Label;
                link.NavigateUrl = "CustListModify.aspx?SERNO=" + serno.Text.Trim() + "&BRNO=" + brno.Text.Trim();
                CheckBox ck = row.FindControl("ck_MgrSelected") as CheckBox;
                if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上 || hidn_BRNO.Value == "0201" || hidn_EmpNo.Value == "155953")
                {
                    ck.Visible = true;
                }
                else
                {
                    ck.Visible = false;
                }

            }
        }

    }
    //protected void btn_ConverToUseLess_Click(object sender, EventArgs e)
    //{
    //    StringBuilder sb = new StringBuilder();
    //    List<string> accountList = new List<string>();
    //    foreach (GridViewRow gv in GridView1.Rows)
    //    {
    //        if (gv.RowType == DataControlRowType.DataRow)
    //        {
    //            CheckBox ck = gv.FindControl("ck_MgrSelected") as CheckBox;
    //            HyperLink link = gv.FindControl("Link_AccountName") as HyperLink;
    //            if (ck.Checked == true)
    //            {
    //                accountList.Add(link.Text);
    //            }
    //        }
    //    }
    //    sb.Append("<br/>" + string.Join("<br/>", accountList.ToArray()) + "<br/>");
    //    sb.Append("共有" + accountList.Count.ToString() + "戶，請再次確認是否轉入無效戶。");
    //    lab_State2.Text = sb.ToString();
    //    btn_ConverToUseLessTrue.Enabled = (accountList.Count == 0) ? false : true;        
    //}


    protected void btn_ConverToUseLessTrue_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gv in GridView1.Rows)
        {
            if (gv.RowType == DataControlRowType.DataRow)
            {
                CheckBox ck = gv.FindControl("ck_MgrSelected") as CheckBox;
                Label serNo = gv.FindControl("lab_SerNo") as Label;
                Label brNo = gv.FindControl("lab_BrNo") as Label;
                DropDownList drSelectedMgrid = gv.FindControl("drList_MgrId") as DropDownList;
                if (ck.Checked == true)
                {
                    dsUsefulChange.UpdateParameters["BRNO"].DefaultValue = brNo.Text.Trim();
                    dsUsefulChange.UpdateParameters["SERNO"].DefaultValue = serNo.Text.Trim();
                    dsUsefulChange.Update();
                }
            }
        }
        GridView1.DataBind();
        lab_State2.Text = "轉入無效戶成功!";
    }
    protected void btn_ExportExcel_Click(object sender, EventArgs e)
    {
        GetResultFromKeyin();
        GridView1.AllowPaging = false;
        GridView1.DataBind();
        GridViewExportUtil.Export("客戶名單_" + DateTime.Now.ToString("yyyyMMdd") + ".xls", GridView1);
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
    protected void ck_MgrSelected_CheckedChanged(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        List<string> accountList = new List<string>();
        foreach (GridViewRow gv in GridView1.Rows)
        {
            if (gv.RowType == DataControlRowType.DataRow)
            {
                CheckBox ck = gv.FindControl("ck_MgrSelected") as CheckBox;
                HyperLink link = gv.FindControl("Link_AccountName") as HyperLink;
                if (ck.Checked == true)
                {
                    accountList.Add(link.Text);
                }
            }
        }
        sb.Append("<br/><b>轉入無效戶名單</b><br/>" + string.Join("<br/>", accountList.ToArray()) + "<br/>");
        sb.Append("共有" + accountList.Count.ToString() + "戶，請再次確認是否轉入無效戶。");
        lab_State2.Text = (accountList.Count == 0) ? string.Empty : sb.ToString();
        btn_ConverToUseLessTrue.Enabled = (accountList.Count == 0) ? false : true;
    }
}