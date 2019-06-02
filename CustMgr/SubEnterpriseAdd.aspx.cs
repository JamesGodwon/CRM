using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class SubEnterpriseAdd : System.Web.UI.Page
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
            lab_Date.Text = DateTime.Now.ToString("yyyyMMdd");
            hidn_GROUPNO.Value = Request.QueryString["GROUPNO"].ToString().Trim();
            DataTable dtGroupSource = ((DataView)dsGroupQuery.Select(DataSourceSelectArguments.Empty)).Table;
            txt_GroupCRC.Text = dtGroupSource.Rows[0]["CRCNO"].ToString();
            txt_GroupMgrBrno.Text = dtGroupSource.Rows[0]["MGRBRNO"].ToString();
            txt_GroupNo.Text = dtGroupSource.Rows[0]["GROUPNO"].ToString();
            txt_GroupName.Text = dtGroupSource.Rows[0]["GROUPNAME"].ToString();                        
        }

    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (txt_EntSerNoSub.Text.Trim().Length==0 || txt_EntNameSub.Text.Trim().Length==0)
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
            dsSubEntprise.Insert();
            GridView2.DataBind();
            lab_State.Text = "新增成功!";
            ClearInput();
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

    private void ClearInput()
    {
        txt_EntNameSub.Text = string.Empty;
        txt_EntSerNoSub.Text = string.Empty;
        txt_SubBrno.Text = string.Empty;
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
    
    protected void btn_Clear_Click(object sender, EventArgs e)
    {
        ClearInput();
    }

    protected void txt_EntSerNoSub_TextChanged(object sender, EventArgs e)
    {
        DataView dv = (DataView)dsCheckSubEnterprise.Select(DataSourceSelectArguments.Empty);
        lab_CheckSubEnt.Text = (dv.Table.Rows[0][0].ToString() == "0") ? string.Empty : "已有相同資料存在(同一分子企業統編)!";
    }   
}