using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BrnoMgrEdit : System.Web.UI.Page
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
            txt_BRNO.Text = hidn_BRNO.Value;
        }
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        
        //bool IfUserExist = (((DataView)dsCheckEmpNo.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString()=="1")? true : false;
        if (CheckTextContent() == false)
        {
            lab_State.Text = "請填寫所有欄位!";
            return;
        }
        if (rbtn_Position.SelectedIndex == -1)
        {
            lab_State.Text = "請選擇職務!";
            return;
        }
        if (drList_MgrIdForEdit.SelectedIndex == -1 || drList_MgrIdForEdit.SelectedValue == "-1")
        {
            lab_State.Text = "請選擇管理員!";
            return;
        }
        //if(IfUserExist ==false)
        //{
        //    lab_State.Text = "該分行無此員工或員編不存在!";
        //    return;
        //}
        try
        {
            dsBrnoMgrEdit.Insert();
            lab_State.Text = "新增成功!";
            GridView2.DataBind();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            if (ex.Message.Contains("String or binary data would be truncated"))
            {
                lab_State.Text = "資料長度太長，請修改後新增!";
            }
            else if (ex.Message.Contains("Violation of PRIMARY KEY") == true)
            {
                lab_State.Text = "已有相同資料存在(本分行已有此管理員)!";
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
    protected void btn_SelectAll_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gv  in GridView2.Rows)
        {
            CheckBox ck = gv.FindControl("ck_MgrSelected") as CheckBox;
            ck.Checked = true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gv in GridView2.Rows)
        {
            if (gv.RowType == DataControlRowType.DataRow)
            {
                CheckBox ck = gv.FindControl("ck_MgrSelected") as CheckBox;
                Label serNo = gv.FindControl("lab_SerNo") as Label;
                Label brNo = gv.FindControl("lab_BrNo") as Label;                
                if (ck.Checked == true)
                {
                    dsBrnoMgrChange.UpdateParameters["MGREMPNO"].DefaultValue = drList_MgrId.SelectedValue;
                    dsBrnoMgrChange.UpdateParameters["BRNO"].DefaultValue = brNo.Text.Trim();
                    dsBrnoMgrChange.UpdateParameters["SERNO"].DefaultValue = serNo.Text.Trim();
                    dsBrnoMgrChange.Update();
                }
            }
        }
        GridView2.DataBind();
        lab_State2.Text = "變更管理員成功!";
    }
}