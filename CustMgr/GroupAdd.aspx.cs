using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class GroupAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];
            lab_Date.Text = DateTime.Now.ToString("yyyyMMdd");
        }
    }
    private bool CheckTextContent()
    {
        if (txt_GroupNO.Text.Trim().Length == 0 || txt_GroupName.Text.Trim().Length == 0 || txt_EntSerNoMain.Text.Trim().Length == 0)
        {
            return false;
        }

        return true;
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (CheckTextContent() == false)
        {
            lab_State.Text = "請確認下列欄位已填寫：集團代號、集團名稱、母公司統編!";
            return;
        }

        bool groupNoExist = (((DataView)dsCheckGroupNo.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString() == "0") ? false : true;
        if (groupNoExist == true)
        {
            lab_State.Text = "已有相同的集團代號存在!";
            return;
        }           
        try
        {
            txt_GroupNO.Text = ConvertToGroupNo(txt_GroupNO.Text);
            dsGroup.Insert();
            lab_State.Text = "新增成功!";
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            if (ex.Message.Contains("String or binary data would be truncated"))
            {
                lab_State.Text = "資料長度太長，請修改後新增!";
            }
            else if (ex.Message.Contains("Violation of PRIMARY KEY") == true)
            {
                lab_State.Text = "已有相同資料存在(同一個母公司統編)!";
            }
            else
            {
                lab_State.Text = ex.ToString();
            }
        }
    }

  

    private string ConvertToGroupNo(string inputString)
    {
        return inputString.Substring(0, 1).ToUpper() + inputString.Substring(1, inputString.Length-1);
    }
    protected void drList_MgrBrno_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txt_MgrBrno_TextChanged(object sender, EventArgs e)
    {
        try
        {
            drList_MgrBrno.SelectedValue = txt_MgrBrno.Text.Trim();
            drList_Crc.DataBind();
            drList_Crc.SelectedIndex = 1;
        }
        catch (System.ArgumentOutOfRangeException ex)
        {
            lab_State.Text = "請輸入正確的分行代號!";
            return;
        }
    }      
}