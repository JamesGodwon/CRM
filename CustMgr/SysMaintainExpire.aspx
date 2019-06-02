<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SysMaintainExpire.aspx.cs"
    Inherits="SysMaintainExpire" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>系統維護中</title>
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
                ID="lab_Title" Text="系統維護中" runat="server"></asp:Label> </strong>
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
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:Label ID="Label3" runat="server" 
        style="font-weight: 700; font-size: large; color: #0000FF" Text="系統維護中!"></asp:Label>
    </form>
</body>
</html>

