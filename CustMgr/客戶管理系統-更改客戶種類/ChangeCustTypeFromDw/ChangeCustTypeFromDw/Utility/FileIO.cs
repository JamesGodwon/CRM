using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Microsoft.VisualBasic.Devices;


/// <summary>
///  目的：檔案讀寫及操作
/// </summary>
class FileIO
{
    /// <summary>
    /// Reads the file line.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string[] ReadFileLine(string FileName)
    {
        //以行為單位讀取整個文字檔案的內容
        return File.ReadAllLines(FileName);
    }
    /// <summary>
    /// Reads the file string.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string ReadFileString(string FileName)
    {
        //以一個字串的方式回傳整個檔案的內容
        return File.ReadAllText(FileName);
    }
    /// <summary>
    /// Overwrites the file.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <param name="Content">The content.</param>
    public static void OverwriteFile(string FileName, string Content)
    {
        //把內容寫到目的檔案，若檔案存在則覆寫之(原本檔案會被覆蓋過去)
        File.WriteAllText(FileName, Content);
    }
    /// <summary>
    /// Appends the file.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <param name="Content">The content.</param>
    public static void AppendFile(string FileName, string Content)
    {
        //把內容寫到目的檔案，若檔案存在則附加在原本內容之後
        File.AppendAllText(FileName, Content);
    }
    /// <summary>
    /// Imports the data.
    /// </summary>
    /// <param name="InFName">Name of the input File Name.</param>
    /// <returns></returns>
    public static List<string> ImportData(string InFName)
    {
        try
        {
            FileStream fs = new FileStream(InFName, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs, UnicodeEncoding.GetEncoding("Big5"));//轉成中文碼          
            List<string> result = new List<string>();
            while (sr.Peek() >= 0)
            {
                string temp = sr.ReadLine();
                result.Add(temp);
            }
            sr.Close();
            return result;
        }
        catch (Exception e)
        {

            throw e;
        }
    }
    /// <summary>
    /// Exports the data.
    /// </summary>
    /// <param name="OutFName">Name of the output File Name.</param>
    /// <param name="InValue">The input value arrya.</param>
    /// <returns></returns>
    public static bool ExportData(string OutFName, string[] InValue)
    {
        try
        {
            FileInfo f1 = new FileInfo(OutFName);
            StreamWriter sw = f1.AppendText();
            for (int i = 0; i < InValue.Length; i++)
                sw.WriteLine(InValue[i].ToString());
            sw.Flush();
            sw.Close();
            return true;
        }
        catch (Exception e)
        {
            throw e;
        }
    }
    public static bool CheckFileExist(string FileName)
    {
        // 判斷檔案是否存在            
        return (System.IO.File.Exists(FileName)) ? true : false;
    }

