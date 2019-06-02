using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;

public partial class GroupModify : System.Web.UI.Page
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
            hidn_ENTSERNOMAIN.Value = Request.QueryString["ENTSERNOMAIN"].ToString();
            FitTextBoxContent();
            btn_BackPage.Attributes["onclick"] = "history.back(); event.returnValue=false;";
            dsGao.SelectParameters["ENTSERNOMAIN"].DefaultValue = Request.QueryString["ENTSERNOMAIN"].ToString();
        }
    }
    private bool CheckTextContent()
    {
        if (txt_GroupName.Text.Trim().Length == 0)
        {
            return false;
        }

        return true;
    }

    private void FitTextBoxContent()
    {
        DataView dvSource = (DataView)dsGroup.Select(DataSourceSelectArguments.Empty);
        lab_Date.Text = dvSource.Table.Rows[0]["BUILDDATE"].ToString();
        lab_GroupNO.Text = dvSource.Table.Rows[0]["GROUPNO"].ToString();
        txt_GroupName.Text = dvSource.Table.Rows[0]["GROUPNAME"].ToString();
        lab_EntSerNoMain.Text = dvSource.Table.Rows[0]["ENTSERNOMAIN"].ToString();
        txt_EntNameMain.Text = dvSource.Table.Rows[0]["ENTNAMEMAIN"].ToString();
        txt_MgrBrno.Text = dvSource.Table.Rows[0]["MGRBRNO"].ToString();
        GetCRCAndGaoDisplay();
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (CheckTextContent() == false)
        {
            lab_State.Text = "請確認下列欄位已填寫：集團名稱!";
            return;
        }                   
        try
        {            
            dsGroup.Update();
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
                lab_State.Text = "已有相同資料存在(同一個母公司統編)!";
            }
            else
            {
                lab_State.Text = ex.ToString();
            }
        }
    }

    private bool GroupNoFormatCorrect(string groupNo)
    {
        int result = 0;
        return groupNo.Trim().Length == 7 && char.IsLetter(groupNo, 0) && int.TryParse(groupNo.Substring(1, 6), out result);
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
        GetCRCAndGaoDisplay();
    }

    private void GetCRCAndGaoDisplay()
    {
        try
        {
            drList_MgrBrno.SelectedValue = txt_MgrBrno.Text.Trim();
            drList_Crc.DataBind();
            drList_Crc.SelectedIndex = 1;
            dsGao.SelectParameters["ENTSERNOMAIN"].DefaultValue = " ";
            dsGao.Select(DataSourceSelectArguments.Empty);
            drList_Gao.DataBind();
        }
        catch (System.ArgumentOutOfRangeException ex)
        {
            lab_State.Text = "請輸入正確的分行代號!";
            return;
        }
    }      
}