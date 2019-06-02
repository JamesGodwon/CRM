using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Text;

public partial class DiaryModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btn_BackPage.Attributes["onclick"] = "history.back(); event.returnValue=false;";

            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];

            hidn_DiaryNoFromPrevious.Value = (Request.QueryString["DIARYNO"] == null) ? " " : Request.QueryString["DIARYNO"].ToString();

            hidn_SERNO.Value = ((DataView)dsDiaryAdd.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["SERNO"].ToString().Trim();
            hidn_BRNOfromDiary.Value = ((DataView)dsDiaryAdd.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["BRNO"].ToString().Trim();

            string oppNoFromDiary = (((DataView)dsDetermineOPPNO.Select(DataSourceSelectArguments.Empty)).Table.Rows.Count == 0) ? string.Empty : ((DataView)dsDetermineOPPNO.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString().Trim();

            string oppNoFromDetermine = ((DataView)dsDetermineOPPNO0.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString().Trim();

            hidn_OppNo.Value = (oppNoFromDiary.Trim().Length == 0) ? oppNoFromDetermine : oppNoFromDiary;

            Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
            lab_OppNoDes.Text = hidn_OppNo.Value;

            hidn_SetOpp.Value = "Y";
            //設定編輯權限
            if (hidn_BRNO.Value != hidn_BRNOfromDiary.Value)
            {
                DisableEdit();
            }
            if (Request.QueryString["ISHIDDEN"] != null)
            {
                DisableEdit();
            }
        }
    }

    private void DisableEdit()
    {
        hidn_SetOpp.Value = "N";

        LinkButton UpdateButton = FormView1.FindControl("UpdateButton") as LinkButton;
        LinkButton DeleteButton = FormView1.FindControl("DeleteButton") as LinkButton;

        UpdateButton.Visible = false;
        DeleteButton.Visible = false;
    }


    protected void GridView3_DataBound(object sender, EventArgs e)
    {

        Label lab_TotalOppNum = FormView1.FindControl("lab_TotalOppNum") as Label;
        Label lab_EndProject = FormView1.FindControl("lab_EndProject") as Label;
        GridView GridView3 = FormView1.FindControl("GridView3") as GridView;
        lab_TotalOppNum.Text = "累計商機數：" + GridView3.Rows.Count.ToString();
        DataTable dv = ((DataView)dsOPPORTUNITIESEND.Select(DataSourceSelectArguments.Empty)).Table;
        lab_EndProject.Text = (dv == null || dv.Rows.Count == 0) ? "是否結案：" : "是否結案：" + dv.Rows[0]["ENDPROJECT"].ToString();
        hidn_SetOpp.Value = "Y";
        if (lab_EndProject.Text != "是否結案：" && dv.Rows[0]["ENDPROJECT"].ToString().Trim() == "Y")
        {
            LinkButton DeleteButton = FormView1.FindControl("DeleteButton") as LinkButton;
            DeleteButton.Enabled = false;
            hidn_SetOpp.Value = "N";
        }

        //顯示商機種類
        Label lab_OppDisplay = FormView1.FindControl("lab_OppDisplay") as Label;
        StringBuilder sb = new StringBuilder();
        if (GridView3.Rows.Count == 0)
        {
            sb.Append("<br/>累計商機種類：無");
            lab_OppDisplay.Text = sb.ToString();
        }
        else
        {
            sb.Append("<br/>累計商機種類：");
            foreach (GridViewRow gv in GridView3.Rows)
            {
                if (gv.RowType == DataControlRowType.DataRow)
                {
                    sb.AppendFormat("{0}、", gv.Cells[0].Text);
                }
            }
            lab_OppDisplay.Text = sb.ToString().Remove(sb.Length - 1);
        }

        GetOppByDiary();
        GetChatByDiary();
    }

    private void GetOppByDiary()
    {
        DataView dvSourceFromDiary = (DataView)dsSetDiaryOpp.Select(DataSourceSelectArguments.Empty);
        CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;

        for (int i = 0; i < ckList_OpType.Items.Count; i++)
        {
            ckList_OpType.Items[i].Selected = false;
            foreach (DataRow dr in dvSourceFromDiary.Table.Rows)
            {
                if (dr["OPPTYPE"].ToString() == ckList_OpType.Items[i].Value)
                {
                    ckList_OpType.Items[i].Selected = true;
                }
            }
        }


    }
    private void GetChatByDiary()
    {
        DataView dvSourceFromDiary = (DataView)dsSetDiaryChat.Select(DataSourceSelectArguments.Empty);
        CheckBoxList ckList_ChatType = FormView1.FindControl("ckList_ChatType") as CheckBoxList;

        if (dvSourceFromDiary == null || dvSourceFromDiary.Table.Rows.Count == 0)
        {
            for (int i = 0; i < ckList_ChatType.Items.Count; i++)
            {
                ckList_ChatType.Items[i].Selected = false;
            }
        }
        else
        {
            for (int i = 0; i < ckList_ChatType.Items.Count; i++)
            {
                ckList_ChatType.Items[i].Selected = false;
                foreach (DataRow dr in dvSourceFromDiary.Table.Rows)
                {
                    if (dr["CHATTYPE"].ToString() == ckList_ChatType.Items[i].Value)
                    {
                        ckList_ChatType.Items[i].Selected = true;
                    }
                }
            }
        }
    }



    private void EditOpportunities()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;
        for (int i = 0; i < ckList_OpType.Items.Count; i++)
        {
            if (ckList_OpType.Items[i].Selected == true)
            {
                dsSetDiaryOpp.InsertParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
                dsSetDiaryOpp.Insert();
            }
            else
            {
                dsSetDiaryOpp.DeleteParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
                dsSetDiaryOpp.Delete();
            }

        }
    }

    private void EditChat()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        CheckBoxList ckList_ChatType = FormView1.FindControl("ckList_ChatType") as CheckBoxList;
        for (int i = 0; i < ckList_ChatType.Items.Count; i++)
        {
            if (ckList_ChatType.Items[i].Selected == true)
            {
                dsSetDiaryChat.InsertParameters["CHATTYPE"].DefaultValue = ckList_ChatType.Items[i].Value;
                dsSetDiaryChat.Insert();
            }
            else
            {
                dsSetDiaryChat.DeleteParameters["CHATTYPE"].DefaultValue = ckList_ChatType.Items[i].Value;
                dsSetDiaryChat.Delete();
            }

        }
    }

    private void CalcOpportunities()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;
        for (int i = 0; i < ckList_OpType.Items.Count; i++)
        {

            if (ckList_OpType.Items[i].Selected == true)
            {
                dsDetermineOPPNO.InsertParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
                dsDetermineOPPNO.Insert();
            }
            else
            {
                dsDetermineOPPNO.DeleteParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
                dsDetermineOPPNO.Delete();

            }
        }
    }

    protected void dsCheckDiary_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //StringBuilder sb = new StringBuilder();
        //sb.AppendLine(e.Command.CommandText + "<br/>");
        //for (int i = 0; i < e.Command.Parameters.Count; i++)
        //{
        //    sb.AppendLine("參數 (" + i.ToString() + "):" + e.Command.Parameters[i].Value + "<br/>");

        //}
        //Response.Write(sb.ToString());
        //e.Cancel = true;
    }
    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        CheckBox ckbox_AddToCustList = FormView2.FindControl("ckbox_AddToCustList") as CheckBox;
        if (ckbox_AddToCustList.Checked == true)
        {
            dsCheckCustList.Insert();
        }
        FormView2.ChangeMode(FormViewMode.Edit);
        FormView2.DataBind();
    }

    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        //客戶名稱
        string accountName = string.Empty;
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        //備註
        TextBox MEMOTextBox = FormView1.FindControl("MEMOTextBox") as TextBox;
        //是否為新戶
        RadioButtonList rbtn_NEWCUST = FormView1.FindControl("rbtn_NEWCUST") as RadioButtonList;
        //客戶類型        
        RadioButtonList rbList_CustType = FormView2.FindControl("rbList_CustType") as RadioButtonList;

        //檢查新戶是否已存在於客戶資料

        dsCheckCustList.SelectParameters["SERNO"].DefaultValue = hidn_SERNO.Value.Trim();
        DataView dvCustCheck = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);

        if (FormView2.CurrentMode == FormViewMode.Insert)
        {
            TextBox accountNameTextBox = FormView2.FindControl("ACCOUNTNAMETextBox0") as TextBox;
            accountName = accountNameTextBox.Text.Trim();
        }
        else
        {
            accountName = "acc";
        }

        if (accountName.Length == 0)
        {
            lab_State.Text = "請輸入客戶名稱!";
            e.Cancel = true;
        }
        else if (MEMOTextBox.Text.Trim().Length > 800)
        {
            lab_State.Text = "MEMO請勿輸入超過400字!";
            e.Cancel = true;
        }
        //新戶的客戶類型必須為非彰銀客戶          
        else if (dvCustCheck.Table.Rows[0][0].ToString() == "0" && rbtn_NEWCUST.SelectedValue == "1" && rbList_CustType.SelectedValue != "3")
        {
            lab_State.Text = "新戶的客戶類型必須為非彰銀客戶!";
            e.Cancel = true;
        }
        //客戶資料(客戶類型為授信戶或純存款戶)不得為新戶
        else if (rbtn_NEWCUST.SelectedValue == "1" && dvCustCheck.Table.Rows[0][0].ToString() != "0" &&
           (rbList_CustType.SelectedValue == "1" || rbList_CustType.SelectedValue == "2"))
        {
            lab_State.Text = "客戶資料(客戶類型為授信戶或純存款戶)已存在!是否為新戶請選擇否!";
            e.Cancel = true;
        }
        else
        {
            //取得最後商機單號
            Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
            hidn_ResultSERNO.Value = lab_OppNoDes.Text.Trim();

            //更新過路客/客戶名單資料
            if (FormView2.CurrentMode == FormViewMode.Edit)
            {
                FormView2.UpdateItem(false);
            }

            //判斷是否為集團新戶,如果是新戶就新增
            TextBox txt_EntSerNoMainEdit = FormView2.FindControl("txt_EntSerNoMainEdit") as TextBox;
            TextBox txt_EntNameMainEdit = FormView2.FindControl("txt_EntNameMainEdit") as TextBox;
            TextBox txt_GroupNo = FormView2.FindControl("txt_GroupNo") as TextBox;
            TextBox txt_GroupName = FormView2.FindControl("txt_GroupName") as TextBox;
            if (txt_EntSerNoMainEdit.Text.Trim().Length != 0)
            {
                //dsGroup.InsertParameters["ENTSERNOMAIN"].DefaultValue = txt_EntSerNoMainEdit.Text.Trim();
                //dsGroup.InsertParameters["ENTNAMEMAIN"].DefaultValue = txt_EntNameMainEdit.Text.Trim();
                //dsGroup.InsertParameters["GROUPNO"].DefaultValue = txt_GroupNo.Text.Trim();
                //dsGroup.InsertParameters["GROUPNAME"].DefaultValue = txt_GroupName.Text.Trim();
                //dsGroup.Insert();
            }


            //判斷是否為新工業區,是的話就新增

            TextBox txt_ZoneNameEdit = FormView2.FindControl("txt_ZoneNameEdit") as TextBox;
            if (txt_ZoneNameEdit.Text.Trim().Length != 0)
            {
                //dsInsertZone.InsertParameters["ZONENAME"].DefaultValue = txt_ZoneNameEdit.Text.Trim();
                //dsInsertZone.Insert();
            }
        }
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (hidn_ResultSERNO.Value.Trim().Length == 0)
        {
            lab_State.Text = "修改成功!";
        }
        else
        {
            lab_State.Text = "修改成功!商機單號：" + hidn_ResultSERNO.Value;
        }
    }
    protected void dsDiaryAdd_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (hidn_SetOpp.Value == "Y")
        {
            //修改洽談業務項目
            EditChat();

            //修改日誌商機
            EditOpportunities();

            //計算商機表
            CalcOpportunities();

            //新增商機與日誌關聯
            //dsDiaryOppMapping.Delete();
            //dsDiaryOppMapping.Insert();

            GridView GridView3 = FormView1.FindControl("GridView3") as GridView;
            GridView3.DataBind();
        }
    }
    protected void btn_ConfirmEdit_Click(object sender, EventArgs e)
    {
        //ResetCustState();

        //TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
        //Label lab_CustState = FormView1.FindControl("lab_CustState") as Label;
        //dsCheckCustList.SelectParameters["SERNO"].DefaultValue = txt_SerNoBind.Text.Trim();
        //DataView dv = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);
        //if (dv.Table.Rows[0][0].ToString() != "0")
        //{
        //    GetSerNoFromCustList();
        //    lab_CustState.Text = "從現有客戶選出!";
        //}
        //else
        //{

        //    FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        //    if (FormView2.CurrentMode == FormViewMode.Edit)
        //    {
        //        FormView2.ChangeMode(FormViewMode.Insert);
        //    }
        //    FormView2.DataBind();
        //    lab_CustState.Text = "新增客戶資料!";
        //}
    }
    protected void dsDiaryAdd_Deleted(object sender, SqlDataSourceStatusEventArgs e)
    {
        //刪除商機與日誌關聯
        dsDiaryOppMapping.Delete();

        //重新計算商機
        for (int i = 1; i < 10; i++)
        {
            dsDetermineOPPNO.DeleteParameters["OPPTYPE"].DefaultValue = i.ToString();
            dsDetermineOPPNO.Delete();
        }
    }
    protected void rbList_CustType_DataBound(object sender, EventArgs e)
    {
        RadioButtonList rbList_CustType = sender as RadioButtonList;
        rbList_CustType.SelectedIndex = 0;
    }
    protected void rbtn_VisitWay_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadioButtonList rbtn_VisitWay = sender as RadioButtonList;
        RadioButtonList rbtn_NEWCUST = FormView1.FindControl("rbtn_NEWCUST") as RadioButtonList;
        rbtn_NEWCUST.SelectedValue = "0";
        switch (rbtn_VisitWay.SelectedValue.ToString())
        {
            //電訪 
            case "1":
                rbtn_NEWCUST.Enabled = true;
                break;
            //電訪 
            case "2":
                rbtn_NEWCUST.Enabled = true;
                break;
            default:
                break;
        }
    }
}