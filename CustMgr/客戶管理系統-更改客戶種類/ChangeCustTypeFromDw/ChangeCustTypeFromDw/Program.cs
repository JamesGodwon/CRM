using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ChangeCustTypeFromDw
{
    /// <summary>
    /// 主程式
    /// 目的：將潛在客戶名單資料的客戶種類更新(授信戶,存款戶)
    /// 作者：Guan Jhih Liao
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            Model.ChangeCustType ChCustType = new Model.ChangeCustType();
            DateTime time_start = DateTime.Now;//計時開始 取得目前時間
            Console.WriteLine("執行開始時間 : " + time_start.ToString("yyyyMMdd HH:mm:ss"));
            ChCustType.ChangeCustTypeStart();
            System.Threading.Thread.Sleep(1000);

            DateTime time_end = DateTime.Now;//計時結束 取得目前時間
            //後面的時間減前面的時間後 轉型成TimeSpan即可印出時間差
            string result2 = ((TimeSpan)(time_end - time_start)).TotalMinutes.ToString();

            Console.WriteLine("執行結束時間 : " + time_end.ToString("yyyyMMdd HH:mm:ss"));
            Console.WriteLine("執行時間(分鐘) : " + result2);            
            Console.Read();
        }
    }
}
