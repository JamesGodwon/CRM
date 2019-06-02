using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

public partial class HiddenCustQueryByMajor : System.Web.UI.Page
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
    #region 建立表格
    public DataTable CreateEmptyDataTableFromDb()
    {
        DataTable dtOriginal = new DataTable();
        dtOriginal.Columns.Add("BATCHNUMBER");
        dtOriginal.Columns.Add("SERNO");
        return dtOriginal;
    }
    #endregion
    
    
    protected void btn_Updata_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == false)
        {
            Lab_State.Text = "請選擇檔案!";
            return;
        }
        //將資料寫入查詢table(CUSTMGR_HIDDENCUST_QUERY)
        List<string> sernos = GetFileContent(FileUpload1.FileContent);
        List<string> tempsernos = new List<string>();
        DataTable result = CreateEmptyDataTableFromDb();        
        for (int w = 0; w <sernos.Count; w ++)
        {
            DataRow dr = result.NewRow();
            dr[0] = string.Copy((w+1).ToString());
            dr[1] = string.Copy(sernos[w]);
            result.Rows.Add(dr);
        }

        //匯入客戶表資料
        string cmdText = "truncate table CUSTMGR_HIDDENCUST_QUERY ";
        using (SqlConnection dbConnection = new SqlConnection(dsQueryHiddenCust1.ConnectionString))
        {
            dbConnection.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText, dbConnection))
            {
                Console.WriteLine("刪除資料筆數 : " + cmd.ExecuteNonQuery().ToString());
            }
            using (SqlBulkCopy s = new SqlBulkCopy(dbConnection))
            {
                s.DestinationTableName = "CUSTMGR_HIDDENCUST_QUERY";
                s.WriteToServer(result);
            }
        }
        //顯示查詢結果
        dsQueryHiddenCust1.Insert();
        DataTable dtSource = ((DataView)dsQueryHiddenCust1.Select(DataSourceSelectArguments.Empty)).Table;        
        Lab_State.Text = "查詢完畢!";
        ChangeDisplayTable(ref dtSource);
        dtSource.DefaultView.Sort = "流水號";
        dsQueryHiddenCust1.Delete();
        MemoryStream ms2 = ExcelUtility.RenderDataTableToExcel(dtSource.DefaultView.ToTable()) as MemoryStream;
        // 設定強制下載標頭。
        Response.AddHeader("Content-Disposition", string.Format("attachment; filename=HIDDENCUSTQUERY_" + DateTime.Now.ToString("yyyyMMdd") + ".xls"));
        //輸出檔案。        
        Response.BinaryWrite(ms2.ToArray());     
    }

    /// <summary>
    /// 取得上傳資料內容
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public List<string> GetFileContent(Stream input)
    {
        List<string> result = new List<string>();
        StreamReader sr = new StreamReader(input, Encoding.Default);
        while (sr.Peek() >= 0)
        {
            string temp = sr.ReadLine().Trim();
            result.Add(temp);
        }
        sr.Close();
        return result;
    }


    private void ChangeDisplayTable(ref DataTable sourceTable)
    {
        decimal resultAmt;
        float resultPercent;
        foreach (DataRow dr in sourceTable.Rows)
        {
            foreach (DataColumn dc in sourceTable.Columns)
            {
                if (dc.ColumnName.Contains("千元") == true)
                {
                    if (decimal.TryParse(dr[dc.ColumnName].ToString().Trim(), out resultAmt) == true)
                    {
                        resultAmt /= 1000;
                        dr[dc.ColumnName] = resultAmt.ToString();
                    }
                }
                if (dc.ColumnName.Contains("%") == true)
                {
                    if (float.TryParse(dr[dc.ColumnName].ToString().Trim(), out resultPercent) == true)
                    {
                        resultPercent *= 100;
                        dr[dc.ColumnName] = resultPercent.ToString() + "%";
                    }
                }
            }

        }
    }
}