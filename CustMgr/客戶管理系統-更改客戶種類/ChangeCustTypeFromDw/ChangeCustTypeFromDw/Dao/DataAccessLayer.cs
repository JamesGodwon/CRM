using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;


//-----------------------------------------------------
// 資料存取層
//-----------------------------------------------------
//連線資料庫名稱種類
public class DataAccessLayer
{
    //從app.config讀取的連線字串
    private readonly string constringFromConfig = ConfigurationManager.ConnectionStrings["connectString"].ToString();

    private string constring;
    public DataAccessLayer()
    {
        constring = constringFromConfig;

    }

    public DataAccessLayer(string connstr)
    {
        constring = connstr;
    }

    private void PrepareCommand(ref SqlCommand cmd, SqlConnection conn, string cmdtext, SqlParameter[] cmdparams)
    {
        if ((conn.State != ConnectionState.Open))
        {
            conn.Open();
        }
        cmd.Connection = conn;
        cmd.CommandText = cmdtext;
        cmd.CommandType = CommandType.Text;
        if ((cmdparams != null))
        {
            foreach (SqlParameter paraitem in cmdparams)
            {
                cmd.Parameters.Add(paraitem);
            }
        }
    }

    private void PrepareCommand(ref SqlCommand cmd, SqlConnection conn, string cmdtext, SqlParameter[] cmdparams, CommandType cmdtypes)
    {
        if ((conn.State != ConnectionState.Open))
        {
            conn.Open();
        }
        cmd.Connection = conn;
        cmd.CommandText = cmdtext;
        cmd.CommandType = cmdtypes;
        if ((cmdparams != null))
        {
            foreach (SqlParameter paraitem in cmdparams)
            {
                cmd.Parameters.Add(paraitem);
            }
        }
    }
    //取得查詢的結果(輸出Datatable)

    public DataTable GetQueryResultToDataTable(string sqlcmd, SqlParameter[] sqlparams)
    {
        DataTable dtResult = new DataTable();
        using (SqlConnection Sql_Conn = new SqlConnection(constring))
        {
            try
            {
                SqlCommand Sql_Command = new SqlCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                SqlDataAdapter Sql_dataaddapter = new SqlDataAdapter(Sql_Command);
                Sql_dataaddapter.Fill(dtResult);
                Sql_dataaddapter.Dispose();
                Sql_Command.Dispose();
                return dtResult;

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return dtResult;
            }

        }
    }

    //取得查詢的結果(輸出DataSet)  
    public DataSet GetQueryResultToDataset(string sqlcmd,
SqlParameter[] sqlparams)
    {
        DataSet dtResult = new DataSet();
        using (SqlConnection Sql_Conn = new SqlConnection(constring))
        {
            try
            {
                SqlCommand Sql_Command = new SqlCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                SqlDataAdapter Sql_dataaddapter = new SqlDataAdapter(Sql_Command);
                Sql_dataaddapter.Fill(dtResult);
                Sql_dataaddapter.Dispose();
                Sql_Command.Dispose();
                return dtResult;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return dtResult;
            }
        }
    }

    //取得查詢的結果(輸出單個資料)    
    public string GetQueryResultSingleValue(string sqlcmd, SqlParameter[] sqlparams)
    {
        using (SqlConnection Sql_Conn = new SqlConnection(constring))
        {

            try
            {
                SqlCommand Sql_Command = new SqlCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                return (Sql_Command.ExecuteScalar() == null) ? string.Empty : Sql_Command.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return string.Empty;
            }
        }
    }

    //執行sql指令(沒包Transaction)    
    public string NonQueryResultNoTranc(string sqlcmd, SqlParameter[] sqlparams)
    {
        using (SqlConnection Sql_Conn = new SqlConnection(constring))
        {
            try
            {
                SqlCommand Sql_Command = new SqlCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                Sql_Command.ExecuteNonQuery();
                Sql_Command.Dispose();
                return "OK";
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
        return "OK";
    }

    //執行sql指令(包Transaction)    
    public string NonQueryResultTranc(string sqlcmd, SqlParameter[] sqlparams)
    {
        using (SqlConnection Sql_Conn = new SqlConnection(constring))
        {
            SqlCommand Sql_Command = new SqlCommand(sqlcmd, Sql_Conn);
            PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
            SqlTransaction Sql_Transaction;
            Sql_Transaction = Sql_Conn.BeginTransaction();
            Sql_Command.Transaction = Sql_Transaction;
            try
            {
                Sql_Command.ExecuteNonQuery();
                Sql_Transaction.Commit();
                return "OK";
            }
            catch (Exception ex)
            {
                Sql_Transaction.Rollback();
                return ex.ToString();
            }

        }
    }
}
