using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class ImpQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {                
    }

    protected bool VisableUp(string Val)
    {
        if (Val.Trim()=="↑")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected bool VisableDown(string Val)
    {
        if (Val.Trim() == "↓")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected bool VisableNew(string Val)
    {
        string currentYearMonty = DateTime.Now.ToString("yyyy/MM");
        if (Val.Trim().Contains(currentYearMonty)==true)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// 檢查日期(西元年,YYYYMMDD).
    /// </summary>
    /// <param name="input">The input.</param>
    public static bool CheckDateWithYYYYMMDD(string input)
    {
        DateTime dtin;
        if (DateTime.TryParseExact(input, "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out dtin) == false)
        {
            return false;
        }
        return true;
    }
    /// <summary>
    /// 檢查年月(西元年,YYYYMM).
    /// </summary>
    /// <param name="input">The input.</param>
    public static bool CheckDateWithYYYYMM(string input)
    {
        DateTime dtin;
        if (DateTime.TryParseExact(input, "yyyyMM", CultureInfo.InvariantCulture, DateTimeStyles.None, out dtin) == false)
        {
            return false;
        }
        return true;
    }
    protected void btn_Query_Click(object sender, EventArgs e)
    {
        DateTime startDate, endDate;
        #region 欄位數值檢查
        if (txt_PerDayStart.Text.Trim().Length != 0 && txt_PerDayEnd.Text.Trim().Length == 0)
        {
            lab_State.Text = "請輸入結束評等日期!";
            txt_PerDayEnd.Focus();
            return;
        }
        if (txt_PerDayStart.Text.Trim().Length == 0 && txt_PerDayEnd.Text.Trim().Length != 0)
        {
            lab_State.Text = "請輸入開始評等日期!";
            txt_PerDayStart.Focus();
            return;
        }
        if (txt_PerDayStart.Text.Trim().Length != 0 && CheckDateWithYYYYMMDD(txt_PerDayStart.Text.Trim()) == false)
        {
            lab_State.Text = "開始評等日期格式有誤(需為西元年)!";
            txt_PerDayStart.Focus();
            return;
        }
        if (txt_PerDayEnd.Text.Trim().Length != 0 && CheckDateWithYYYYMMDD(txt_PerDayEnd.Text.Trim()) == false)
        {
            lab_State.Text = "結束評等日期格式有誤(需為西元年)!";
            txt_PerDayEnd.Focus();
            return;
        }
        DateTime.TryParseExact(txt_PerDayStart.Text.Trim(), "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate);
        DateTime.TryParseExact(txt_PerDayEnd.Text.Trim(), "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate);
        TimeSpan ts = startDate - endDate;
        if (ts.Days > 0)
        {
            lab_State.Text = "開始評等日期不可大於結束評等日期!";
            txt_PerDayStart.Focus();
            return;
        }
        #endregion
        hidn_condition.Value = string.Empty;
        if (txt_SernoChange.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and crm1.invoice like '%" + txt_SernoChange.Text.Trim() + "%' ";
        }
        if (txt_PerDayStart.Text.Trim().Length != 0 && txt_PerDayEnd.Text.Trim().Length != 0)
        {
            hidn_condition.Value += " and ( crm1.ad_tcri between " + txt_PerDayStart.Text.Trim() + " and " + txt_PerDayEnd.Text.Trim() + " ) ";
        }
        lab_State.Text = "查詢完畢!";
        //hidn_condition.Value = " and crm1.ad_tcri ='" + txt_SernoChange.Text.Trim() + "' ";
        //hidn_condition2.Value = " and crm1.yymmdd ='" + txt_SernoChange.Text.Trim() + "' ";
        //string condition = "";
        //if (txt_SernoChange.Text.Trim().Length != 0)
        //    condition = txt_SernoChange.Text.Trim().Substring(0, 6);
        //hidn_condition3.Value = " and (replace(replace(right(replace(crm1.pman1,' ',''),8),'/',''),')','') = '" + condition + "'";
        //hidn_condition3.Value += " or replace(replace(right(replace(crm1.qman1,' ',''),8),'/',''),')','') = '" + condition + "'";
        //hidn_condition3.Value += " or replace(replace(right(replace(crm1.fman1,' ',''),8),'/',''),')','') = '" + condition + "')";
    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridView customersGridView = (GridView)e.CommandSource;
        GridViewRow row = null;
        try
        {
            row = customersGridView.Rows[index];
        }
        catch (Exception ex)
        {
            row = customersGridView.Rows[0];
        }
        Label lb = (Label)row.FindControl("Label_content");
        if (e.CommandName == "readall")
        {
            lb.CssClass = lb.CssClass.Replace("Initread", "");
        }
        if (e.CommandName == "cancelall")
        {
            lb.CssClass = "Initread";
        }
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lb = (Label)e.Row.Cells[8].FindControl("Label_content");
            lb.CssClass = "Initread";
        }
    }
    protected void btn_Query0_Click(object sender, EventArgs e)
    {
        DateTime startDate, endDate;
        #region 欄位數值檢查
        if (txt_CheckDayStart.Text.Trim().Length != 0 && txt_CheckDayEnd.Text.Trim().Length == 0)
        {
            lab_State0.Text = "請輸入結束事件日期!";
            txt_CheckDayEnd.Focus();
            return;
        }
        if (txt_CheckDayStart.Text.Trim().Length == 0 && txt_CheckDayEnd.Text.Trim().Length != 0)
        {
            lab_State0.Text = "請輸入開始事件日期!";
            txt_CheckDayStart.Focus();
            return;
        }
        if (txt_CheckDayStart.Text.Trim().Length != 0 && CheckDateWithYYYYMMDD(txt_CheckDayStart.Text.Trim()) == false)
        {
            lab_State0.Text = "開始事件日期格式有誤(需為西元年)!";
            txt_CheckDayStart.Focus();
            return;
        }
        if (txt_CheckDayEnd.Text.Trim().Length != 0 && CheckDateWithYYYYMMDD(txt_CheckDayEnd.Text.Trim()) == false)
        {
            lab_State0.Text = "結束事件日期格式有誤(需為西元年)!";
            txt_CheckDayEnd.Focus();
            return;
        }
        DateTime.TryParseExact(txt_CheckDayStart.Text.Trim(), "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate);
        DateTime.TryParseExact(txt_CheckDayEnd.Text.Trim(), "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate);
        TimeSpan ts = startDate - endDate;
        if (ts.Days > 0)
        {
            lab_State0.Text = "開始事件日期不可大於結束事件日期!";
            txt_CheckDayStart.Focus();
            return;
        }
        #endregion
        hidn_condition2.Value = string.Empty;
        if (txt_SernoChange1.Text.Trim().Length != 0)
        {
            hidn_condition2.Value += " and crm3.invoice like '%" + txt_SernoChange1.Text.Trim() + "%' ";
        }
        if (txt_CheckDayStart.Text.Trim().Length != 0 && txt_CheckDayEnd.Text.Trim().Length != 0)
        {
            hidn_condition2.Value += " and ( crm1.yymmdd between " + txt_CheckDayStart.Text.Trim() + " and " + txt_CheckDayEnd.Text.Trim() + " ) ";
        }
        lab_State0.Text = "查詢完畢!";
    }
    protected void btn_Query1_Click(object sender, EventArgs e)
    {
        DateTime startDate, endDate;        
        #region 欄位數值檢查
        if (txt_MonthStart.Text.Trim().Length != 0 && txt_MonthEnd.Text.Trim().Length == 0)
        {
            lab_State1.Text = "請輸入結束擔任年月!";
            txt_MonthEnd.Focus();
            return;
        }
        if (txt_MonthStart.Text.Trim().Length == 0 && txt_MonthEnd.Text.Trim().Length != 0)
        {
            lab_State1.Text = "請輸入開始擔任年月!";
            txt_MonthStart.Focus();
            return;
        }
        if (txt_MonthStart.Text.Trim().Length != 0 && CheckDateWithYYYYMM(txt_MonthStart.Text.Trim()) == false)
        {
            lab_State1.Text = "開始擔任年月格式有誤(需為西元年)!";
            txt_MonthStart.Focus();
            return;
        }
        if (txt_MonthEnd.Text.Trim().Length != 0 && CheckDateWithYYYYMM(txt_MonthEnd.Text.Trim()) == false)
        {
            lab_State1.Text = "結束擔任年月格式有誤(需為西元年)!";
            txt_MonthEnd.Focus();
            return;
        }
        DateTime.TryParseExact(txt_MonthStart.Text.Trim(), "yyyyMM", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate);
        DateTime.TryParseExact(txt_MonthEnd.Text.Trim(), "yyyyMM", CultureInfo.InvariantCulture, DateTimeStyles.None, out endDate);
        TimeSpan ts = startDate - endDate;
        if (ts.Days > 0)
        {
            lab_State1.Text = "開始擔任年月不可大於結束擔任年月!";
            txt_MonthStart.Focus();
            return;
        }
        #endregion
        hidn_condition3.Value = string.Empty;
        if (txt_SernoChange2.Text.Trim().Length != 0)
        {
            hidn_condition3.Value += " and crm2.invoice like '%" + txt_SernoChange2.Text.Trim() + "%' ";
        }
        if (txt_MonthStart.Text.Trim().Length != 0 && txt_MonthEnd.Text.Trim().Length != 0)
        {
            hidn_condition3.Value += " and (replace(replace(right(replace(crm1.pman1,' ',''),8),'/',''),')','') between '" + txt_MonthStart.Text.Trim() + "' and '"+txt_MonthEnd.Text.Trim()+"' ";
            hidn_condition3.Value += " or replace(replace(right(replace(crm1.qman1,' ',''),8),'/',''),')','') between '" + txt_MonthStart.Text.Trim() + "' and '" + txt_MonthEnd.Text.Trim() + "' ";
            hidn_condition3.Value += " or replace(replace(right(replace(crm1.fman1,' ',''),8),'/',''),')','') between '" + txt_MonthStart.Text.Trim() + "' and '" + txt_MonthEnd.Text.Trim() + "' ) ";
        }
        //hidn_condition3.Value = " and (replace(replace(right(replace(crm1.pman1,' ',''),8),'/',''),')','') = '" + condition + "'";
        //hidn_condition3.Value += " or replace(replace(right(replace(crm1.qman1,' ',''),8),'/',''),')','') = '" + condition + "'";
        //hidn_condition3.Value += " or replace(replace(right(replace(crm1.fman1,' ',''),8),'/',''),')','') = '" + condition + "')";
        lab_State1.Text = "查詢完畢!";
    }  
}