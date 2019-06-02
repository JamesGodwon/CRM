<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrnoMgrEdit.aspx.cs" Inherits="BrnoMgrEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>變更管理員</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="2" cellpadding="2" cellspacing="2" width="720">
            <td class="style2">
                <img alt="" src="彰銀圖.gif" style="vertical-align: text-align: center" width="50" />
                <span></span>
            </td>
            <td colspan="3">
                <span><strong>
                    <asp:Label ID="lab_Title" runat="server">管理員維護</asp:Label>
                    </strong>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Program/CustMgr/CustQuery.aspx">【回到客戶管理】</asp:HyperLink>
                </span>
            </td>
            <tr>
                <td bgcolor="khaki">
                    &nbsp;<span><asp:Label ID="Label2" runat="server" Text="單位" Style="font-size: medium"></asp:Label>
                    </span>
                </td>
                <td>
                    &nbsp;<span><asp:Label ID="lab_BRNO" runat="server" Style="color: #3333FF"></asp:Label>
                    </span>&nbsp; <span>
                        <asp:Label ID="lab_BRNAME" runat="server" Style="color: #3333FF"></asp:Label>
                    </span>
                </td>
                <td bgcolor="khaki">
                    <span>
                        <asp:Label ID="Label1" runat="server" Text="使用者" Style="font-size: medium"></asp:Label>
                    </span>&nbsp;
                </td>
                <td>
                    &nbsp;&nbsp; <span>
                        <asp:Label ID="lab_EmpNo" runat="server" CssClass="style1"></asp:Label>
                        <asp:Label ID="lab_EmpName" runat="server" CssClass="style1"></asp:Label>
                    </span>
                </td>
            </tr>
        </table>
        </span>
    </div>
    <asp:Label ID="Label14" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="新增/刪除管理員"></asp:Label>&nbsp;<table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="分行代號"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_BRNO" runat="server" Width="314px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="管理員姓名"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drList_MgrIdForEdit" runat="server" 
                    DataSourceID="dsSelectMgrIdForEdit" DataTextField="NAME" DataValueField="STAFF">
                </asp:DropDownList>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="職務"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rbtn_Position" runat="server" DataSourceID="dsPosition"
                    DataTextField="COLDESC" DataValueField="COLVALUE" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="dsPosition" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
                    
                    SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'POSITION')">
                </asp:SqlDataSource>
        </tr>
    </table>
    <asp:Button ID="btn_Add" runat="server" Text="新增" OnClick="btn_Add_Click" />
    <asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label><br />
    <asp:Label ID="Label10" runat="server" Text="管理員名單" 
        style="font-weight: 700; color: #0000FF"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
        DataKeyNames="BRNO,MGREMPNO" DataSourceID="dsBrnoMgrEdit" EnableModelValidation="True"
        EmptyDataText="無分行管理員資料">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" onclientclick="return confirm('是否要刪除?')" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BRNO" HeaderText="分行代號" ReadOnly="True" SortExpression="BRNO" />
            <asp:BoundField DataField="MGREMPNO" HeaderText="管理員員編" ReadOnly="True" SortExpression="MGREMPNO" />
            <asp:BoundField DataField="NAME" HeaderText="管理員姓名" SortExpression="NAME" />
            <asp:BoundField DataField="COLDESC" HeaderText="職務" SortExpression="COLDESC" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <hr />
    <asp:HiddenField ID="hidn_EDITMGRNO" runat="server" />
    <br />
    <asp:SqlDataSource ID="dsBrnoMgrEdit" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
        DeleteCommand="DELETE FROM [CUSTMGR_EDITMGR] WHERE [BRNO] = @BRNO AND [MGREMPNO] = @MGREMPNO"
        InsertCommand="INSERT INTO [CUSTMGR_EDITMGR] ([BRNO], [MGREMPNO], [POSITION]) VALUES (@BRNO, @MGREMPNO, @POSITION)"
        SelectCommand="SELECT a.BRNO, a.MGREMPNO, a.POSITION, c.COLDESC, b.NAME FROM CUSTMGR_EDITMGR AS a INNER JOIN CUSTMGR_OPTION AS c ON a.POSITION = c.COLVALUE AND c.DBCOLUMN = 'POSITION' LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @BRNO) ORDER BY b.STAFF"
        
        UpdateCommand="UPDATE [CUSTMGR_EDITMGR] SET [POSITION] = @POSITION, [BUILDDATE] = @BUILDDATE WHERE [BRNO] = @BRNO AND [MGREMPNO] = @MGREMPNO">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="drList_MgrIdForEdit" Name="MGREMPNO" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="rbtn_Position" Name="POSITION" PropertyName="SelectedValue"
                Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="POSITION" Type="Int32" />
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <strong>
        <asp:HiddenField ID="hidn_EmpNo" runat="server" />
    </strong>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:SqlDataSource ID="dsCheckEmpNo" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub1 %>"
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM EMPLOYEE WHERE (STAFF = @STAFF) AND (BRNO = @BRNO)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_EDITMGRNO" Name="STAFF" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label11" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="變更管理員所屬客戶名單"></asp:Label><br />
    <asp:Label ID="Label12" runat="server" Text="STEP1 選擇要變更管理員的客戶" 
        style="font-weight: 700; color: #3333CC"></asp:Label><br />
    <asp:Button ID="btn_SelectAll" runat="server" Text="全選" 
        onclick="btn_SelectAll_Click" />&nbsp;
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="SERNO,BRNO" 
        DataSourceID="dsBrnoMgrChange" EmptyDataText="無客戶名單資料可交接" 
        EnableModelValidation="True">
        <Columns>
            <asp:TemplateField HeaderText="選取">
                <ItemTemplate>
                    <asp:CheckBox ID="ck_MgrSelected" runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" 
                SortExpression="ACCOUNTNAME" />
            <asp:TemplateField HeaderText="統一編號" SortExpression="SERNO">
                <ItemTemplate>
                    <asp:Label ID="lab_SerNo" runat="server" Text='<%# Bind("SERNO") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SERNO") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="分行代號" SortExpression="BRNO">
                <ItemTemplate>
                    <asp:Label ID="lab_BrNo" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("BRNO") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MGREMPNO" HeaderText="管理員員編" 
                SortExpression="MGREMPNO" />
            <asp:BoundField DataField="NAME" HeaderText="管理員姓名" SortExpression="NAME" />
            <asp:BoundField DataField="COLDESC" HeaderText="職稱" SortExpression="COLDESC" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsBrnoMgrChange" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
        DeleteCommand="DELETE FROM [CUSTMGR_EDITMGR] WHERE [BRNO] = @BRNO AND [MGREMPNO] = @MGREMPNO"
        InsertCommand="INSERT INTO [CUSTMGR_EDITMGR] ([BRNO], [MGREMPNO], [POSITION]) VALUES (@BRNO, @MGREMPNO, @POSITION)"
        SelectCommand="SELECT a.ACCOUNTNAME, a.SERNO, a.BRNO, a.MGREMPNO, c.COLDESC, d.NAME FROM CUSTMGR_CUSTLIST AS a LEFT OUTER JOIN CUSTMGR_EDITMGR AS b ON a.BRNO = b.BRNO AND a.MGREMPNO = b.MGREMPNO LEFT OUTER JOIN CUSTMGR_OPTION AS c ON b.POSITION = c.COLVALUE AND c.DBCOLUMN = 'POSITION' LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS d ON a.MGREMPNO = d.STAFF WHERE (a.BRNO = @BRNO) AND (a.USEFUL = 'Y') ORDER BY a.MGREMPNO"
        
        
        
        
        
        UpdateCommand="UPDATE CUSTMGR_CUSTLIST SET MGREMPNO = @MGREMPNO WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="drList_MgrIdForEdit" Name="MGREMPNO" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="rbtn_Position" Name="POSITION" PropertyName="SelectedValue"
                Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MGREMPNO" />
            <asp:Parameter Name="BRNO" />
            <asp:Parameter Name="SERNO" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSelectMgrId" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                        
                        
        SelectCommand="SELECT a.MGREMPNO + '_' + b.NAME + '_' + c.COLDESC AS NAME, a.MGREMPNO FROM CUSTMGR_EDITMGR AS a INNER JOIN CUSTMGR_OPTION AS c ON a.POSITION = c.COLVALUE AND c.DBCOLUMN = 'POSITION' LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @BRNO) ORDER BY b.STAFF">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSelectMgrIdForEdit" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                        
                        
        
        
        SelectCommand="SELECT '請選擇' AS NAME, '- 1' AS STAFF UNION SELECT STAFF + '_' + NAME AS Expr1, STAFF FROM chb_pub.dbo.EMPLOYEE WHERE (BRNO = @BRNO) AND (STATUS = 1) ORDER BY STAFF">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label13" runat="server" Text="STEP2 選擇新管理員" 
        style="font-weight: 700; color: #3333CC"></asp:Label>
    <br />
    <asp:DropDownList ID="drList_MgrId" runat="server" DataSourceID="dsSelectMgrId" 
                        DataTextField="NAME" DataValueField="MGREMPNO" 
        Width="200px">
    </asp:DropDownList>
    <asp:Button ID="Button2" runat="server" Text="變更" onclick="Button2_Click" />
    <asp:Label ID="lab_State2" runat="server" Style="color: #0000FF"></asp:Label>
    </form>
</body>
</html>
