using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SubEnterpriseModify : System.Web.UI.Page
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
            
            hidn_ENTSERNOSUB.Value = Request.QueryString["ENTSERNOSUB"].ToString();
            hidn_GROUPNO.Value = Request.QueryString["GROUPNO"].ToString();
            
            // 集團資料
            DataTable dtGroupSource = ((DataView)dsGroupQuery.Select(DataSourceSelectArguments.Empty)).Table;
            txt_GroupCRC.Text = dtGroupSource.Rows[0]["CRCNO"].ToString();
            txt_GroupMgrBrno.Text = dtGroupSource.Rows[0]["MGRBRNO"].ToString();
            txt_GroupNo.Text = dtGroupSource.Rows[0]["GROUPNO"].ToString();
            txt_GroupName.Text = dtGroupSource.Rows[0]["GROUPNAME"].ToString();
            
            //分子企業資料
            DataTable dtSubEntprise = ((DataView)dsSubEntprise.Select(DataSourceSelectArguments.Empty)).Table;
            lab_Date.Text = dtSubEntprise.Rows[0]["BUILDDATE"].ToString();
            txt_EntSerNoSub.Text = dtSubEntprise.Rows[0]["ENTSERNOSUB"].ToString();
            txt_EntNameSub.Text = dtSubEntprise.Rows[0]["ENTNAMESUB"].ToString();
            txt_SubBrno.Text = dtSubEntprise.Rows[0]["MGRBRNO"].ToString();
            GetCrcAndBrnoDisplay();

            btn_BackPage.Attributes["onclick"] = "history.back(); event.returnValue=false;";
        }

    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (CheckTextContent() == false)
        {
            lab_State.Text = "分子企業統編及名稱為必填欄位!";
            return;
        }
        if (drList_Crc.SelectedIndex == -1 || drList_Crc.SelectedValue == "-1")
        {
            lab_State.Text = "請選擇分子企業所屬CRC!";
            return;
        }
        if (drList_Brno.SelectedIndex == -1 || drList_Brno.SelectedValue == "-1")
        {
            lab_State.Text = "請選擇分子企業所屬分行!";
            return;
        }
        try
        {
            dsSubEntprise.Update();
            GridView2.DataBind();
            lab_State.Text = "修改成功!";
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            if (ex.Message.Contains("String or binary data would be truncated"))
            {
                lab_State.Text = "資料長度太長，請修改後新增!";
            }
            else if (ex.Message.Contains("Violation of PRIMARY KEY") == true)
            {
                lab_State.Text = "已有相同資料存在(同一分子企業統編)!";
            }
            else
            {
                lab_State.Text = ex.ToString();
            }
        }
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
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        GridView2.DataBind();
    }
    protected void txt_SubBrno_TextChanged(object sender, EventArgs e)
    {
        GetCrcAndBrnoDisplay();
    }

    private void GetCrcAndBrnoDisplay()
    {
        try
        {
            drList_Brno.SelectedValue = txt_SubBrno.Text.Trim();
            drList_Crc.DataBind();
            drList_Crc.SelectedIndex = 1;
        }
        catch (System.ArgumentOutOfRangeException ex)
        {
            lab_State.Text = "請輸入正確的分行代號!";
            return;
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label lab_ENTSERNOSUB = GridView2.Rows[index].FindControl("lab_ENTSERNOSUB") as Label;
            dsSubEntpriseDataDetail.DeleteParameters["ENTSERNOSUB"].DefaultValue = lab_ENTSERNOSUB.Text.Trim();
        }
    }
}