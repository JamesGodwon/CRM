using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

public partial class BankMgr : System.Web.UI.Page
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

        }
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
             StreamReader reader = new StreamReader(FileUpload1.FileContent, 
                 System.Text.Encoding.GetEncoding(950));
            int RowCount =0;
            string strReadLine;
            dsBank.Delete();
            while (reader.Peek() > 0)
            {
                strReadLine = reader.ReadLine();
                if (strReadLine.Trim().Length == 0)
                {
                    continue;
                }
                dsBank.InsertParameters["BANKNO"].DefaultValue = getSubString(strReadLine, 1, 3);
                dsBank.InsertParameters["BRANCHNO"].DefaultValue = getSubString(strReadLine, 4, 4);
                dsBank.InsertParameters["BANKNAME"].DefaultValue = getSubString(strReadLine, 9, 40);
                dsBank.InsertParameters["BANKNICKNAME"].DefaultValue = getSubString(strReadLine, 49, 10);
                dsBank.Insert();
                RowCount++;
            }
            lab_State.Text = "匯入成功!總筆數:" + RowCount.ToString() ;
        }
        GridView1.DataBind();
        //int resultBankNo;
        //if (CheckTextContent() == false)
        //{
        //    lab_State.Text = "請填寫所有欄位!";
        //    return;
        //}
        //if (int.TryParse(txt_BANKNO.Text.Trim(), out resultBankNo) == false)
        //{
        //    lab_State.Text = "銀行代號請輸入數字!";
        //    return;
        //}
        //if (txt_BANKNO.Text.Trim().Length != 3)
        //{
        //    lab_State.Text = "銀行代號長度為三碼!";
        //    return;
        //}
        //try
        //{
        //    dsBank.Insert();
        //    GridView1.DataBind();
        //    lab_State.Text = "新增成功!";
        //}
        //catch (Exception ex)
        //{
        //    lab_State.Text = ex.ToString();
        //}
    }    

    #region getSubString
    //計算長度
    public static String getSubString(String sTemp, int start, int count)
    {
        String strSubString = "";
        //字串實際長度    
        Encoding cp950 = System.Text.Encoding.GetEncoding(950);

        byte[] BYT = cp950.GetBytes(sTemp);
        strSubString = cp950.GetString(BYT, start, count).ToString().Trim();
        return strSubString;

    }
    #endregion
}