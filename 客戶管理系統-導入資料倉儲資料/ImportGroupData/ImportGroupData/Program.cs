using System;
using System.Configuration;

namespace ImportGroupData
{
    /// <summary>
    /// 匯入集團及子企業資料
    /// 目的：
    /// 作者：
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string groupFilePath = ConfigurationManager.AppSettings["filepath"] + "\\PARTY_GROUP_MAIN.TXT";
                string subEntFilePath = ConfigurationManager.AppSettings["filepath"] + "\\PARTY_GROUP_SUB.TXT";
                ImportGroup group = new ImportGroup();
                ImportSubEnterprise sub = new ImportSubEnterprise();
                group.DealWithGroup(groupFilePath);
                sub.DealWithSubEnterPrise(subEntFilePath);
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                Console.Read();
            }
        }
    }
}
