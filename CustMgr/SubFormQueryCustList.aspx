<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubFormQueryCustList.aspx.cs"
    Inherits="SubFormQueryCustList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>搜尋客戶資料</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <script language="javascript" type="text/javascript">
    //取得父視窗的網址
        function GetPriviousUrl() {
            document.getElementById('hidn_Url').value = opener.location.href;
        } 
    </script>
</head>
<body onload=" GetPriviousUrl()">
    <form id="form1" runat="server">
    <div>                 
            <table border="2" cellpadding="2" cellspacing="2" width="720">
                <td class="style2">
                    <img alt=""  src="彰銀圖.gif" style="vertical-align: text-align: center" 
                        width="50" />
                </td>
                <td colspan=3>
                    <span><strong>
                        <asp:HiddenField ID="hidn_Url" runat="server" />
                    <asp:Label
                ID="lab_Title" Text="搜尋客戶資料" runat="server"></asp:Label> </strong>
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
    <asp:Label ID="Label3" runat="server" Text="請輸入客戶統編或名稱"></asp:Label>
    <asp:TextBox ID="txt_QueryID" runat="server"></asp:TextBox>
    <asp:Button ID="btn_Query" runat="server" Text="搜尋" onclick="btn_Query_Click" />
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" CellSpacing="2" DataKeyNames="SERNO" 
                            DataSourceID="dsQuerySerNo"                             
                            
        onselectedindexchanging="GridView3_SelectedIndexChanging" 
        AllowPaging="True" PageSize="5" EmptyDataText="查無資料" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="SERNO" HeaderText="統一編號" SortExpression="SERNO" />
            <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" 
                                    SortExpression="ACCOUNTNAME" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
        <asp:Label ID="Label4" runat="server"></asp:Label>
    <asp:SqlDataSource ID="dsQuerySerNo" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            
                            
        
        
        
        SelectCommand="EXEC(' SELECT SERNO, ACCOUNTNAME FROM CUSTMGR_CUSTLIST WHERE 1=1 '+@condition)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_Condition" Name="condition" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_SubControl" runat="server" />
    <asp:HiddenField ID="hidn_Condition" runat="server" />
    </form>
</body>
</html>