    /// <summary>
    /// Batches the rename file.
    /// </summary>
    /// <param name="DirectoryPath">The directory path.</param>
    /// <param name="FileName">Name of the file.</param>
    /// <param name="Start">The start.</param>
    /// <param name="End">The end.</param>
    public static void BatchRenameFile(string DirectoryPath, string FileName, int Start, int End)
    {
        if (Start > End)
        {
            return;
        }
        else
        {
            DirectoryInfo di = new DirectoryInfo(DirectoryPath);
            int StartCount = Start;
            foreach (FileInfo fi in di.GetFiles())
            {
                String NewFileName = FileName + StartCount;
                //重新命名
                fi.MoveTo(Path.Combine(fi.DirectoryName, NewFileName + fi.Extension));
                StartCount++;
            }
        }

    }
    /// <summary>
    /// Gets the file create date.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string GetFileCreateDate(string FileName)
    {
        FileInfo fs = new FileInfo(FileName);
        if (!fs.Exists) return " Not Found!";
        else return fs.CreationTime.ToString("yyyyMMdd");
    }
    /// <summary>
    /// Gets the file last access date.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string GetFileLastAccessDate(string FileName)
    {
        FileInfo fs = new FileInfo(FileName);
        if (!fs.Exists) return " Not Found!";
        else return fs.LastAccessTime.ToString("yyyyMMdd");
    }
    /// <summary>
    /// Gets the file last write date.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string GetFileLastWriteDate(string FileName)
    {
        FileInfo fs = new FileInfo(FileName);
        if (!fs.Exists) return " Not Found!";
        else return fs.LastWriteTime.ToString("yyyyMMdd");
    }
    /// <summary>
    /// Deletes the file.
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    public static void DeleteFile(string FileName)
    {
        if (File.Exists(FileName))
        {
            File.Delete(FileName);
        }
    }
    /// <summary>
    /// Compares the file.
    /// </summary>
    /// <param name="SourceFile1">The source file1.</param>
    /// <param name="SourceFile2">The source file2.</param>
    /// <returns></returns>
    public static bool CompareFile(string SourceFile1, string SourceFile2)
    {

        FileStream fs1 = File.OpenRead(SourceFile1);
        FileStream fs2 = File.OpenRead(SourceFile2);
        //1.檢查文件大小
        if (fs1.Length != fs2.Length)
        {
            //大小相同
            fs2.Dispose();
            fs2.Dispose();
            return false;
        }

        //2.比對內容，逐一找出每一字元，法一
        int FileByte1 = 0;
        int FileByte2 = 0;
        do
        {
            FileByte1 = fs1.ReadByte();
            FileByte2 = fs2.ReadByte();
        }
        //若發現字元不同則離開迴圈且非檔尾
        while ((FileByte1 == FileByte2) && ((FileByte1 != -1) || (FileByte2 != -1)));

        if ((FileByte1 - FileByte2) == 0)
        {
            //return true;
        }
        else
        {
            return false;
        }

        //3.比對內容，逐一找出每一字元，法二
        byte[] Byte1 = File.ReadAllBytes(SourceFile1);
        byte[] Byte2 = File.ReadAllBytes(SourceFile2);
        int i = 0;
        do
        {
            if (Byte1[i] != Byte2[i])
            {
                return false;
            }
            i++;

        } while (i < Byte1.Length);
        return true;
    }

    public static List<string> GetFileShortNameFromDir()
    {
        int pos;
        string shortName;
        Computer MyComputer = new Computer();

        List<string> shortNames = new List<string>();

        foreach (string FlagFileName in MyComputer.FileSystem.GetFiles(
        MyComputer.FileSystem.CurrentDirectory))
        {
            pos = FlagFileName.LastIndexOf(@"") + 1;

            // 取得移除前置路徑之後的簡短檔案名稱。
            shortName = FlagFileName.Substring(pos);
            shortNames.Add(FlagFileName.Replace(MyComputer.FileSystem.CurrentDirectory, string.Empty).Replace("\\", string.Empty));
        }
        return shortNames;

    }
    /// <summary>
    /// Reads the file string From XML(For word gen).
    /// </summary>
    /// <param name="FileName">Name of the file.</param>
    /// <returns></returns>
    public static string ReadFileStringFromXml(string FileName)
    {
        //以一個字串的方式回傳整個檔案的內容
        StreamReader sr = new StreamReader(FileName, Encoding.UTF8);
        return sr.ReadToEnd();
    }
    /// <summary>
    /// Exports the data With XML format(For word gen)
    /// </summary>
    /// <param name="OutFName">Name of the output File Name.</param>
    /// <param name="InValue">The input value arrya.</param>
    /// <returns></returns>
    public static bool ExportDataWithXml(string OutFName, string InValue)
    {
        try
        {
            StreamWriter sw = new StreamWriter(OutFName, false, Encoding.UTF8);
            sw.Write(InValue);
            sw.Flush();
            sw.Close();
            return true;
        }
        catch (Exception e)
        {

            throw e;
        }
    }
}
