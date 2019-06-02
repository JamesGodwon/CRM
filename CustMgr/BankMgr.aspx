<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BankMgr.aspx.cs"
    Inherits="BankMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>銀行檔維護</title>
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
                ID="lab_Title" runat="server">銀行檔維護</asp:Label> </strong>
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
            </span>
    </div>
    <table style="width:100%;">
        <tr>
            <td>
    <asp:Label ID="Label3" runat="server" Text="匯入通匯銀行檔"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            
        </tr>           
    </table>
    <asp:Button ID="btn_Add" runat="server" Text="匯入" onclick="btn_Add_Click" />
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
            
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
        DataKeyNames="BANKNO,BRANCHNO" DataSourceID="dsBank" 
        EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="BANKNO" HeaderText="參加單位代號" ReadOnly="True" 
                        SortExpression="BANKNO" />
                    <asp:BoundField DataField="BRANCHNO" HeaderText="分支機構代號" ReadOnly="True" 
                        SortExpression="BRANCHNO" />
                    <asp:BoundField DataField="BANKNAME" HeaderText="總分支機構名稱" 
                        SortExpression="BANKNAME" />
                    <asp:BoundField DataField="BANKNICKNAME" HeaderText="總分支機構簡稱名稱" 
                        SortExpression="BANKNICKNAME" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>            
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:SqlDataSource ID="dsBank" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM CUSTMGR_BANK" 
        InsertCommand="INSERT INTO [CUSTMGR_BANK] ([BANKNO], [BRANCHNO], [BANKNAME], [BANKNICKNAME]) VALUES (@BANKNO, @BRANCHNO, @BANKNAME, @BANKNICKNAME)" 
        SelectCommand="SELECT BANKNO, BRANCHNO, BANKNAME, BANKNICKNAME FROM CUSTMGR_BANK ORDER BY BANKNO, BRANCHNO" 
        
        UpdateCommand="UPDATE [CUSTMGR_BANK] SET [BANKNAME] = @BANKNAME, [BANKNICKNAME] = @BANKNICKNAME WHERE [BANKNO] = @BANKNO AND [BRANCHNO] = @BRANCHNO">
        <InsertParameters>
            <asp:Parameter Name="BANKNO" />
            <asp:Parameter Name="BRANCHNO" />
            <asp:Parameter Name="BANKNAME" />
            <asp:Parameter Name="BANKNICKNAME" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BANKNAME" Type="String" />
            <asp:Parameter Name="BANKNICKNAME" Type="String" />
            <asp:Parameter Name="BANKNO" Type="String" />
            <asp:Parameter Name="BRANCHNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

