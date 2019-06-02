using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImpBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime dtQuery = DateTime.Now;
            int dayPeriod = -7;
            hidn_condition.Value = " and crm1.ad_tcri between " + dtQuery.AddDays(dayPeriod).ToString("yyyyMMdd") + " and " + dtQuery.ToString("yyyyMMdd");
            hidn_condition2.Value = " and crm1.yymmdd between " + dtQuery.AddDays(dayPeriod).ToString("yyyyMMdd") + " and " + dtQuery.ToString("yyyyMMdd");
            hidn_condition3.Value = " and (replace(replace(right(replace(crm1.pman1,' ',''),8),'/',''),')','') between '" + dtQuery.AddDays(dayPeriod).ToString("yyyyMMdd").Substring(0, 6) + "' and '" + dtQuery.ToString("yyyyMMdd").Substring(0, 6) + "'";
            hidn_condition3.Value += " or replace(replace(right(replace(crm1.qman1,' ',''),8),'/',''),')','')  between '" + dtQuery.AddDays(dayPeriod).ToString("yyyyMMdd").Substring(0, 6) + "' and '" + dtQuery.ToString("yyyyMMdd").Substring(0, 6) + "'";
            hidn_condition3.Value += " or replace(replace(right(replace(crm1.fman1,' ',''),8),'/',''),')','')  between '" + dtQuery.AddDays(dayPeriod).ToString("yyyyMMdd").Substring(0, 6) + "' and '" + dtQuery.ToString("yyyyMMdd").Substring(0, 6) + "')";
        }
    }    

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {                
        //int index = Convert.ToInt32(e.CommandArgument);        
        //GridView customersGridView = (GridView)e.CommandSource;
        //GridViewRow row = null;
        //try
        //{
        //    row = customersGridView.Rows[index];
        //}
        //catch (Exception ex)
        //{
        //    row = customersGridView.Rows[0];
        //}
        //Label lb = (Label)row.FindControl("Label_content");
        //if (e.CommandName == "readall")
        //{
        //    lb.CssClass = lb.CssClass.Replace("Initread", "");
        //}
        //if (e.CommandName == "cancelall")
        //{
        //    lb.CssClass = "Initread";
        //}
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label lb = (Label)e.Row.Cells[8].FindControl("Label_content");
        //    lb.CssClass = "Initread";
        //}
    }

    protected bool VisableUp(string Val)
    {
        if (Val.Trim() == "↑")
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
        if (Val.Trim().Contains(currentYearMonty) == true)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
}