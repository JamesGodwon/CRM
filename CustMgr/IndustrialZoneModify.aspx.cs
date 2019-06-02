using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class IndustrialZoneModify : System.Web.UI.Page
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
            btn_BackPage.Attributes["onclick"] = "history.back(); event.returnValue=false;";
            hidn_ZONENAME.Value = Request.QueryString["ZONENAME"].ToString();
            GetZoneDataDisplay();            
        }
    }

    private void GetZoneDataDisplay()
    {
        DataTable dtSource = ((DataView)dsMgrIndustrialZone.Select(DataSourceSelectArguments.Empty)).Table;
        lab_ZoneName.Text = dtSource.Rows[0]["ZONENAME"].ToString();
        txt_MgrName.Text = dtSource.Rows[0]["MGRNAME"].ToString();
        txt_MgrTel.Text = dtSource.Rows[0]["MGRTEL"].ToString();
        txt_MgrAddress.Text = dtSource.Rows[0]["MGRADDRESS"].ToString();
        txt_MgrBrno.Text = dtSource.Rows[0]["BRNOORG"].ToString();
        txt_Region.Text = dtSource.Rows[0]["Region"].ToString();
        txt_Location.Text = dtSource.Rows[0]["LOCATION"].ToString();
        GetBRNODisplay();
    }


    protected void btn_Add_Click(object sender, EventArgs e)
    {
        //if (drList_Brno.SelectedIndex == -1 || drList_Brno.SelectedValue == "-1")
        //{
        //    lab_State.Text = "請輸入管理行!";
        //    return;
        //}
        //if (drListCity.SelectedIndex == -1 || drListCity.SelectedValue == "請選擇")
        //{
        //    lab_State.Text = "請選擇所在縣市!";
        //    return;
        //}
        //if (drListSection.SelectedIndex == -1 || drListSection.SelectedValue == "請選擇")
        //{
        //    lab_State.Text = "請選擇所在所在鄉鎮市區!";
        //    return;            
        //}
        try
        {
            hidn_Location.Value = drListCity.SelectedValue + drListSection.SelectedValue;
            dsMgrIndustrialZone.Update();
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
                lab_State.Text = "已有相同資料存在(同一個工業區名稱)!";
            }
            else
            {
                lab_State.Text = ex.ToString();
            }
        }
    }

    protected void drListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetLocation();
    }

    private void GetLocation()
    {
        hidn_Location.Value =(drListCity.SelectedValue.Contains("請選擇")== true)? string.Empty: drListCity.SelectedValue.Replace("請選擇", string.Empty) + drListSection.SelectedValue.Replace("請選擇", string.Empty);
        txt_Location.Text = hidn_Location.Value;
    }
    protected void drListSection_SelectedIndexChanged(object sender, EventArgs e)
    {
       GetLocation();
    }
    protected void txt_MgrBrno_TextChanged(object sender, EventArgs e)
    {
        GetBRNODisplay();
    }

    private void GetBRNODisplay()
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
    //protected void drListSection_DataBound(object sender, EventArgs e)
    //{
    //    //if (!IsPostBack)
    //    //{
    //    //    DataTable dtSource = ((DataView)dsMgrIndustrialZone.Select(DataSourceSelectArguments.Empty)).Table;
    //    //    try
    //    //    {
    //    //        drListSection.SelectedValue = dtSource.Rows[0]["LOCATION"].ToString().Trim().Substring(3, dtSource.Rows[0]["LOCATION"].ToString().Trim().Length - 3);
    //    //    }
    //    //    catch (System.ArgumentOutOfRangeException ex)
    //    //    {
    //    //        lab_State.Text = "所在縣市不在清單中!";
    //    //        return;
    //    //    }
    //    //}
    //}

    //protected void drListCity_DataBound(object sender, EventArgs e)
    //{
    //     if (!IsPostBack)
    //    {
    //        DataTable dtSource = ((DataView)dsMgrIndustrialZone.Select(DataSourceSelectArguments.Empty)).Table;
    //         try
    //         {
    //             drListCity.SelectedValue = dtSource.Rows[0]["LOCATION"].ToString().Trim().Substring(0, 3);            
    //         }
    //         catch (System.ArgumentOutOfRangeException ex)
    //         {
    //             lab_State.Text = "所在鄉鎮市區不在清單中!";
    //             return;
    //         }
    //    }        
    //}
    protected void drList_Region_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt_Region.Text = drList_Region.SelectedItem.Text.Replace("請選擇", string.Empty);
    }
}