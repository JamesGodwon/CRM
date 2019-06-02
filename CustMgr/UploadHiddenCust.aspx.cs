using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;
using System.Web.Configuration;
using System.Text;

public partial class UploadHiddenCust : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dsHiddenCustModify.Select(DataSourceSelectArguments.Empty);
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

    /// <summary>
    /// 取得查詢結果
    /// </summary>
    /// <param name="sqlCmd"></param>
    /// <returns></returns>
    private DataTable GetQueryResultFromDw(string sqlCmd)
    {

        DataTable result = new DataTable();
        try
        {
            using (OdbcConnection conn = new OdbcConnection(WebConfigurationManager.ConnectionStrings["TeraDataDW"].ToString()))
            {
                using (OdbcDataAdapter da = new OdbcDataAdapter(sqlCmd, conn))
                {
                    da.Fill(result);
                }
            }
            return result;
        }
        catch (Exception k)
        {
            return result;
        }
    }
    /// <summary>
    /// 取得授信戶名單
    /// </summary>
    /// <returns></returns>
    private DataTable GetLonCust()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(@"SELECT Party_Id");
        sb.AppendLine(@"  , Twd_Lon_Amt");
        sb.AppendLine(@"  , Fex_Lon_Amt");
        sb.AppendLine(@"FROM");
        sb.AppendLine(@" intra_view.CUST_EFFECTS_CORP");
        sb.AppendLine(@"WHERE");
        sb.AppendLine(@" Snapshot_Month = (SELECT cast(max(Snapshot_Month) AS CHAR(6))");
        sb.AppendLine(@"       FROM");
        sb.AppendLine(@"        CUST_EFFECTS_CORP)");
        sb.AppendLine(@" AND STATUS_CODE = 'Y'");
        return GetQueryResultFromDw(sb.ToString());
    }

    /// <summary>
    /// 取得存款戶名單
    /// </summary>
    /// <returns></returns>
    private DataTable GetDepCust()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(@"SELECT Party_Id ");
        sb.AppendLine(@"  , Twd_Dep_Amt");
        sb.AppendLine(@"  , Fex_Dep_Amt");
        sb.AppendLine(@"FROM");
        sb.AppendLine(@" intra_view.CUST_EFFECTS_CORP");
        sb.AppendLine(@"WHERE");
        sb.AppendLine(@" Snapshot_Month = (SELECT cast(max(Snapshot_Month) AS CHAR(6))");
        sb.AppendLine(@"       FROM");
        sb.AppendLine(@"        CUST_EFFECTS_CORP)");
        sb.AppendLine(@" AND STATUS_CODE IS NULL");
        sb.AppendLine(@" AND Twd_Dep_Amt + Fex_Dep_Amt >= 1000000");
        return GetQueryResultFromDw(sb.ToString());
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Boolean fileOK = false;

        if (FileUpload1.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            String[] allowedExtensions = { ".xls" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
        }
        if (fileOK)
        {
            dsHiddenCustModify.Select(DataSourceSelectArguments.Empty);
            DataTable dtSource = ExcelUtility.RenderDataTableFromExcel(FileUpload1.FileContent, 0, 2, true);
            switch (GetCustListType(dtSource))
            {
                case "設立登記清冊":
                    InsertCustList(dtSource);
                    break;
                case "變更登記清冊":
                    UpdateCustList(dtSource);
                    break;
                case "解散登記清冊":
                    DeleteCustList(dtSource);
                    break;
                default:
                    break;
            }
            DataView dv = dsHiddenCustModify0.Select(DataSourceSelectArguments.Empty) as DataView;
            GridView1.DataBind();
            lab_State.Text = "上傳成功!總筆數：" + dv.Table.Rows[0][0].ToString();
            
        }
        else
        {
            Response.Write("<script>window.alert('請上傳excel檔案(*.xls)!')</script>");
        }
    }

    private string GetSerno(string sernoFromExcel)
    {
        return (sernoFromExcel.Trim().Length >= 8) ? sernoFromExcel : sernoFromExcel.PadLeft(8, '0');
    }
    private string GetTaiwanDate(string dateFromExcel)
    {
        string[] sep = new string[] { "/" };
        string[] temp = dateFromExcel.Split(sep, StringSplitOptions.RemoveEmptyEntries);
        return (temp.Length < 3) ? string.Empty : (int.Parse(temp[0]) + 1911).ToString() + temp[1] + temp[2];
    }
    private string GetCapital(string capitalFromExcel)
    {
        decimal a;
        return (decimal.TryParse(capitalFromExcel.Replace(",", string.Empty), out a) == true) ? a.ToString() : string.Empty;
    }

    private string GetCustListType(DataTable dtSource)
    {
        string CustType = "無此檔案對應之清冊名稱!";
        foreach (DataColumn dc in dtSource.Columns)
        {
            if (dc.ColumnName == "核准變更日期")
            {
                CustType = "變更登記清冊";
            }
            if (dc.ColumnName == "核准設立日期")
            {
                CustType = "設立登記清冊";
            }
            if (dc.ColumnName == "核准解散日期")
            {
                CustType = "解散登記清冊";
            }
        }
        return CustType;
    }

    private int InsertCustList(DataTable dtSource)
    {
        int insertcount = 0;
        for (int i = 1; i < dtSource.Rows.Count; i++)
        {

            dsHiddenCustModify.InsertParameters["SERNO"].DefaultValue = GetSerno(dtSource.Rows[i][1].ToString().Trim());
            dsHiddenCustModify.InsertParameters["ENTNAME"].DefaultValue = dtSource.Rows[i][2].ToString().Trim();
            dsHiddenCustModify.InsertParameters["ENTADDRESS"].DefaultValue = dtSource.Rows[i][3].ToString().Trim();
            dsHiddenCustModify.InsertParameters["CONTRACTPEOPLE"].DefaultValue = dtSource.Rows[i][4].ToString().Trim();
            dsHiddenCustModify.InsertParameters["CAPITAL"].DefaultValue = GetCapital(dtSource.Rows[i][5].ToString().Trim());
            dsHiddenCustModify.InsertParameters["SETDATE"].DefaultValue = GetTaiwanDate(dtSource.Rows[i][6].ToString().Trim());
            dsHiddenCustModify.Insert();
        }
        return insertcount;
    }

    private int UpdateCustList(DataTable dtSource)
    {
        int insertcount = 0;
        for (int i = 1; i < dtSource.Rows.Count; i++)
        {

            dsHiddenCustModify.UpdateParameters["SERNO"].DefaultValue = GetSerno(dtSource.Rows[i][1].ToString().Trim());
            dsHiddenCustModify.UpdateParameters["ENTNAME"].DefaultValue = dtSource.Rows[i][2].ToString().Trim();
            dsHiddenCustModify.UpdateParameters["ENTADDRESS"].DefaultValue = dtSource.Rows[i][3].ToString().Trim();
            dsHiddenCustModify.UpdateParameters["CONTRACTPEOPLE"].DefaultValue = dtSource.Rows[i][4].ToString().Trim();
            dsHiddenCustModify.UpdateParameters["CAPITAL"].DefaultValue = GetCapital(dtSource.Rows[i][5].ToString().Trim());
            dsHiddenCustModify.UpdateParameters["CHANGEDATE"].DefaultValue = GetTaiwanDate(dtSource.Rows[i][6].ToString().Trim());
            try
            {
                dsHiddenCustModify.Update();
            }
            catch (Exception ezx)
            {
                Response.Write(dtSource.Rows[i]["統一編號"].ToString().Trim());
                Response.End();
            }
        }
        return insertcount;
    }
    private int DeleteCustList(DataTable dtSource)
    {
        int insertcount = 0;
        for (int i = 1; i < dtSource.Rows.Count; i++)
        {

            dsHiddenCustModify.DeleteParameters["SERNO"].DefaultValue = GetSerno(dtSource.Rows[i][1].ToString().Trim());
            dsHiddenCustModify.DeleteParameters["ENTNAME"].DefaultValue = dtSource.Rows[i][2].ToString().Trim();
            dsHiddenCustModify.DeleteParameters["ENTADDRESS"].DefaultValue = dtSource.Rows[i][3].ToString().Trim();
            dsHiddenCustModify.DeleteParameters["CONTRACTPEOPLE"].DefaultValue = dtSource.Rows[i][4].ToString().Trim();
            dsHiddenCustModify.DeleteParameters["CAPITAL"].DefaultValue = GetCapital(dtSource.Rows[i][5].ToString().Trim());
            dsHiddenCustModify.DeleteParameters["SETDATE"].DefaultValue = GetTaiwanDate(dtSource.Rows[i][6].ToString().Trim());
            dsHiddenCustModify.DeleteParameters["DISSOLVEDATE"].DefaultValue = GetTaiwanDate(dtSource.Rows[i][7].ToString().Trim());
            dsHiddenCustModify.Delete();
        }
        return insertcount;
    }
 
    protected void btn_Change_Click(object sender, EventArgs e)
    {
        int updateCounter = dsHiddenCustModifyAfter.Update();
        int insertCounter = dsHiddenCustModifyAfter.Insert();
        lab_State.Text = "更新成功！【更新筆數】" + updateCounter.ToString() + " 【新增筆數】" + insertCounter.ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        dsDelErrorData.Delete();
        lab_State1.Text = "刪除成功！";
    }
    protected void btnUpdate_Click1(object sender, EventArgs e)
    {
        dsHiddenCustChangeDISSOLVEDATE.Update();
        lab_State0.Text = "更新成功！";
    }
}