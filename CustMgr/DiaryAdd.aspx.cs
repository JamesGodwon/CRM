using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Globalization;

public partial class DiaryAdd : System.Web.UI.Page
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
            hidn_SERNO.Value = " ";
            hidn_OppNo.Value = " ";

        }
    }


    protected void GridView3_DataBound(object sender, EventArgs e)
    {
        Label lab_TotalOppNum = FormView1.FindControl("lab_TotalOppNum") as Label;
        Label lab_EndProject = FormView1.FindControl("lab_EndProject") as Label;
        GridView GridView3 = FormView1.FindControl("GridView3") as GridView;
        lab_TotalOppNum.Text = "累計商機數：" + GridView3.Rows.Count.ToString();
        DataTable dv = (hidn_OppNo.Value == string.Empty) ? new DataTable() : ((DataView)dsOPPORTUNITIESEND.Select(DataSourceSelectArguments.Empty)).Table;
        lab_EndProject.Text = (dv == null || dv.Rows.Count == 0) ? "是否結案：" : "是否結案：" + dv.Rows[0]["ENDPROJECT"].ToString();
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

        if (dvSourceFromDiary == null || dvSourceFromDiary.Table.Rows.Count == 0)
        {
            for (int i = 0; i < ckList_OpType.Items.Count; i++)
            {
                ckList_OpType.Items[i].Selected = false;
            }
        }
        else
        {
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
    private void GetSerNoFromCustList()
    {
        ResetCustState();
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        FormView2.ChangeMode(FormViewMode.Edit);

        TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;

        hidn_SERNO.Value = txt_SerNoBind.Text.Trim();
        SetOppNo();
    }

    protected void FormView2_DataBound(object sender, EventArgs e)
    {
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        if (FormView2.CurrentMode == FormViewMode.Insert)
        {
            TextBox tb = FormView2.FindControl("SERNOTextBox") as TextBox;
            TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
            tb.Text = txt_SerNoBind.Text.Trim();
            hidn_SERNO.Value = txt_SerNoBind.Text.Trim();
            SetOppNo();
        }
    }

    private void ResetCustState()
    {
        Label lab_CustState = FormView1.FindControl("lab_CustState") as Label;
        lab_CustState.Text = string.Empty;
    }

    protected void FormView2_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        CheckBox ckbox_AddToCustList = FormView2.FindControl("ckbox_AddToCustList") as CheckBox;
        if (ckbox_AddToCustList.Checked == true)
        {
            AddToCustList();
        }
    }

    private void AddToCustList()
    {
        TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
        dsCheckCustList.InsertParameters["SERNO"].DefaultValue = txt_SerNoBind.Text.Trim();
        dsCheckCustList.Insert();
    }

    private void SetOppNo()
    {

        if (hidn_SERNO.Value.Trim().Length != 0)
        {
            GridView GridView3 = FormView1.FindControl("GridView3") as GridView;
            DataView dvDetemineOppno = (DataView)dsDetermineOPPNO.Select(DataSourceSelectArguments.Empty);
            hidn_OppNo.Value = dvDetemineOppno.Table.Rows[0][0].ToString().Trim();
            Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
            lab_OppNoDes.Text = hidn_OppNo.Value;
            GridView3.DataBind();
        }
        else
        {
            Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
            lab_OppNoDes.Text = string.Empty;
        }
    }

    private void EditOpportunities()
    {
        if (hidn_SelectedItem.Value == string.Empty)
        {
            return;
        }
        else
        {
            string[] sep = new string[] { ";" };
            string[] inputs = hidn_SelectedItem.Value.Split(sep, StringSplitOptions.RemoveEmptyEntries);
            dsSetDiaryOpp.Delete();
            if (inputs.Length != 0)
            {
                foreach (string item in inputs)
                {
                    dsSetDiaryOpp.InsertParameters["OPPTYPE"].DefaultValue = item;
                    dsSetDiaryOpp.Insert();
                }
            }
        }

        //Response.Write(hidn_SelectedItem.Value+"<br/>");
        //Response.Write(hidn_DiaryNo.Value);
        //Response.End();
        //Response.Write("bb");
        //Response.End();
        ////if (hidn_SERNO.Value.Trim().Length == 0)
        ////{
        ////    return;
        ////}
        //CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;
        //for (int i = 0; i < ckList_OpType.Items.Count; i++)
        //{
        //    if (ckList_OpType.Items[i].Selected == true)
        //    {
        //        Response.Write(ckList_OpType.Items[i].Value);
        //        Response.End();
        //        dsSetDiaryOpp.InsertParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
        //        dsSetDiaryOpp.Insert();
        //    }
        //    //else
        //    //{
        //    //    dsSetDiaryOpp.DeleteParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;
        //    //    dsSetDiaryOpp.Delete();
        //    //}            
        //}

        SetOppNo();

    }
    private void EditChats()
    {
        if (hidn_SelectedItem0.Value == string.Empty)
        {
            return;
        }
        else
        {
            string[] sep = new string[] { ";" };
            string[] inputs = hidn_SelectedItem0.Value.Split(sep, StringSplitOptions.RemoveEmptyEntries);
            dsSetDiaryChat.Delete();
            if (inputs.Length != 0)
            {
                foreach (string item in inputs)
                {
                    dsSetDiaryChat.InsertParameters["CHATTYPE"].DefaultValue = item;
                    dsSetDiaryChat.Insert();
                }
            }
        }
    }

    private void GetSelectedOpportunities()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        hidn_SelectedItem.Value = string.Empty;
        CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;
        for (int i = 0; i < ckList_OpType.Items.Count; i++)
        {
            if (ckList_OpType.Items[i].Selected == true)
            {
                hidn_SelectedItem.Value += ckList_OpType.Items[i].Value + ";" ;
            }
        }
        if (hidn_SelectedItem.Value != string.Empty)
        {
            hidn_SelectedItem.Value = hidn_SelectedItem.Value.Substring(0, hidn_SelectedItem.Value.Length - 1);
        }
    }

    private void GetSelectedChats()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        hidn_SelectedItem0.Value = string.Empty;
        CheckBoxList ckList_ChatType = FormView1.FindControl("ckList_ChatType") as CheckBoxList;
        for (int i = 0; i < ckList_ChatType.Items.Count; i++)
        {
            if (ckList_ChatType.Items[i].Selected == true)
            {
                hidn_SelectedItem0.Value += ckList_ChatType.Items[i].Value + ";";
            }
        }
        if (hidn_SelectedItem0.Value != string.Empty)
        {
            hidn_SelectedItem0.Value = hidn_SelectedItem0.Value.Substring(0, hidn_SelectedItem0.Value.Length - 1);
        }
    }


    private void CalcOpportunities()
    {
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            return;
        }
        else
        {
            string[] sep = new string[] { ";" };
            string[] inputs = hidn_SelectedItem.Value.Split(sep, StringSplitOptions.RemoveEmptyEntries);
            if (inputs.Length != 0)
            {
                foreach (string item in inputs)
                {
                    dsDetermineOPPNO.InsertParameters["OPPTYPE"].DefaultValue = item;
                    dsDetermineOPPNO.Insert();
                }
            }
        }
        //hidn_SelectedItem.Value = string.Empty;        
        //CheckBoxList ckList_OpType = FormView1.FindControl("ckList_OpType") as CheckBoxList;
        //for (int i = 0; i < ckList_OpType.Items.Count; i++)
        //{
        //    if (ckList_OpType.Items[i].Selected == true)
        //    {
        //        dsDetermineOPPNO.InsertParameters["OPPTYPE"].DefaultValue = ckList_OpType.Items[i].Value;                
        //        dsDetermineOPPNO.Insert();
        //        hidn_SelectedItem.Value += ckList_OpType.Items[i].Value + ";";
        //    }                     
        //}
        //if (hidn_SelectedItem.Value != string.Empty)
        //{
        //    hidn_SelectedItem.Value = hidn_SelectedItem.Value.Substring(0, hidn_SelectedItem.Value.Length - 1);
        //}
    }
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (hidn_ResultSERNO.Value.Trim().Length == 0)
        {
            lab_State.Text = "新增成功!";
        }
        else
        {
            lab_State.Text = "新增成功!";
            //    lab_State.Text = "新增成功!商機單號：" + hidn_ResultSERNO.Value;            
        }
        //顯示商機種類
        //Label lab_OppDisplay = FormView1.FindControl("lab_OppDisplay") as Label;
        //lab_OppDisplay.Text = "累計商機種類：無";
        //Label lab_TotalOppNum = FormView1.FindControl("lab_TotalOppNum") as Label;
        //lab_TotalOppNum.Text = "累計商機數：0";
        //Label lab_EndProject = FormView1.FindControl("lab_EndProject") as Label;
        //lab_EndProject.Text = "是否結案：";

        hidn_OppNo.Value = string.Empty;
        GridView GridView3 = FormView1.FindControl("GridView3") as GridView;
        GridView3.DataBind();

    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        GetSelectedOpportunities();
        GetSelectedChats();

        //客戶名稱
        string accountName = string.Empty;
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        if (FormView2.CurrentMode == FormViewMode.Insert)
        {
            TextBox accountNameTextBox = FormView2.FindControl("ACCOUNTNAMETextBox0") as TextBox;
            accountName = accountNameTextBox.Text.Trim();
        }
        else
        {
            accountName = "acc";
        }

        //拜訪日期
        TextBox VISITDATETextBox = FormView1.FindControl("VISITDATETextBox") as TextBox;
        DateTime dateTime;
        //Response.Write(VISITDATETextBox.Text);
        //e.Cancel = true;

        RadioButtonList rbtn_VisitWay = FormView1.FindControl("rbtn_VisitWay") as RadioButtonList;

        //統一編號
        TextBox serNo = FormView1.FindControl("txt_SerNoBind") as TextBox;

        //備註
        TextBox MEMOTextBox = FormView1.FindControl("MEMOTextBox") as TextBox;

        //是否為新戶
        RadioButtonList rbtn_NEWCUST = FormView1.FindControl("rbtn_NEWCUST") as RadioButtonList;
        //客戶類型        
        RadioButtonList rbList_CustType = FormView2.FindControl("rbList_CustType") as RadioButtonList;

        //檢查新戶是否已存在於客戶資料
        dsCheckCustList.SelectParameters["SERNO"].DefaultValue = serNo.Text.Trim();
        DataView dvCustCheck = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);

        if (serNo.Text.Trim().Length == 0)
        {
            lab_State.Text = "請輸入統一編號並按確定!";
            e.Cancel = true;
        }
        if (hidn_SERNO.Value.Trim().Length == 0)
        {
            lab_State.Text = "請輸入統一編號並按確定!";
            e.Cancel = true;
        }
        else if (accountName.Length == 0)
        {
            lab_State.Text = "請輸入客戶名稱!";
            e.Cancel = true;
        }
        else if (rbtn_VisitWay.SelectedIndex == -1)
        {
            lab_State.Text = "請選擇拜訪方式!";
            e.Cancel = true;
        }
        else if (DateTime.TryParseExact(VISITDATETextBox.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTime) == false || VISITDATETextBox.Text.Trim().Length == 0)
        {
            lab_State.Text = "請輸入拜訪日期或拜訪日期格式有誤!";
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
            //檢查是否有重複資料
            hidn_VisitDate.Value = VISITDATETextBox.Text.Trim();
            DataView dv = (DataView)dsCheckDiary.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count > 0 && dv.Table.Rows[0][0].ToString() != "0")
            {
                lab_State.Text = "已有相同資料存在(分行代號、客戶統編、登錄員、拜訪日期皆相同)!";
                e.Cancel = true;
            }
            else
            {
                //取得最後商機單號
                Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
                hidn_ResultSERNO.Value = lab_OppNoDes.Text.Trim();

                //新增過路客資料                
                if (FormView2.CurrentMode == FormViewMode.Insert)
                {
                    SqlDataSource dsCustListAdd = FormView1.FindControl("dsCustListAdd") as SqlDataSource;
                    dsCustListAdd.Delete();
                    FormView2.InsertItem(false);
                }
                //更新客戶名單資料
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
        GetSerNoFromCustList();
        FormView FormView2 = FormView1.FindControl("FormView2") as FormView;
        FormView2.ChangeMode(FormViewMode.Edit);
        FormView2.DataBind();
        Label lab_CustState = FormView1.FindControl("lab_CustState") as Label;
        lab_CustState.Text = "更新成功!";
    }
    protected void dsDiaryAdd_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {


        //取得商機單號
        Label lab_OppNoDes = FormView1.FindControl("lab_OppNoDes") as Label;
        string tempNO = lab_OppNoDes.Text;


        DataView dvDiaryNo = (DataView)dsDiaryOppMapping.Select(DataSourceSelectArguments.Empty);
        if (dvDiaryNo.Table.Rows.Count > 0)
        {
            hidn_DiaryNo.Value = dvDiaryNo.Table.Rows[0][0].ToString().Trim();

            //新增商機與日誌關聯
            dsDiaryOppMapping.Delete();
            dsDiaryOppMapping.Insert();

            //新增洽談業務項目
            EditChats();

            //新增商機
            EditOpportunities();


            //計算商機總和
            CalcOpportunities();

            //Response.Write(hidn_SelectedItem.Value + "<br/>");
            //Response.Write(hidn_DiaryNo.Value + "<br/>");
            //Response.Write(hidn_OppNo.Value);
            // Response.End();
            hylink_Edit.Visible = true;
            hylink_Edit.Text = "點我進入編輯列印";
            hylink_Edit.NavigateUrl = "DiaryModify.aspx?DIARYNO=" + hidn_DiaryNo.Value;
        }
        else
        {
            Response.Write("新增日誌失敗");
            Response.End();
        }


    }
    //protected void btn__Click(object sender, EventArgs e)
    //{
    //    TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox ;
    //    txt_SerNoBind.Text = Application["GridVew3SelectedDataKeyValue"].ToString();
    //}
    protected void btn_Button2_Click(object sender, EventArgs e)
    {
        TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
        txt_SerNoBind.Text = "000000";
        //// if ( !Application["GeidView3SelectedDateKeyValue"] )
        //NullReferenceException could happen here when search value not selected. ToDo: set default txt_SerNoBind 
        //Note:formview find control must implement in the scope of FormView1

        txt_SerNoBind.Text = Application["GeidView3SelectedDateKeyValue"].ToString();
        txt_SerNoBind.Text = Session["GeidView3SelectedDateKeyValue"].ToString();
    }
    protected void btn_ConfirmEdit_Click(object sender, EventArgs e)
    {
        ResetCustState();

        TextBox txt_SerNoBind = FormView1.FindControl("txt_SerNoBind") as TextBox;
        Label lab_CustState = FormView1.FindControl("lab_CustState") as Label;
        dsCheckCustList.SelectParameters["SERNO"].DefaultValue = txt_SerNoBind.Text.Trim();
        dsCheckHiddenCust.SelectParameters["SERNO"].DefaultValue = txt_SerNoBind.Text.Trim();
        DataView dv = (DataView)dsCheckCustList.Select(DataSourceSelectArguments.Empty);
        DataView dvHiddenCust = (DataView)dsCheckHiddenCust.Select(DataSourceSelectArguments.Empty);
        DropDownList drList_MgrEmpId = FormView1.FindControl("drList_MgrEmpId") as DropDownList;

        
       

        if (dv.Table.Rows[0][0].ToString() != "0")
        {
            GetSerNoFromCustList();

            DataView dsMGREMPNO = (DataView)dsGetMGREMPNOFromList.Select(DataSourceSelectArguments.Empty);
            string mgrEmpno = (dsMGREMPNO.Table == null) ? string.Empty : (dsMGREMPNO.Table.Rows[0][0].ToString().Trim().Length == 0) ? string.Empty : dsMGREMPNO.Table.Rows[0][0].ToString();
            if (mgrEmpno.Length != 0)
            {
                try
                {
                    drList_MgrEmpId.SelectedValue = mgrEmpno;
                }
                catch (Exception exc)
                {
                    lab_CustState.Text = "該帳戶管理員" + mgrEmpno + "並非現任管理員，請到管理員維護新增或修改管理員!";
                    return;
                }
            }
            //Response.Write(mgrEmpno);
            lab_CustState.Text = "從現有客戶選出!";
        }
        else
        {

            FormView FormView2 = FormView1.FindControl("FormView2") as FormView;

            if (FormView2.CurrentMode == FormViewMode.Edit)
            {
                FormView2.ChangeMode(FormViewMode.Insert);
            }
            FormView2.DataBind();
            if (dvHiddenCust != null && dvHiddenCust.Table.Rows.Count != 0)
            {
                TextBox accountNameTextBox = FormView2.FindControl("ACCOUNTNAMETextBox0") as TextBox;
                TextBox CONTRACTADDRESSTextBox0 = FormView2.FindControl("CONTRACTADDRESSTextBox0") as TextBox;
                accountNameTextBox.Text = dvHiddenCust.Table.Rows[0]["ENTNAME"].ToString();
                CONTRACTADDRESSTextBox0.Text = dvHiddenCust.Table.Rows[0]["ENTADDRESS"].ToString();
                lab_CustState.Text = "新增客戶資料(帶入潛在客戶名單資料)!";
            }
            else
            {
                lab_CustState.Text = "新增客戶資料!";
            }
            drList_MgrEmpId.SelectedIndex = 0;

            //客戶類型        
            RadioButtonList rbList_CustType = FormView2.FindControl("rbList_CustType") as RadioButtonList;
            //將客戶類型設定為非彰銀客戶
            rbList_CustType.SelectedValue = "3";
        }
    }
    protected void dsSetDiaryOpp_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void dsSetDiaryOpp_Inserting(object sender, SqlDataSourceCommandEventArgs e)
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
    protected void rbList_CustType_DataBound(object sender, EventArgs e)
    {
        RadioButtonList rbList_CustType = sender as RadioButtonList;
        rbList_CustType.SelectedIndex = 0;
    }
    protected void dsGetMGREMPNOFromList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
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
    protected void rbtn_VisitWay_SelectedIndexChanged1(object sender, EventArgs e)
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