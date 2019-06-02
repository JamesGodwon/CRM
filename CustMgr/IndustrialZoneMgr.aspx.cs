using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IndustrialZoneMgr : System.Web.UI.Page
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

            Link_Bank.NavigateUrl = "~/Program/CustMgr/BankMgr.aspx?EMPID=" + hidn_EmpNo.Value;
        }
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (CheckTextContent() == false)
        {
            lab_State.Text = "請填寫工業區名稱!";
            return;
        }
        if (drListCity.SelectedIndex == -1 || drListCity.SelectedValue == "請選擇")
        {
            lab_State.Text = "請選擇縣市!";
            return;
        }
        if (drListSection.SelectedIndex == -1 || drListSection.SelectedValue == "請選擇")
        {
            lab_State.Text = "請選擇鄉鎮市區!";
            return;
        }
        try
        {
            dsMgrIndustrialZone.Insert();
            lab_State.Text = "新增成功!";
            GridView1.DataBind();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            if (ex.Message.Contains("String or binary data would be truncated"))
            {
                lab_State.Text = "資料長度太長，請修改後新增!";
            }
            else if (ex.Message.Contains("Violation of PRIMARY KEY") == true)
            {
                lab_State.Text = "已有相同資料存在(同一個工業區名稱)!";
            }
            else
            {
                lab_State.Text = ex.ToString();
            }
        }
    }
    private bool CheckTextContent()
    {
        //foreach (Control item in this.form1.Controls)
        //{
        //    if (item.GetType().ToString().Contains("TextBox") == true &&
        //        ((TextBox)item).Text.Trim().Length == 0)
        //    {
        //        return false;
        //    }
        //}
        if (txt_ZoneName.Text.Trim().Length == 0)
        {
            return false;
        }
        return true;
    }

    protected void drListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetLocation();
    }

    private void GetLocation()
    {
        hidn_Location.Value = drListCity.SelectedValue + drListSection.SelectedValue;
    }
    protected void drListSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetLocation();
    }
    protected void txt_MgrBrno_TextChanged(object sender, EventArgs e)
    {
        try
        {
            drList_Brno.SelectedValue = txt_MgrBrno.Text;
        }
        catch (System.ArgumentOutOfRangeException ex)
        {
            lab_State.Text = "請輸入正確的分行代號!";
            return;
        }
    }
}