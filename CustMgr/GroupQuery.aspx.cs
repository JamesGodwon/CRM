using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class GroupQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request);

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];
            Link_AddGroup.NavigateUrl = "~/Program/CustMgr/GroupAdd.aspx?EMPID=" + hidn_EmpNo.Value; hidn_condition.Value = " ";
        }
    }
    protected void btn_Query_Click(object sender, EventArgs e)
    {
        hidn_condition.Value = " ";
        if (txt_GroupNo.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.GROUPNO like '%" + txt_GroupNo.Text.Trim() + "%' or a.GROUPNAME like '%" + txt_GroupNo.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOMAIN.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( a.ENTSERNOMAIN like '%" + txt_SERNOMAIN.Text.Trim() + "%' or a.ENTNAMEMAIN like '%" + txt_SERNOMAIN.Text.Trim() + "%' )  ";
        }
        if (txt_SERNOSUB.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and a.GROUPNO in (select GROUPNO from CUSTMGR_SUBENTERPRISE where ENTSERNOSUB like '%" + txt_SERNOSUB.Text.Trim() + "%' or ENTNAMESUB  like '%" + txt_SERNOSUB.Text.Trim() + "%') ";
        }
        if (txt_MgrBrno.Text.Trim().Length!=0)
        {
            hidn_condition.Value += " and a.MGRBRNO='" + txt_MgrBrno.Text.Trim() + "' ";
        }
        if (drList_Crc.SelectedIndex != 0)
        {
            hidn_condition.Value += " and a.CRCNO='" + drList_Crc.SelectedValue + "' ";
        }
        dsGroupList.Select(DataSourceSelectArguments.Empty);
        //GridView1.DataBind();
        lab_State.Text = "查詢完畢!";
    }
    private bool CheckTextContent()
    {
        foreach (Control item in this.form1.Controls)
        {
            if (item.GetType().ToString().Contains("TextBox") == true &&
                ((TextBox)item).Text.Trim().Length == 0)
            {
                return false;
            }
        }
        return true;
    }

    protected void rbtn_Position_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtn_Position.SelectedIndex == 1)
        {
            txt_GroupNo.Visible = true;
            lab_GroupNo.Visible = true;
        }
        else
        {
            txt_GroupNo.Text = string.Empty;
            txt_SERNOMAIN.Text = string.Empty;
            txt_SERNOSUB.Text = string.Empty;
            //drList_Brno.SelectedIndex = 0;
            drList_Crc.SelectedIndex = 0;
            txt_GroupNo.Visible = false;
            lab_GroupNo.Visible = false;

        }
    }
    protected void dsGroupList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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