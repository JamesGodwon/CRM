using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace ChangeCustTypeFromDw.Model
{
    public class ChangeCustType
    {
        private DataAccessLayerODBC odbcDAO = new DataAccessLayerODBC();
        private DataAccessLayer dao = new DataAccessLayer();
        /// <summary>
        /// 取得授信戶名單
        /// </summary>
        /// <returns></returns>
        public DataTable GetLonCust()
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
            sb.AppendLine(@" AND STATUS_CODE = 'Y' and Risk_Amt+ Lon_Amt >0 ");
            sb.AppendLine(@" AND Collection_Ind <> 'Y' ");
            return odbcDAO.GetQueryResultToDataTable(sb.ToString(), null);
        }

        /// <summary>
        /// 取得純存款戶A(大於等於1千萬)
        /// </summary>
        /// <returns></returns>
        public DataTable GetDepCustLess()
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
            sb.AppendLine(@" AND Risk_Amt+ Lon_Amt =0 ");
            sb.AppendLine(@" AND Twd_Dep_Amt + Fex_Dep_Amt < 10000000");
            sb.AppendLine(@" AND Twd_Dep_Amt + Fex_Dep_Amt >0 ");
            sb.AppendLine(@" AND Collection_Ind <> 'Y' ");
            return odbcDAO.GetQueryResultToDataTable(sb.ToString(), null);
        }

        /// <summary>
        /// 取得純存款戶B(小於1千萬)
        /// </summary>
        /// <returns></returns>
        public DataTable GetDepCustMore()
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
            sb.AppendLine(@" AND Risk_Amt+ Lon_Amt =0 ");
            sb.AppendLine(@" AND Twd_Dep_Amt + Fex_Dep_Amt >= 10000000");
            sb.AppendLine(@" AND Collection_Ind <> 'Y' ");
            return odbcDAO.GetQueryResultToDataTable(sb.ToString(), null);
        }


        /// <summary>
        /// 取得催呆名單
        /// </summary>
        /// <returns></returns>
        public DataTable GetFakeCust()
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
            sb.AppendLine(@" AND Collection_Ind = 'Y' ");
            return odbcDAO.GetQueryResultToDataTable(sb.ToString(), null);
        }

        private void ResetCustType()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"UPDATE iom.dbo.CUSTMGR_HIDDENCUST");
            sb.AppendLine(@"SET CUSTTYPE = 3");
            dao.NonQueryResultNoTranc(sb.ToString(), null);
        }


        private void UpdateCustType(string serno, int custtype)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"UPDATE iom.dbo.CUSTMGR_HIDDENCUST");
            sb.AppendLine(@"SET CUSTTYPE = @CUSTTYPE");
            sb.AppendLine(@"WHERE SERNO=@SERNO");
            List<SqlParameter> sqlparm = new List<SqlParameter>();
            sqlparm.Add(new SqlParameter("@CUSTTYPE", SqlDbType.Int));
            sqlparm.Add(new SqlParameter("@SERNO", SqlDbType.VarChar));
            sqlparm[0].Value = custtype;
            sqlparm[1].Value = serno;
            dao.NonQueryResultNoTranc(sb.ToString(), sqlparm.ToArray());
        }



        public string ChangeCustTypeStart()
        {
            DataTable drLon = GetLonCust();
            DataTable drDepMore = GetDepCustMore();
            DataTable drDepLess = GetDepCustLess();
            DataTable drFake = GetFakeCust();
            // 先重新設定客戶種類為非彰銀帳戶(CUSTTYPE=3)
            ResetCustType();
            //授信戶
            foreach (DataRow dr in drLon.Rows)
            {
                UpdateCustType(dr["Party_Id"].ToString().Trim(), 1);
            }
            //存款戶A
            foreach (DataRow dr in drDepMore.Rows)
            {
                UpdateCustType(dr["Party_Id"].ToString().Trim(), 2);
            }
            //存款戶B
            foreach (DataRow dr in drDepLess.Rows)
            {
                UpdateCustType(dr["Party_Id"].ToString().Trim(), 5);
            }
            //催呆戶
            foreach (DataRow dr in drFake.Rows)
            {
                UpdateCustType(dr["Party_Id"].ToString().Trim(), 4);
            }
            return "更新客戶種類完成!";
        }



    }
}
