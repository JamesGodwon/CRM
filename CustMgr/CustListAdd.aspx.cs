using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class CustListAdd : System.Web.UI.Page
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

            DataTable dtSource = ((DataView)dsGetCrc.Select(DataSourceSelectArguments.Empty)).Table;
            hidn_Crc.Value = (dtSource == null || dtSource.Rows.Count == 0) ? string.Empty : dtSource.Rows[0][0].ToString().Trim();
            GetUsefulCondition();
        }
    }
    private void ShowEditBrno()
    {
        Label lab_BrnoDisplay = FormView1.FindControl("lab_BrnoDisplay") as Label;
        TextBox EditBrno = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
        lab_BrnoDisplay.Visible = (hidn_EditBrno.Value == "0201") ? false : true;
        EditBrno.Visible = (hidn_EditBrno.Value == "0201") ? true : false;
    }

    private void GetUsefulCondition()
    {
        DropDownList drList_Useful = FormView1.FindControl("drList_Useful") as DropDownList;
        RuleDetermine rule = new RuleDetermine();

        if (rule.DetermineRule(hidn_EmpNo.Value) == RuleDetermine.UserPostionTypeEnum.分行負责人以上)
        {
            drList_Useful.Enabled = true;
        }
        else
        {
            drList_Useful.Enabled = false;
        }
    }

    private void DisplayAccountUseFul()
    {
        //統一編號
        TextBox serNo = FormView1.FindControl("SERNOTextBox") as TextBox;

        //顯示檢查結果
        Label Lab_DescUseful = FormView1.FindControl("Lab_DescUseful") as Label;

        //編輯現有資料
        HyperLink Link_Edit = FormView1.FindControl("Link_Edit") as HyperLink;
        Link_Edit.NavigateUrl = "~/Program/CustMgr/CustListModify.aspx?SERNO=" + serNo.Text.Trim() + "&BRNO=" + hidn_EditBrno.Value+"&USEFUL=Y";
        Link_Edit.Visible = true;

        //檢查是否有重複資料        
        dsCheckCustListUseFul.SelectParameters["SERNO"].DefaultValue = serNo.Text.Trim();
        DataView dv = (DataView)dsCheckCustListUseFul.Select(DataSourceSelectArguments.Empty);
        if (dv == null || dv.Table.Rows.Count == 0)
        {
            Link_Edit.Visible = false;
        }
        //有效戶
        else if (dv.Table.Rows[0][0].ToString() == "Y")
        {
            Lab_DescUseful.Text = "已有資料存在(此戶為有效戶!)";            
        }
        //無效戶
        else
        {
            Lab_DescUseful.Text = "已有資料存在(此戶為無效戶!)";              
        }
    }

    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        RadioButtonList rbList_CustType = FormView1.FindControl("rbList_CustType") as RadioButtonList;
        rbList_CustType.SelectedIndex = 0;
        ShowEditBrno();
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //客戶名稱
        TextBox accountName = FormView1.FindControl("ACCOUNTNAMETextBox") as TextBox;
        //統一編號
        TextBox serNo = FormView1.FindControl("SERNOTextBox") as TextBox;
        if (serNo.Text.Trim().Length == 0)
        {
            lab_State.Text = "請輸入統一編號!";
            e.Cancel = true;
        }
        else if (accountName.Text.Trim().Length == 0)
        {
            lab_State.Text = "請輸入客戶名稱!";
            e.Cancel = true;
        }
        else
        {
            //檢查是否有重複資料
            dsCheckCustList.SelectParameters["SERNO"].DefaultValue = serNo.Text.Trim();
            DataView dv = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);            
            if (dv.Table.Rows[0][0].ToString() != "0")
            {
                lab_State.Text = "已有相同資料存在(同一分行有相同的客戶統一編號)!";
                e.Cancel = true;
            }

            //檢查是否為國內營運處(0201),可以自行編輯內容
            if (hidn_EditBrno.Value == "0201")
            {
                TextBox tb = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
                if (tb.Text.Trim().Length == 0)
                {
                    lab_State.Text = "請輸入分行代號!";
                    e.Cancel = true;
                }
                hidn_EditBrno.Value = tb.Text.Trim();
            }

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
            
            //判斷是否為集團的新分子企業,如果是就新增
            string groupNo;            
            dsGetGroupNo.SelectParameters["ENTSERNOMAIN"].DefaultValue = txt_EntSerNoMainEdit.Text.Trim();
            DataView dvGroupNo = (DataView)dsGetGroupNo.Select(DataSourceSelectArguments.Empty);
            groupNo = (dvGroupNo==null||dvGroupNo.Table.Rows.Count == 0) ? string.Empty : dvGroupNo.Table.Rows[0][0].ToString();
            dsAddSubEnterprise.InsertParameters["GROUPNO"].DefaultValue = groupNo;
            dsAddSubEnterprise.InsertParameters["ENTSERNOSUB"].DefaultValue = serNo.Text.Trim();
            dsAddSubEnterprise.InsertParameters["ENTNAMESUB"].DefaultValue = accountName.Text.Trim();
            dsAddSubEnterprise.Insert();            
        }


    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        
    }
    protected void dsCustListAdd_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        lab_State.Text = "新增成功!";
    }
    protected void txt_EditBrnoByMgr_TextChanged(object sender, EventArgs e)
    {
        TextBox txt_EditBrnoByMgr = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
        hidn_EditBrno.Value = txt_EditBrnoByMgr.Text;
        hidn_BRNO.Value = txt_EditBrnoByMgr.Text;
        FormView1.DataBind();        
        //TextBox txt_EditBrnoByMgr = FormView1.FindControl("txt_EditBrnoByMgr") as TextBox;
        //hidn_EditBrno.Value = txt_EditBrnoByMgr.Text;
        //DropDownList drList_MgrEmpId = FormView1.FindControl("drList_MgrEmpId") as DropDownList;
        //drList_MgrEmpId.DataBind();
    }    
    
    protected void SERNOTextBox_TextChanged(object sender, EventArgs e)
    {
        DisplayAccountUseFul();
    }    
}