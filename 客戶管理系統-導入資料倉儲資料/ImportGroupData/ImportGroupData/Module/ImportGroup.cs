using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;


/// <summary>
///  目的：匯入集團資料
///  作者：Guan Jhih Liao
/// </summary>
public class ImportGroup
{
    FileIO fileUtility = new FileIO();
    DataAccessLayer dal = new DataAccessLayer();
    public void DealWithGroup(string filename)
    {
        List<string> grouppData = FileIO.ImportData(filename);
        string[] sep = new string[] { ";" };
        string[] resultItem;
        List<SqlParameter> sqlparm = new List<SqlParameter>();
        foreach (string item in grouppData)
        {
            if (item.Trim().Length == 0)
            {
                break;
            }
            resultItem = item.Split(sep, StringSplitOptions.None);
            //Console.Write(resultItem[0]);
            sqlparm.Clear();
            sqlparm.Add(new SqlParameter("GROUPNO", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("GROUPNAME", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("ENTSERNOMAIN", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("ENTNAMEMAIN", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("CRCNO", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("MGRBRNO", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("GAOEMPID", System.Data.SqlDbType.VarChar));
            sqlparm[0].Value = resultItem[0].Trim();
            sqlparm[1].Value = resultItem[1].Trim();
            sqlparm[2].Value = resultItem[2].Trim();
            sqlparm[3].Value = resultItem[3].Trim();
            sqlparm[4].Value = resultItem[4].Trim();
            sqlparm[5].Value = (resultItem[5].Trim() == "0000") ? string.Empty : resultItem[5].Trim();
            sqlparm[6].Value = (resultItem[6].Trim() == "000000") ? string.Empty : resultItem[6].Trim();
            dal.NonQueryResultNoTranc(ModifyGroupSql(), sqlparm.ToArray());
        }
    }

    private string ModifyGroupSql()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(@"IF(exists (SELECT 1");
        sb.AppendLine(@"     FROM");
        sb.AppendLine(@"      [iom].[dbo].[CUSTMGR_GROUP]");
        sb.AppendLine(@"     WHERE");
        sb.AppendLine(@"      ENTSERNOMAIN = @ENTSERNOMAIN))");
        sb.AppendLine(@"UPDATE [iom].[dbo].[CUSTMGR_GROUP]");
        sb.AppendLine(@"SET");
        sb.AppendLine(@" [GROUPNO] = @GROUPNO");
        sb.AppendLine(@" , [GROUPNAME] = @GROUPNAME");
        sb.AppendLine(@" , [ENTNAMEMAIN] = @ENTNAMEMAIN");
        sb.AppendLine(@" , [CRCNO] = @CRCNO");
        sb.AppendLine(@" , [MGRBRNO] = @MGRBRNO ");
        sb.AppendLine(@"      ,[GAOEMPID] = @GAOEMPID");
        sb.AppendLine(@"      ,[MODIFYDATE] = CONVERT ([char](8),getdate(),(112))      ");
        sb.AppendLine(@" WHERE ENTSERNOMAIN=@ENTSERNOMAIN");
        sb.AppendLine(@"");
        sb.AppendLine(@"else");
        sb.AppendLine(@"         INSERT INTO [iom].[dbo].[CUSTMGR_GROUP] ([GROUPNO]");
        sb.AppendLine(@"                  , [GROUPNAME]");
        sb.AppendLine(@"                  , [ENTSERNOMAIN]");
        sb.AppendLine(@"                  , [ENTNAMEMAIN]");
        sb.AppendLine(@"                  , [CRCNO]");
        sb.AppendLine(@"                  , [MGRBRNO]");
        sb.AppendLine(@"                  , [GAOEMPID])");
        sb.AppendLine(@"         VALUES");
        sb.AppendLine(@"          (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @ENTNAMEMAIN, @CRCNO, @MGRBRNO, @GAOEMPID)");
        return sb.ToString();
    }
}
