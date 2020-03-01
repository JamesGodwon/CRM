using System;
using System.Configuration;
using System.IO;
using System.Net;

namespace WriteStaticHtml
{
    class Program
    {
        //要另存成html的aspx
        static string targetASPX = ConfigurationManager.AppSettings["targetASPX"];
        //要存檔的路徑
        static string savePath = ConfigurationManager.AppSettings["savePath"];
        //登入帳號
        static string account = ConfigurationManager.AppSettings["accountLogin"];
        //登入密碼
        static string password = ConfigurationManager.AppSettings["passwordLogin"];

        static void Main(string[] args)
        {
            try
            {
                WebClient wc = new WebClient();
                NetworkCredential credentials = new NetworkCredential("account", account, password);
                wc.Credentials = credentials;

                //目前網頁多半是UTF8編碼
                wc.Encoding = System.Text.Encoding.UTF8;
                //下載html字串
                string html = wc.DownloadString(targetASPX);


                using (FileStream fs = new FileStream(savePath, System.IO.FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite))
                {
                    StreamWriter sw = new StreamWriter(fs);
                    //輸出html字串
                    sw.Write(html);
                    sw.Close();
                    fs.Close();

                }
                Console.Write("OK");
                //Console.Read();
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
                Console.Read();

            }


        }
    }
}
