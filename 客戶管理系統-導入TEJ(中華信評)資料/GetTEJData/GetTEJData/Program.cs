using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GetTEJData
{
    /// <summary>
    /// 主程式
    /// 目的：從TEJ取得資料
    /// 作者：Guan Jhih Liao
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                DataTable entCust = new DataTable();
                DataAccessLayer dal = new DataAccessLayer();
                entCust = dal.GetQueryResultToDataTable(getTEJData(),null);
                using (SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["chb_iom"].ToString()))
                {
                    dbConnection.Open();
                    //匯入客戶表資料
                    string cmdText = "Delete from crmstd ";
                    using (SqlCommand cmd = new SqlCommand(cmdText, dbConnection))
                    {
                        Console.WriteLine("刪除資料筆數 : " + cmd.ExecuteNonQuery().ToString());
                    }
                    using (SqlBulkCopy s = new SqlBulkCopy(dbConnection))
                    {
                        s.DestinationTableName = "crmstd";
                        s.WriteToServer(entCust);
                    }
                    // 新增差異資料到CUSTMGR_HIDDENCUST(潛在客戶名單)
                    //匯入客戶表資料
                    string cmdTextDiff = InsertDiffData();
                    using (SqlCommand cmddiff = new SqlCommand(cmdTextDiff, dbConnection))
                    {
                        Console.WriteLine("新增差異資料到CUSTMGR_HIDDENCUST(潛在客戶名單)筆數 : " + cmddiff.ExecuteNonQuery().ToString());
                    }
                }
                Console.WriteLine("變更完畢!");
              //  Console.Read();
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }

        }

        /// <summary>
        /// 取得TEJ資料.
        /// </summary>
        /// <returns></returns>
        static string getTEJData()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"SELECT [co_id]");
            sb.AppendLine(@"      ,[name8]");
            sb.AppendLine(@"      ,[invoice]");
            sb.AppendLine(@"      ,[mkt]");
            sb.AppendLine(@"      ,[ind]");
            sb.AppendLine(@"      ,[emm]");
            sb.AppendLine(@"      ,[phone]");
            sb.AppendLine(@"      ,[fax]");
            sb.AppendLine(@"      ,[chief]");
            sb.AppendLine(@"      ,[president]");
            sb.AppendLine(@"      ,[spokes1]");
            sb.AppendLine(@"      ,[spokes2]");
            sb.AppendLine(@"      ,[estb_date]");
            sb.AppendLine(@"      ,[list_date]");
            sb.AppendLine(@"      ,[list_day1]");
            sb.AppendLine(@"      ,[tse_day1]");
            sb.AppendLine(@"      ,[otc_day1]");
            sb.AppendLine(@"      ,[reg_day1]");
            sb.AppendLine(@"      ,[list_day2]");
            sb.AppendLine(@"      ,[d_cat4]");
            sb.AppendLine(@"      ,[tejind]");
            sb.AppendLine(@"      ,[tejindnm]");
            sb.AppendLine(@"      ,[btindnm]");
            sb.AppendLine(@"      ,[gop_na]");
            sb.AppendLine(@"      ,[name_f_chi]");
            sb.AppendLine(@"      ,[name_f_eng]");
            sb.AppendLine(@"      ,[chi_add]");
            sb.AppendLine(@"      ,[stk_amt]");
            sb.AppendLine(@"      ,[pub_da2]");
            sb.AppendLine(@"      ,[indnm]");
            sb.AppendLine(@"      ,[isin]");
            sb.AppendLine(@"      ,[crmtcri]");
            sb.AppendLine(@"      ,[ad_tcri]");
            sb.AppendLine(@"      ,[yymm_tcri]");
            sb.AppendLine(@"      ,[co_type]");
            sb.AppendLine(@"      ,[pub_da1]");
            sb.AppendLine(@"      ,[end_date]");
            sb.AppendLine(@"      ,[fg1]");
            sb.AppendLine(@"      ,[brok_stat]");
            sb.AppendLine(@"      ,[tseind]");
            sb.AppendLine(@"      ,[tseindnm]");
            sb.AppendLine(@"      ,[sfiid]");
            sb.AppendLine(@"      ,[sics]");
            sb.AppendLine(@"      ,[sicsnm]");
            sb.AppendLine(@"      ,[tdrfg]");
            sb.AppendLine(@"      ,[parval]");
            sb.AppendLine(@"      ,[par_cur]");
            sb.AppendLine(@"      ,[jcic]");
            sb.AppendLine(@"  FROM [chb5db].[dbo].[crmstd]");
            return sb.ToString();

        }

        static string InsertDiffData()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST] ([SERNO]");
            sb.AppendLine(@"           , [ENTNAME]");
            sb.AppendLine(@"           , [ENTADDRESS]");
            sb.AppendLine(@"           , [CONTRACTPEOPLE]");
            sb.AppendLine(@"           , [CAPITAL]");
            sb.AppendLine(@"           , [SETDATE])");
            sb.AppendLine(@"");
            sb.AppendLine(@"SELECT invoice");
            sb.AppendLine(@"  , name_f_chi");
            sb.AppendLine(@"  , chi_add");
            sb.AppendLine(@"  , chief");
            sb.AppendLine(@"  , stk_amt * 1000");
            sb.AppendLine(@"  , estb_date");
            sb.AppendLine(@"FROM");
            sb.AppendLine(@" vi_crmstd");
            sb.AppendLine(@"WHERE");
            sb.AppendLine(@" invoice IN (SELECT invoice COLLATE Chinese_Taiwan_Stroke_BIN AS SERNO");
            sb.AppendLine(@"    FROM");
            sb.AppendLine(@"     vi_crmstd");
            sb.AppendLine(@"    EXCEPT");
            sb.AppendLine(@"    SELECT DISTINCT SERNO COLLATE Chinese_Taiwan_Stroke_BIN AS SERNO");
            sb.AppendLine(@"    FROM");
            sb.AppendLine(@"     CUSTMGR_HIDDENCUST)");
            return sb.ToString();
        }
    }
}
