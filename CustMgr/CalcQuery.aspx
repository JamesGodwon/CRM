<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalcQuery.aspx.cs"
    Inherits="CalcQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>統計查詢</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
</head>
<body>
    <form id="form1" runat="server">
    <div>                 
            <table border="2" cellpadding="2" cellspacing="2" width="720">
                <td class="style2">
                    <img alt=""  src="彰銀圖.gif" style="vertical-align: text-align: center" 
                        width="50" />
                </td>
                <td colspan=3>
                    <span><strong>
                    <asp:Label
                ID="lab_Title" Text="統計查詢" runat="server"></asp:Label> </strong>
                    </span>
                </td>
                <tr>
                    <td bgcolor="khaki">
                        &nbsp;<span><asp:Label ID="Label2" runat="server" Text="單位" 
                            style="font-size: medium"></asp:Label>
                        </span>
                    </td>
                    <td>
                        &nbsp;<span  ><asp:Label ID="lab_BRNO" runat="server" 
                               style="color: #3333FF"></asp:Label>
                        </span>
                        &nbsp;
                    <span  ><asp:Label ID="lab_BRNAME" runat="server"    
                            style="color: #3333FF"></asp:Label>
                        </span>
                    </td>
                    <td bgcolor="khaki">
        <span  >
            <asp:Label ID="Label1" runat="server" Text="使用者" style="font-size: medium"></asp:Label>
                        </span>
    &nbsp;</td>
                    <td >
                        &nbsp;&nbsp; 
        <span  >
            <asp:Label ID="lab_EmpNo" runat="server" CssClass="style1" ></asp:Label>
            <asp:Label ID="lab_EmpName" runat="server" CssClass="style1"></asp:Label>
                        </span>
                    </td>
                </tr>
            </table>
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong></span>
    </div>
    <b>
    <p>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Program/CustMgr/CustListReport.aspx">客戶名單</asp:HyperLink><br />
    </p>
    <p>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Program/CustMgr/DiaryReport.aspx">訪問日誌</asp:HyperLink>
    </p>
    <p>
    <b>
    <asp:HyperLink ID="HyperLink5" runat="server" 
            NavigateUrl="~/Program/CustMgr/DiaryReportNewCust.aspx">新戶拜訪日誌統計</asp:HyperLink>
    </b>
    </p>
    <p>
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Program/CustMgr/ChanceReport.aspx">商機追蹤表</asp:HyperLink>
    </p>
    <p>
    <b>
    <asp:HyperLink ID="HyperLink4" runat="server" 
            NavigateUrl="~/Program/CustMgr/DiaryMonthlyReport.aspx">經管客戶互動頻率統計月報</asp:HyperLink>
    </b>
    </p>
    </b>
    </form>
</body>
</html>

