using System;
using System.Configuration;
using System.Data;
using System.Data.Odbc;


//-----------------------------------------------------
// 資料存取層
//-----------------------------------------------------
//連線資料庫名稱種類
public class DataAccessLayerODBC
{
    //從app.config讀取的連線字串
    private readonly string constringFromConfig = ConfigurationManager.ConnectionStrings["TeraDataDW"].ToString();

    private string constring;
    public DataAccessLayerODBC()
    {
        constring = constringFromConfig;

    }

    public DataAccessLayerODBC(string connstr)
    {
        constring = connstr;
    }

    private void PrepareCommand(ref OdbcCommand cmd, OdbcConnection conn, string cmdtext, OdbcParameter[] cmdparams)
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
            foreach (OdbcParameter paraitem in cmdparams)
            {
                cmd.Parameters.Add(paraitem);
            }
        }
    }

    private void PrepareCommand(ref OdbcCommand cmd, OdbcConnection conn, string cmdtext, OdbcParameter[] cmdparams, CommandType cmdtypes)
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
            foreach (OdbcParameter paraitem in cmdparams)
            {
                cmd.Parameters.Add(paraitem);
            }
        }
    }
    //取得查詢的結果(輸出Datatable)

    public DataTable GetQueryResultToDataTable(string sqlcmd, OdbcParameter[] sqlparams)
    {
        DataTable dtResult = new DataTable();
        using (OdbcConnection Sql_Conn = new OdbcConnection(constring))
        {
            try
            {
                OdbcCommand Sql_Command = new OdbcCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                OdbcDataAdapter Sql_dataaddapter = new OdbcDataAdapter(Sql_Command);
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
OdbcParameter[] sqlparams)
    {
        DataSet dtResult = new DataSet();
        using (OdbcConnection Sql_Conn = new OdbcConnection(constring))
        {
            try
            {
                OdbcCommand Sql_Command = new OdbcCommand(sqlcmd, Sql_Conn);
                PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
                OdbcDataAdapter Sql_dataaddapter = new OdbcDataAdapter(Sql_Command);
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
    public string GetQueryResultSingleValue(string sqlcmd, OdbcParameter[] sqlparams)
    {
        using (OdbcConnection Sql_Conn = new OdbcConnection(constring))
        {

            try
            {
                OdbcCommand Sql_Command = new OdbcCommand(sqlcmd, Sql_Conn);
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
    public string NonQueryResultNoTranc(string sqlcmd, OdbcParameter[] sqlparams)
    {
        using (OdbcConnection Sql_Conn = new OdbcConnection(constring))
        {
            try
            {
                OdbcCommand Sql_Command = new OdbcCommand(sqlcmd, Sql_Conn);
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
    public string NonQueryResultTranc(string sqlcmd, OdbcParameter[] sqlparams)
    {
        using (OdbcConnection Sql_Conn = new OdbcConnection(constring))
        {
            OdbcCommand Sql_Command = new OdbcCommand(sqlcmd, Sql_Conn);
            PrepareCommand(ref Sql_Command, Sql_Conn, sqlcmd, sqlparams);
            OdbcTransaction Sql_Transaction;
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
