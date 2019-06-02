using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ChanceModify : System.Web.UI.Page
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

            hidn_OppNo.Value = Request.QueryString["OPPNO"].ToString().Trim();

            GetMenoAndEndProject();
            if (CheckExecute() == true && rbtn_EndProject.SelectedValue == "N")
            {
                lab_State0.Text = "執行結果已全部填寫，可以結案!";
                return;
            }
        }
    }

    private void GetMenoAndEndProject()
    {
        DataView dvMemo = (DataView)dsOpportunitiesMemo.Select(DataSourceSelectArguments.Empty);
        txt_Memo.Text = (((DataView)dsOpportunitiesMemo.Select(DataSourceSelectArguments.Empty)).Table.Rows.Count == 0) ? string.Empty : ((DataView)dsOpportunitiesMemo.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["MEMO"].ToString().Trim();

        txt_Income.Text = (((DataView)dsOpportunitiesMemo.Select(DataSourceSelectArguments.Empty)).Table.Rows.Count == 0) ? "0" : ((DataView)dsOpportunitiesMemo.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["INCOME"].ToString().Trim();

        string endProject = ((DataView)dsOpportunitiesValueDetermine.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["ENDPROJECT"].ToString().Trim();
        foreach (ListItem item in rbtn_EndProject.Items)
        {
            if (item.Text == endProject)
            {
                item.Selected = true;
            }
        }
    }
    protected void btn_Modify_Click(object sender, EventArgs e)
    {
        int income;
        if (CheckExecute() == false && rbtn_EndProject.SelectedValue == "Y")
        {
            lab_State.Text = "尚有執行結果尚未填寫，不可結案!";
            return;
        }
        if (int.TryParse(txt_Income.Text, out income) == false)
        {
            lab_State.Text = "預估當年度可增加收益輸入格式錯誤!";
            return;
        }

        //修改備註
        dsOpportunitiesMemo.Delete();
        dsOpportunitiesMemo.Insert();

        //修改異動日期
        dsOpportunitiesMemo.Update();


        //修改結果
        foreach (GridViewRow gv in GridView1.Rows)
        {
            if (gv.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rbtn_ExeResult = gv.FindControl("rbtn_ExeResult") as RadioButtonList;

                string selectvalue = string.Empty;
                selectvalue = rbtn_ExeResult.SelectedValue;
                Label lab_OpType = gv.FindControl("lab_OpType") as Label;
                if (selectvalue.Trim().Length != 0)
                {
                    dsGetOpportunities.UpdateParameters["OPPTYPE"].DefaultValue = lab_OpType.Text.Trim();
                    dsGetOpportunities.UpdateParameters["EXRESULT"].DefaultValue = selectvalue;
                    dsGetOpportunities.Update();
                }
                else
                {
                    dsGetOpportunitiesNULL.UpdateParameters["OPPTYPE"].DefaultValue = lab_OpType.Text.Trim();
                    dsGetOpportunitiesNULL.Update();
                }

            }
        }


        //修改
        FormView2.DataBind();
        GetMenoAndEndProject();
        GridView1.DataBind();
        lab_State0.Text = string.Empty;
        lab_State.Text = "修改成功!";
        CheckEndDisplay();
    } 

    private bool CheckExecute()
    {
        bool execute = true;
        foreach (GridViewRow gv in GridView1.Rows)
        {
            if (gv.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rbtn_ExeResult = gv.FindControl("rbtn_ExeResult") as RadioButtonList;
                if (rbtn_ExeResult.SelectedValue=="")
                {
                    execute = false;
                }
            }

        }
        return execute;
    }
    protected void rbtn_EndProject_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckEndDisplay();
    }

    private void CheckEndDisplay()
    {
        if (CheckExecute() == false && rbtn_EndProject.SelectedValue == "Y")
        {
            lab_State0.Text = "尚有執行結果尚未填寫，不可結案!";
        }
        if (CheckExecute() == true && rbtn_EndProject.SelectedValue == "N")
        {
            lab_State0.Text = "執行結果已全部填寫，可以結案!";            
        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
       
        HyperLink HyperLink2 = e.Item.FindControl("HyperLink2") as HyperLink;        
        dsCheckDiaryNotInSameBrno.SelectParameters["DIARYNO"].DefaultValue = HyperLink2.NavigateUrl.Substring(25);

        if (((DataView)dsCheckDiaryNotInSameBrno.Select(DataSourceSelectArguments.Empty)).Table.Rows[0][0].ToString() == "1")
        {
            HyperLink2.Enabled = false;
        }
    }
    protected void rbtn_ExeResult_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckEndDisplay();
    }
}