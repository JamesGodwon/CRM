using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubFormQueryZoneNameList : System.Web.UI.Page
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

        }
    }
    protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        GridViewRow row = this.GridView2.Rows[e.NewSelectedIndex];
        //傳值給父頁面
        if (hidn_Url.Value.Contains("Diary") == true)
        {
            this.Page.Controls.Add(new LiteralControl(string.Format("<script>opener.document.form1.FormView1$FormView2$txt_ZoneNameEdit.value='{0}'</script>", row.Cells[1].Text)));            
        }
        else
        {
            this.Page.Controls.Add(new LiteralControl(string.Format("<script>opener.document.form1.FormView1$txt_ZoneNameEdit.value='{0}'</script>", row.Cells[1].Text)));
        }
        //關閉此視窗
        this.Page.Controls.Add(new LiteralControl("<script>window.close();</script>"));
    }
}