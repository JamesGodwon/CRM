using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class ImportGroupAndSub : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //讀取使用者的員編及單位代號
            hidn_EmpNo.Value = (Request.Cookies["CHB_IW_"]["User_ID"] != null) ? Request.Cookies["CHB_IW_"]["User_ID"].ToString() : (Request.QueryString["sid"] != null) ? UserInfo.getUserId(Request.QueryString["sid"].ToString(), Request) : Request.QueryString["EMPID"].ToString();

            string[] usrinfo = UserInfo.getUserInfo(hidn_EmpNo.Value).Split(',');
            hidn_BRNO.Value = usrinfo[0];

            lab_EmpNo.Text = hidn_EmpNo.Value;
            lab_BRNO.Text = hidn_BRNO.Value;
            lab_EmpName.Text = usrinfo[1];
            lab_BRNAME.Text = usrinfo[2];
            labNote.Text = DisplayFileInfo();
        }
    }
    private bool IsTestServer(HttpRequest request)
    {
        string serverIP = request.ServerVariables.Get("LOCAL_ADDR").ToString();
        return (serverIP == "10.100.7.90") ? true : false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fileFolder = (IsTestServer(Request) == true) ? @"E:\IntraWeb\Upload\EMPJOB" : @"E:\Portal\IntraWeb\Upload\EMPJOB";
        string groupFilePath = fileFolder + "\\PARTY_GROUP_MAIN.TXT";
        string subEntFilePath = fileFolder + "\\PARTY_GROUP_SUB.TXT";
        try
        {
            DealWithGroup(groupFilePath);
            DealWithSubEnterPrise(subEntFilePath);
            lab_Status.Text = "匯入成功!";
        }
        catch (Exception ex)
        {
            lab_Status.Text = ex.ToString();
        }

    }

    private string DisplayFileInfo()
    {
        string fileFolder = (IsTestServer(Request) == true) ? @"E:\IntraWeb\Upload\EMPJOB" : @"E:\Portal\IntraWeb\Upload\EMPJOB";
        string groupFilePath = fileFolder + "\\PARTY_GROUP_MAIN.TXT";
        string subEntFilePath = fileFolder + "\\PARTY_GROUP_SUB.TXT";
        FileInfo fiGroup = new FileInfo(groupFilePath);
        FileInfo fiSubEnt = new FileInfo(subEntFilePath);
        StringBuilder sb = new StringBuilder();
        sb.AppendFormat("【集團資料】<br/>檔案名稱：{0}<br/>", fiGroup.FullName);
        sb.AppendFormat("【分子企業資料】<br/>檔案名稱：{0}<br/>", fiSubEnt.FullName);
        return sb.ToString();
    }


    public void DealWithGroup(string filename)
    {
        List<string> grouppData = ImportData(filename);
        string[] sep = new string[] { ";" };
        string[] resultItem;    
        foreach (string item in grouppData)
        {
            if (item.Trim().Length == 0)
            {
                break;
            }
            resultItem = item.Split(sep, StringSplitOptions.None);
            dsUpdateGroup.UpdateParameters["GROUPNO"].DefaultValue = resultItem[0].Trim();
            dsUpdateGroup.UpdateParameters["GROUPNAME"].DefaultValue = resultItem[1].Trim();
            dsUpdateGroup.UpdateParameters["ENTSERNOMAIN"].DefaultValue = resultItem[2].Trim();
            dsUpdateGroup.UpdateParameters["ENTNAMEMAIN"].DefaultValue = resultItem[3].Trim();
            dsUpdateGroup.UpdateParameters["CRCNO"].DefaultValue = resultItem[4].Trim();
            dsUpdateGroup.UpdateParameters["MGRBRNO"].DefaultValue = (resultItem[5].Trim() == "0000") ? string.Empty : resultItem[5].Trim();
            dsUpdateGroup.UpdateParameters["GAOEMPID"].DefaultValue = (resultItem[6].Trim() == "000000") ? string.Empty : resultItem[6].Trim();
            dsUpdateGroup.Update();
        }
    }

    public void DealWithSubEnterPrise(string filename)
    {
        List<string> subEntData = ImportData(filename);
        string[] sep = new string[] { ";" };
        string[] resultItem;
        
        foreach (string item in subEntData)
        {
            if (item.Trim().Length == 0)
            {
                break;
            }
            resultItem = item.Split(sep, StringSplitOptions.None);
            dsUpdateSubEnt.UpdateParameters["GROUPNO"].DefaultValue = resultItem[0].Trim();
            dsUpdateSubEnt.UpdateParameters["ENTSERNOSUB"].DefaultValue = resultItem[1].Trim();
            dsUpdateSubEnt.UpdateParameters["ENTNAMESUB"].DefaultValue = resultItem[2].Trim();
            dsUpdateSubEnt.UpdateParameters["CRCNO"].DefaultValue = resultItem[3].Trim();
            dsUpdateSubEnt.UpdateParameters["MGRBRNO"].DefaultValue = resultItem[4].Trim();
            dsUpdateSubEnt.Update();
        }
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
}