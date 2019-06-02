using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustListModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];
            hidn_EditBrno.Value = hidn_BRNO.Value;

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];

            hidn_BrnoFormCustList.Value = ((DataView)dsCustListAdd.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["BRNO"].ToString().Trim();
            hidn_SernoFormCustList.Value = ((DataView)dsCustListAdd.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["SERNO"].ToString().Trim();

            //檢查使用者是否可以編輯資料
            lab_Desc.Text = (CheckIsLegalUser() == true) ? "您的身份為帳戶管理員或填寫人員或分行主管" : "您非帳戶管理員或填寫人員或分行主管，不得修改！";

            LinkButton updateButton = FormView1.FindControl("UpdateButton") as LinkButton;            
            updateButton.Visible = CheckIsLegalUser();

            dsGetCrc.SelectParameters["brno"].DefaultValue = (Request.QueryString["BRNO"] == null) ? " " : Request.QueryString["BRNO"].ToString();
            DataTable dtSource = ((DataView)dsGetCrc.Select(DataSourceSelectArguments.Empty)).Table;
            hidn_Crc.Value = (dtSource == null || dtSource.Rows.Count == 0) ? string.Empty : dtSource.Rows[0][0].ToString().Trim();
            Label lab_CrcDisplay = FormView1.FindControl("lab_CrcDisplay") as Label;
            lab_CrcDisplay.Text = hidn_Crc.Value;
            TextBox txt_EditBrnoByMgr = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
            txt_EditBrnoByMgr.Text = Request.QueryString["BRNO"].ToString();
            GetUsefulCondition();

        }
    }
    private void GetUsefulCondition()
    {
        DropDownList drList_Useful = FormView1.FindControl("drList_Useful") as DropDownList;
        DropDownList drList_MgrEmpId = FormView1.FindControl("drList_MgrEmpId") as DropDownList;
        RuleDetermine rule = new RuleDetermine();
        
        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            drList_Useful.Enabled = true;
            drList_MgrEmpId.Enabled = true;
        }
        else
        {
            drList_Useful.Enabled = false;
            drList_MgrEmpId.Enabled = false;
        }
    }

    private void ShowEditBrno()
    {
        Label lab_BrnoDisplay = FormView1.FindControl("lab_BrnoDisplay") as Label;
        TextBox EditBrno = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
        lab_BrnoDisplay.Visible = (hidn_EditBrno.Value == "0201") ? false : true;
        EditBrno.Visible = (hidn_EditBrno.Value == "0201") ? true : false;
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        DropDownList drList_Useful = FormView1.FindControl("drList_Useful") as DropDownList;
        //判斷是否為無效戶轉入有效戶
        if (Request.QueryString["USEFUL"] != null)
        {
            drList_Useful.SelectedValue = Request.QueryString["USEFUL"].ToString();
        }
        ShowEditBrno();
    }   

    private bool CheckIsLegalUser()
    {
        if (hidn_BRNO.Value == "0201")
        {
            lab_Desc.Text = string.Empty;
            return true;
        }
        RuleDetermine rule = new RuleDetermine();
        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            return true;
        }

        DataTable dv = ((DataView)dsCustListCheck.Select(DataSourceSelectArguments.Empty)).Table;
        if (dv.Rows[0][0].ToString() == "1")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void dsCustListAdd_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        lab_State.Text = "更新成功!";
    }
    protected void dsCustListAdd_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        lab_State.Text = "刪除成功!";
    }
    protected void dsCustListAdd_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        //判斷是否為集團新戶,如果是新戶就新增
        TextBox txt_EntSerNoMainEdit = FormView1.FindControl("txt_EntSerNoMainEdit") as TextBox;
        TextBox txt_EntNameMainEdit = FormView1.FindControl("txt_EntNameMainEdit") as TextBox;
        TextBox txt_GroupNo = FormView1.FindControl("txt_GroupNo") as TextBox;
        TextBox txt_GroupName = FormView1.FindControl("txt_GroupName") as TextBox;
        if (txt_EntSerNoMainEdit.Text.Trim().Length != 0)
        {
            dsGroup.InsertParameters["ENTSERNOMAIN"].DefaultValue = txt_EntSerNoMainEdit.Text.Trim();
            dsGroup.InsertParameters["ENTNAMEMAIN"].DefaultValue = txt_EntNameMainEdit.Text.Trim();
            dsGroup.InsertParameters["GROUPNO"].DefaultValue = txt_GroupNo.Text.Trim();
            dsGroup.InsertParameters["GROUPNAME"].DefaultValue = txt_GroupName.Text.Trim();
            dsGroup.Insert();
        }

        //判斷是否為新工業區,是的話就新增
        TextBox txt_ZoneNameEdit = FormView1.FindControl("txt_ZoneNameEdit") as TextBox;
        if (txt_ZoneNameEdit.Text.Trim().Length != 0)
        {
            dsInsertZone.InsertParameters["ZONENAME"].DefaultValue = txt_ZoneNameEdit.Text.Trim();
            dsInsertZone.Insert();
        }

    }
    protected void txt_EditBrnoByMgr_TextChanged(object sender, EventArgs e)
    {
        TextBox txt_EditBrnoByMgr = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
        hidn_EditBrno.Value = txt_EditBrnoByMgr.Text;
        hidn_BRNO.Value = txt_EditBrnoByMgr.Text;
        FormView1.DataBind();  
    }
}