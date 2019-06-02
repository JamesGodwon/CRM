using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;

public partial class HiddenCustModify : System.Web.UI.Page
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
            hidn_SERNO.Value = ((DataView)dsGetSerNo.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString();
            string entTypeValue =(((DataView)dsTejDataDetail.Select(DataSourceSelectArguments.Empty)).Table.Rows.Count==0)? string.Empty: ((DataView)dsTejDataDetail.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["上市別 / 代號"].ToString().Trim();        
            hidn_EntType.Value = GetEntTypeDisplayValue(entTypeValue);
        }
    }

    private string GetEntTypeDisplayValue(string entType)
    {
        return entType.ToUpper().Trim().Replace("TSE", "上市").Replace("OTC", "上櫃").Replace("ROTC", "興櫃").Replace("PUB", "公發");
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        lab_State.Text = "更新資料成功!";
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        //資本額        
        TextBox CAPITALTextBox = FormView1.FindControl("CAPITALTextBox") as TextBox;
        TextBox SETDATETextBox = FormView1.FindControl("SETDATETextBox") as TextBox;
        TextBox CHANGEDATETextBox = FormView1.FindControl("CHANGEDATETextBox") as TextBox;        
        int captial;
        DateTime dateInput;
        if (CAPITALTextBox.Text.Trim().Length != 0 && int.TryParse(CAPITALTextBox.Text.Trim(), out captial) == false)
        {
            lab_State.Text = "資本額格式有誤!";
            e.Cancel = true;
        }
        if (SETDATETextBox.Text.Trim().Length != 0 && DateTime.TryParseExact(SETDATETextBox.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateInput) == false)
        {
            lab_State.Text = "核准設立日期格式有誤!";
            e.Cancel = true;
        }
        if (CHANGEDATETextBox.Text.Trim().Length != 0 && DateTime.TryParseExact(CHANGEDATETextBox.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateInput) == false)
        {
            lab_State.Text = "核准變更日期格式有誤!";
            e.Cancel = true;
        }       
    }
}