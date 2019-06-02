using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;
using System.Data;
using System.IO;

public partial class HiddenCustQuery : System.Web.UI.Page
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

            Link_UploadTime.Visible = (hidn_BRNO.Value == "0201" || hidn_EmpNo.Value == "155953") ? true : false;
            Link_QueryBatch.Visible = (hidn_BRNO.Value == "0201" || hidn_EmpNo.Value == "155953") ? true : false;
            //foreach (Control item in this.Controls)
            //{
            //    Response.Write(item.GetType().Name+"<br/>");           
            //}
        }
    }
    private bool CheckTextBoxEmpty()
    {
        return (string.IsNullOrEmpty(txt_CapitalEnd.Text) && string.IsNullOrEmpty(txt_CapitalStart.Text)
            && string.IsNullOrEmpty(txt_ChangeDateEnd.Text) && string.IsNullOrEmpty(txt_ChangeDateStart.Text)
            && string.IsNullOrEmpty(txt_ContractPeople.Text) && string.IsNullOrEmpty(txt_EntAddress.Text)
            && string.IsNullOrEmpty(txt_SERNO.Text) && string.IsNullOrEmpty(txt_SetDateEnd.Text)
            && string.IsNullOrEmpty(txt_SetDateStart.Text));


    }
    private bool CheckMgtEmpty()
    {
        foreach (ListItem item in chkList_EntType.Items)
        {
            if (item.Selected == true)
            {
                return false;
            }
        }
        return true;
    }
    protected void btn_Query_Click(object sender, EventArgs e)
    {
        decimal capStart = 0, capEnd = 0;
        if (CheckTextBoxEmpty() == true && CheckMgtEmpty() == true && drListCity.SelectedValue == "請選擇" &&
            drListSection.SelectedValue == "請選擇")
        {
            lab_State.Text = "請輸入查詢條件!";
            return;
        }

        if (CheckMoneyValue(txt_CapitalStart, txt_CapitalEnd, ref capStart, ref capEnd) == false)
        {
            return;
        }

        if (CheckDateValue(txt_SetDateStart, txt_SetDateEnd, "核准設立日期") == false)
        {
            return;
        }
        if (CheckDateValue(txt_ChangeDateStart, txt_ChangeDateEnd, "核准變更日期") == false)
        {
            return;
        }

        //處理查詢條件

        hidn_condition.Value = " and a.CUSTTYPE <> 4 ";

        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or a.ENTNAME  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_EntAddress.Text.Trim().Length == 0 && drListCity.SelectedValue == "請選擇" && drListSection.SelectedValue == "請選擇")
        {
            ;
        }
        else
        {
            hidn_condition.Value += " AND ( ";
            string queryTextAddress = txt_EntAddress.Text.Trim().Replace("巿", "市");
            string[] sep = new string[] { "," };
            string[] queryResult = queryTextAddress.Split(sep, StringSplitOptions.None);
            int count = 0;
            string resultAddress = string.Empty;
            foreach (string address in queryResult)
            {
                resultAddress = string.Empty;
                resultAddress += (drListCity.SelectedIndex != -1 && drListCity.SelectedValue != "請選擇") ?
                    drListCity.SelectedValue : "%";
                resultAddress += (drListSection.SelectedIndex != -1 && drListSection.SelectedValue != "請選擇") ?
                    drListSection.SelectedValue : "%";
                resultAddress += address;
                resultAddress = resultAddress.Replace("巿", "市");
                if (count == 0)
                {
                    hidn_condition.Value += " (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                    count = 1;
                }
                else
                {
                    hidn_condition.Value += " or  (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                }
            }
            hidn_condition.Value += " ) ";
        }
        if (txt_ContractPeople.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.CONTRACTPEOPLE like '%" + txt_ContractPeople.Text.Trim() + "%')  ";
        }

        capStart *= 1000;
        capEnd *= 1000;

        if (txt_CapitalStart.Text.Trim().Length != 0 && txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL BETWEEN '" + capStart.ToString() + "' and  '" + capEnd.ToString() + "' ";
        }
        else if (txt_CapitalStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL >='" + capStart.ToString() + "' ";
        }
        else if (txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL  <= '" + capEnd.ToString() + "' ";
        }
        else
        {
            ;
        }


        if (txt_SetDateStart.Text.Trim().Length != 0 && txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE BETWEEN '" + txt_SetDateStart.Text.Trim() + "' and  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else if (txt_SetDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE>= '" + txt_SetDateStart.Text.Trim() + "' ";
        }
        else if (txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE <=  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        if (txt_ChangeDateStart.Text.Trim().Length != 0 && txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE BETWEEN '" + txt_ChangeDateStart.Text.Trim() + "' and  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE>= '" + txt_ChangeDateStart.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE <=  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        //取得上市別
        string entType = string.Empty;
        for (int q = 0; q < chkList_EntType.Items.Count; q++)
        {
            if (chkList_EntType.Items[q].Selected == true)
            {
                entType += ",'" + chkList_EntType.Items[q].Value + "' ";
            }
        }
        //Response.Write(entType.Substring(1, entType.Length - 1));
        if (entType.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( b.mkt in ( " + entType.Substring(1, entType.Length - 1) + " ) ) ";
        }
        hidn_condition.Value += " and ( a.DISSOLVEDATE IS NULL OR a.DISSOLVEDATE = '' ) ";
        dsQueryHiddenCust.Select(DataSourceSelectArguments.Empty);
        lab_State.Text = "查詢完畢!";
    }

    private bool CheckDateValue(TextBox txt_VisitDateStart, TextBox txt_VisitDateEnd, string dateDisplay)
    {
        DateTime dateTimeStart, dateTimeEnd;

        if (txt_VisitDateStart.Text.Trim().Length != 0)
        {
            if (DateTime.TryParseExact(txt_VisitDateStart.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeStart) == false)
            {
                lab_State.Text = dateDisplay + "開始日期格式有誤!";
                return false;
            }
        }

        if (txt_VisitDateEnd.Text.Trim().Length != 0)
        {
            if (DateTime.TryParseExact(txt_VisitDateEnd.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeEnd) == false)
            {
                lab_State.Text = dateDisplay + "結束日期格式有誤!";
                return false;
            }
        }
        if (txt_VisitDateStart.Text.Trim().Length != 0 && txt_VisitDateEnd.Text.Trim().Length != 0)
        {
            if (DateTime.TryParseExact(txt_VisitDateStart.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeStart) == false)
            {
                lab_State.Text = dateDisplay + "開始日期格式有誤!";
                return false;
            }
            if (DateTime.TryParseExact(txt_VisitDateEnd.Text, "yyyyMMdd", CultureInfo.InvariantCulture,
        DateTimeStyles.None, out dateTimeEnd) == false)
            {
                lab_State.Text = dateDisplay + "結束日期格式有誤!";
                return false;
            }
            TimeSpan ts = dateTimeStart - dateTimeEnd;
            if (ts.Days > 0)
            {
                lab_State.Text = dateDisplay + "開始日期必須大於等於結束日期!";
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }
    }

    private bool CheckMoneyValue(TextBox txt_CapitalStart, TextBox txt_CapitalEnd, ref decimal capStart, ref decimal capEnd)
    {

        if (txt_CapitalStart.Text.Trim().Length != 0)
        {
            if (decimal.TryParse(txt_CapitalStart.Text.Trim(), out capStart) == false)
            {
                lab_State.Text = "最小資本額格式有誤!";
                return false;
            }
        }

        if (txt_CapitalEnd.Text.Trim().Length != 0)
        {
            if (decimal.TryParse(txt_CapitalEnd.Text.Trim(), out capEnd) == false)
            {
                lab_State.Text = "最大資本額格式有誤!";
                return false;
            }
        }

        if (txt_CapitalStart.Text.Trim().Length != 0 && txt_CapitalEnd.Text.Trim().Length != 0)
        {
            if (decimal.TryParse(txt_CapitalStart.Text.Trim(), out capStart) == false)
            {
                lab_State.Text = "最小資本額格式有誤!";
                return false;
            }
            if (decimal.TryParse(txt_CapitalEnd.Text.Trim(), out capEnd) == false)
            {
                lab_State.Text = "最大資本額格式有誤!";
                return false;
            }
            if (capStart - capEnd > 0)
            {
                lab_State.Text = "最大資本額必須大於等於資本額最小!";
                return false;
            }
            else
            {
                return true;
            }
        }
        return true;
    }

    protected void dsQueryHiddenCust_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //StringBuilder sb = new StringBuilder();
        //sb.AppendLine(e.Command.CommandText + "<br/>");
        //for (int i = 0; i < e.Command.Parameters.Count; i++)
        //{
        //    sb.AppendLine("參數 (" + i.ToString() + "):" + e.Command.Parameters[i].Value + "<br/>");

        //}
        //Response.Write(sb.ToString());
        //e.Cancel = true;
    }
    protected void drListCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txt_EntAddress.Text = string.Empty;
        //if (drListCity.SelectedIndex != -1 && drListCity.SelectedValue != "請選擇")
        //{
        //    txt_EntAddress.Text += drListCity.SelectedValue;
        //}
    }
    protected void drListSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (drListSection.SelectedIndex != -1 && drListSection.SelectedValue != "請選擇")
        //{
        //    txt_EntAddress.Text += drListSection.SelectedValue;
        //}
    }
    protected void btn_ExportExcel_Click(object sender, EventArgs e)
    {
        decimal capStart = 0, capEnd = 0;

        if (CheckMoneyValue(txt_CapitalStart, txt_CapitalEnd, ref capStart, ref capEnd) == false)
        {
            return;
        }

        if (CheckDateValue(txt_SetDateStart, txt_SetDateEnd, "核准設立日期") == false)
        {
            return;
        }
        if (CheckDateValue(txt_ChangeDateStart, txt_ChangeDateEnd, "核准變更日期") == false)
        {
            return;
        }

        //處理查詢條件

        //hidn_condition.Value = " and a.CUSTTYPE=3 ";
        //hidn_condition.Value = "  ";
        hidn_condition.Value = " and a.CUSTTYPE <> 4 ";

        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or a.ENTNAME  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_EntAddress.Text.Trim().Length == 0 && drListCity.SelectedValue == "請選擇" && drListSection.SelectedValue == "請選擇")
        {
            ;
        }
        else
        {
            hidn_condition.Value += " AND ( ";
            string queryTextAddress = txt_EntAddress.Text.Trim().Replace("巿", "市");
            string[] sep = new string[] { "," };
            string[] queryResult = queryTextAddress.Split(sep, StringSplitOptions.None);
            int count = 0;
            string resultAddress = string.Empty;
            foreach (string address in queryResult)
            {
                resultAddress = string.Empty;
                resultAddress += (drListCity.SelectedIndex != -1 && drListCity.SelectedValue != "請選擇") ?
                    drListCity.SelectedValue : "%";
                resultAddress += (drListSection.SelectedIndex != -1 && drListSection.SelectedValue != "請選擇") ?
                    drListSection.SelectedValue : "%";
                resultAddress += address;
                resultAddress = resultAddress.Replace("巿", "市");
                if (count == 0)
                {
                    hidn_condition.Value += " (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                    count = 1;
                }
                else
                {
                    hidn_condition.Value += " or  (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                }
            }
            hidn_condition.Value += " ) ";
        }
        if (txt_ContractPeople.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.CONTRACTPEOPLE like '%" + txt_ContractPeople.Text.Trim() + "%')  ";
        }

        capStart *= 1000;
        capEnd *= 1000;

        if (txt_CapitalStart.Text.Trim().Length != 0 && txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL BETWEEN '" + capStart.ToString() + "' and  '" + capEnd.ToString() + "' ";
        }
        else if (txt_CapitalStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL >='" + capStart.ToString() + "' ";
        }
        else if (txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL  <= '" + capEnd.ToString() + "' ";
        }
        else
        {
            ;
        }


        if (txt_SetDateStart.Text.Trim().Length != 0 && txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE BETWEEN '" + txt_SetDateStart.Text.Trim() + "' and  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else if (txt_SetDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE>= '" + txt_SetDateStart.Text.Trim() + "' ";
        }
        else if (txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE <=  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        if (txt_ChangeDateStart.Text.Trim().Length != 0 && txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE BETWEEN '" + txt_ChangeDateStart.Text.Trim() + "' and  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE>= '" + txt_ChangeDateStart.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE <=  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        //取得上市別
        string entType = string.Empty;
        for (int q = 0; q < chkList_EntType.Items.Count; q++)
        {
            if (chkList_EntType.Items[q].Selected == true)
            {
                entType += ",'" + chkList_EntType.Items[q].Value + "' ";
            }
        }
        //Response.Write(entType.Substring(1, entType.Length - 1));
        if (entType.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( b.mkt in ( " + entType.Substring(1, entType.Length - 1) + " ) ) ";
        }
        hidn_condition.Value += " and ( a.DISSOLVEDATE IS NULL OR a.DISSOLVEDATE = '' ) ";

        DataTable dtSource = ((DataView)dsQueryHiddenCust0.Select(DataSourceSelectArguments.Empty)).Table;
        lab_State.Text = "查詢完畢!";

        MemoryStream ms2 = ExcelUtility.RenderDataTableToExcel(dtSource) as MemoryStream;
        //string saveFileName = GetSavePath();
        //File.WriteAllBytes(saveFileName, ms2.ToArray());
        // 設定強制下載標頭。
        Response.AddHeader("Content-Disposition", string.Format("attachment; filename=HIDDENCUST_" + DateTime.Now.ToString("yyyyMMdd") + ".xls"));
        //輸出檔案。        
        Response.BinaryWrite(ms2.ToArray());


    }

    protected void btn_ExportExcel2_Click(object sender, EventArgs e)
    {
        decimal capStart = 0, capEnd = 0;

        if (CheckMoneyValue(txt_CapitalStart, txt_CapitalEnd, ref capStart, ref capEnd) == false)
        {
            return;
        }

        if (CheckDateValue(txt_SetDateStart, txt_SetDateEnd, "核准設立日期") == false)
        {
            return;
        }
        if (CheckDateValue(txt_ChangeDateStart, txt_ChangeDateEnd, "核准變更日期") == false)
        {
            return;
        }

        //處理查詢條件

        //hidn_condition.Value = " and a.CUSTTYPE=3 ";
        //hidn_condition.Value = "  ";
        hidn_condition.Value = " and a.CUSTTYPE <> 4 ";

        if (txt_SERNO.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.SERNO like '%" + txt_SERNO.Text.Trim() + "%' or a.ENTNAME  like '%" + txt_SERNO.Text.Trim() + "%' )  ";
        }
        if (txt_EntAddress.Text.Trim().Length == 0 && drListCity.SelectedValue == "請選擇" && drListSection.SelectedValue == "請選擇")
        {
            ;
        }
        else
        {
            hidn_condition.Value += " AND ( ";
            string queryTextAddress = txt_EntAddress.Text.Trim().Replace("巿", "市");
            string[] sep = new string[] { "," };
            string[] queryResult = queryTextAddress.Split(sep, StringSplitOptions.None);
            int count = 0;
            string resultAddress = string.Empty;
            foreach (string address in queryResult)
            {
                resultAddress = string.Empty;
                resultAddress += (drListCity.SelectedIndex != -1 && drListCity.SelectedValue != "請選擇") ?
                    drListCity.SelectedValue : "%";
                resultAddress += (drListSection.SelectedIndex != -1 && drListSection.SelectedValue != "請選擇") ?
                    drListSection.SelectedValue : "%";
                resultAddress += address;
                resultAddress = resultAddress.Replace("巿", "市");
                if (count == 0)
                {
                    hidn_condition.Value += " (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                    count = 1;
                }
                else
                {
                    hidn_condition.Value += " or  (a.ENTADDRESS like '%" + resultAddress + "%')  ";
                }
            }
            hidn_condition.Value += " ) ";
        }
        if (txt_ContractPeople.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and (a.CONTRACTPEOPLE like '%" + txt_ContractPeople.Text.Trim() + "%')  ";
        }

        capStart *= 1000;
        capEnd *= 1000;

        if (txt_CapitalStart.Text.Trim().Length != 0 && txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL BETWEEN '" + capStart.ToString() + "' and  '" + capEnd.ToString() + "' ";
        }
        else if (txt_CapitalStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL >='" + capStart.ToString() + "' ";
        }
        else if (txt_CapitalEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CAPITAL  <= '" + capEnd.ToString() + "' ";
        }
        else
        {
            ;
        }


        if (txt_SetDateStart.Text.Trim().Length != 0 && txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE BETWEEN '" + txt_SetDateStart.Text.Trim() + "' and  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else if (txt_SetDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE>= '" + txt_SetDateStart.Text.Trim() + "' ";
        }
        else if (txt_SetDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.SETDATE <=  '" + txt_SetDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        if (txt_ChangeDateStart.Text.Trim().Length != 0 && txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE BETWEEN '" + txt_ChangeDateStart.Text.Trim() + "' and  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateStart.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE>= '" + txt_ChangeDateStart.Text.Trim() + "' ";
        }
        else if (txt_ChangeDateEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and  a.CHANGEDATE <=  '" + txt_ChangeDateEnd.Text.Trim() + "' ";
        }
        else
        {
            ;
        }

        //取得上市別
        string entType = string.Empty;
        for (int q = 0; q < chkList_EntType.Items.Count; q++)
        {
            if (chkList_EntType.Items[q].Selected == true)
            {
                entType += ",'" + chkList_EntType.Items[q].Value + "' ";
            }
        }
        //Response.Write(entType.Substring(1, entType.Length - 1));
        if (entType.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( b.mkt in ( " + entType.Substring(1, entType.Length - 1) + " ) ) ";
        }
        hidn_condition.Value += " and ( a.DISSOLVEDATE IS NULL OR a.DISSOLVEDATE = '' ) ";

        //DataTable dtSource = ((DataView)dsQueryHiddenCust1.Select(DataSourceSelectArguments.Empty)).Table;
        DataTable dtSource = ((DataView)dsQueryHiddenCust1.Select(DataSourceSelectArguments.Empty)).Table;
        lab_State.Text = "查詢完畢!";
        ChangeDisplayTable(ref dtSource);
        MemoryStream ms2 = ExcelUtility.RenderDataTableToExcel(dtSource) as MemoryStream;
        //string saveFileName = GetSavePath();
        //File.WriteAllBytes(saveFileName, ms2.ToArray());
        // 設定強制下載標頭。
        Response.AddHeader("Content-Disposition", string.Format("attachment; filename=HIDDENCUST_" + DateTime.Now.ToString("yyyyMMdd") + ".xls"));
        //輸出檔案。        
        Response.BinaryWrite(ms2.ToArray());
    }

    private void ChangeDisplayTable(ref DataTable sourceTable)
    {
        decimal resultAmt;
        float resultPercent;
        foreach (DataRow dr in sourceTable.Rows)
        {
            foreach (DataColumn dc in sourceTable.Columns)
            {
                if (dc.ColumnName.Contains("千元") == true)
                {
                    if (decimal.TryParse(dr[dc.ColumnName].ToString().Trim(), out resultAmt) == true)
                    {
                        resultAmt /= 1000;
                        dr[dc.ColumnName] = resultAmt.ToString();
                    }
                }
                if (dc.ColumnName.Contains("%") == true)
                {
                    if (float.TryParse(dr[dc.ColumnName].ToString().Trim(), out resultPercent) == true)
                    {
                        resultPercent *= 100;
                        dr[dc.ColumnName] = resultPercent.ToString() + "%";
                    }
                }
            }

        }
    }
}