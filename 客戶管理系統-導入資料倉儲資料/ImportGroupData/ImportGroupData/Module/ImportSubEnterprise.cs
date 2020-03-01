using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;


/// <summary>
///  目的：匯入分子企業
///  作者：Guan Jhih Liao
/// </summary>
class ImportSubEnterprise
{
    FileIO fileUtility = new FileIO();
    DataAccessLayer dal = new DataAccessLayer();
    public void DealWithSubEnterPrise(string filename)
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
            sqlparm.Add(new SqlParameter("ENTSERNOSUB", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("ENTNAMESUB", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("CRCNO", System.Data.SqlDbType.VarChar));
            sqlparm.Add(new SqlParameter("MGRBRNO", System.Data.SqlDbType.VarChar));
            sqlparm[0].Value = resultItem[0].Trim();
            sqlparm[1].Value = resultItem[1].Trim();
            sqlparm[2].Value = resultItem[2].Trim();
            sqlparm[3].Value = resultItem[3].Trim();
            sqlparm[4].Value = resultItem[4].Trim();
            dal.NonQueryResultNoTranc(ModifySubEnterprise(), sqlparm.ToArray());
        }
    }
    private string ModifySubEnterprise()
    {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(@"IF(exists (SELECT 1");
        sb.AppendLine(@"     FROM");
        sb.AppendLine(@"      [iom].[dbo].[CUSTMGR_SUBENTERPRISE]");
        sb.AppendLine(@"     WHERE");
        sb.AppendLine(@"      ENTSERNOSUB = @ENTSERNOSUB))");
        sb.AppendLine(@"UPDATE [iom].[dbo].[CUSTMGR_SUBENTERPRISE]");
        sb.AppendLine(@"   SET [GROUPNO] = @GROUPNO      ");
        sb.AppendLine(@"      ,[ENTNAMESUB] = @ENTNAMESUB");
        sb.AppendLine(@"      ,[CRCNO] = @CRCNO");
        sb.AppendLine(@"      ,[MGRBRNO] = @MGRBRNO");
        sb.AppendLine(@"      ,[MODIFYDATE] = CONVERT([char](8),getdate(),(112)) ");
        sb.AppendLine(@" WHERE ENTSERNOSUB=@ENTSERNOSUB");
        sb.AppendLine(@"else ");
        sb.AppendLine(@"INSERT INTO [iom].[dbo].[CUSTMGR_SUBENTERPRISE]");
        sb.AppendLine(@"           ([GROUPNO]");
        sb.AppendLine(@"           ,[ENTSERNOSUB]");
        sb.AppendLine(@"           ,[ENTNAMESUB]");
        sb.AppendLine(@"           ,[CRCNO]");
        sb.AppendLine(@"           ,[MGRBRNO]");
        sb.AppendLine(@"           )");
        sb.AppendLine(@"     VALUES");
        sb.AppendLine(@"           (@GROUPNO");
        sb.AppendLine(@"           ,@ENTSERNOSUB");
        sb.AppendLine(@"           ,@ENTNAMESUB");
        sb.AppendLine(@"           ,@CRCNO");
        sb.AppendLine(@"           ,@MGRBRNO");
        sb.AppendLine(@"          )");
        return sb.ToString();
    }
}
