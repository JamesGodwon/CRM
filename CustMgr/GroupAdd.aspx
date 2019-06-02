<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupAdd.aspx.cs"
    Inherits="GroupAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>集團新增/變更/刪除</title>
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
                ID="lab_Title" Text="集團新增/變更/刪除" runat="server"></asp:Label> </strong>
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
            <table style="width:100%;">
            <tr>
            <td colspan=2>
    <asp:Label ID="Label8" runat="server" Text="集團新增" style="font-weight: 700; color: #0000FF"></asp:Label>
            </td>                      
        </tr>
             <tr>
            <td>
    <asp:Label ID="Label6" runat="server" Text="建立日期"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lab_Date" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label3" runat="server" Text="集團代號"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_GroupNO" runat="server" Width="314px"></asp:TextBox>
         
                <asp:Label ID="Label26" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label4" runat="server" Text="集團名稱"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_GroupName" runat="server" Width="314px"></asp:TextBox>
         
                <asp:Label ID="Label28" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label9" runat="server" Text="集團核心企業統編"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_EntSerNoMain" runat="server" Width="314px"></asp:TextBox>
         
                <asp:Label ID="Label27" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label10" runat="server" Text="集團核心企業名稱"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_EntNameMain" runat="server" Width="314px"></asp:TextBox>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label5" runat="server" Text="管理行"></asp:Label>
            </td>
            <td>
         <asp:TextBox ID="txt_MgrBrno" runat="server" AutoPostBack="True" 
                    ontextchanged="txt_MgrBrno_TextChanged"></asp:TextBox>
                <asp:DropDownList ID="drList_MgrBrno" runat="server" DataSourceID="dsBrno" 
                    DataTextField="BRNAME" DataValueField="BRNO" AutoPostBack="True" 
                    Width="200px" onselectedindexchanged="drList_MgrBrno_SelectedIndexChanged" 
                    Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsBrno" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT '' AS BRNAME, '' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNAME LIKE '%分行') OR (BRNO = '2200') ORDER BY BRNO">
                </asp:SqlDataSource>
         
                
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label7" runat="server" Text="集團CRC"></asp:Label>
            </td>
            <td>
         
                <asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" 
                    DataTextField="BRNAME" DataValueField="BRNO" Width="200px" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsCRC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    SelectCommand="SELECT '請選擇' AS BRNAME, '- 1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br WHERE (BRNO = @BRNO))) ORDER BY BRNO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_MgrBrno" Name="BRNO" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
         
                <asp:Label ID="Label14" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="管理行所屬的CRC"></asp:Label>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label11" runat="server" Text="GAO"></asp:Label>
            </td>
            <td>
         
                <asp:DropDownList ID="drList_Gao" runat="server" DataSourceID="dsGao" 
                    DataTextField="NAME" DataValueField="STAFF" Width="70px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsGao" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT '請選擇' AS NAME, '' AS STAFF UNION SELECT NAME, STAFF FROM EMPLOYEE WHERE (BRNO = @brno) AND (STATUS = 1) AND (JOBCODE IN (SELECT JOBCODE FROM JOBCODE WHERE (JOBNAME LIKE '%帳戶管理員%'))) ORDER BY STAFF">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_MgrBrno" Name="brno" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
         
                <asp:Label ID="Label12" runat="server" style="font-weight: 700; color: #3333FF" 
                    Text="管理行的帳號管理員(AO)"></asp:Label>
         
            </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Add" runat="server" onclick="btn_Add_Click" Text="新增" />
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
            </td>
            <td>
         
                &nbsp;</tr>
        
    </table>
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>            
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="ENTSERNOMAIN" 
        DataSourceID="dsGroup" EmptyDataText="無集團資料" EnableModelValidation="True">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ENTSERNOMAIN" 
                DataNavigateUrlFormatString="GroupModify.aspx?ENTSERNOMAIN={0}" Text="編輯" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" onclientclick="return confirm('是否要刪除?')" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BUILDDATE" HeaderText="建立日期" 
                SortExpression="BUILDDATE" ReadOnly="True" />
            <asp:BoundField DataField="MODIFYDATE" HeaderText="修改日期" ReadOnly="True" 
                SortExpression="MODIFYDATE" />
            <asp:BoundField DataField="GROUPNO" HeaderText="集團代號" ReadOnly="True" 
                SortExpression="GROUPNO" />
            <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                SortExpression="GROUPNAME" />
            <asp:BoundField DataField="ENTSERNOMAIN" HeaderText="集團核心企業統編" ReadOnly="True" 
                SortExpression="ENTSERNOMAIN" />
            <asp:BoundField DataField="ENTNAMEMAIN" HeaderText="集團核心企業名稱" 
                SortExpression="ENTNAMEMAIN" />
            <asp:BoundField DataField="CRCNO" HeaderText="CRC代號" SortExpression="CRCNO" />
            <asp:TemplateField HeaderText="管理行" SortExpression="MGRBRNO">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MGRBRNO") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txt_EditMgrBrno" runat="server" 
                         Text='<%# Bind("MGRBRNO") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GAO員編" SortExpression="GAOEMPID">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GAOEMPID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GAOEMPID") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="NAME" HeaderText="GAO姓名" SortExpression="NAME" 
                ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="INSERT INTO CUSTMGR_GROUP(GROUPNO, GROUPNAME, ENTSERNOMAIN, CRCNO, ENTNAMEMAIN, MGRBRNO, GAOEMPID, EDITEMPID) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @CRCNO, @ENTNAMEMAIN, @MGRBRNO, @GAOEMPID, @EDITEMPID)" 
        SelectCommand="SELECT a.GROUPNO, a.GROUPNAME, a.ENTSERNOMAIN, a.CRCNO, a.ENTNAMEMAIN, a.MGRBRNO, a.GAOEMPID, a.BUILDDATE, a.MODIFYDATE, b.NAME FROM CUSTMGR_GROUP AS a LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.GAOEMPID = b.STAFF ORDER BY a.BUILDDATE DESC" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_GROUP SET GROUPNAME = @GROUPNAME, CRCNO = @CRCNO, ENTNAMEMAIN = @ENTNAMEMAIN, MGRBRNO = @MGRBRNO, GAOEMPID = @GAOEMPID, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (ENTSERNOMAIN = @ENTSERNOMAIN)">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_GroupNO" Name="GROUPNO" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_GroupName" Name="GROUPNAME" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_EntSerNoMain" Name="ENTSERNOMAIN" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="drList_Crc" Name="CRCNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txt_EntNameMain" Name="ENTNAMEMAIN" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="drList_MgrBrno" Name="MGRBRNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drList_Gao" Name="GAOEMPID" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GROUPNAME" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="GAOEMPID" Type="String" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsCheckGroupNo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="INSERT INTO CUSTMGR_GROUP(GROUPNO, GROUPNAME, ENTSERNOMAIN, CRCNO, ENTNAMEMAIN, MGRBRNO, GAOEMPID) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @CRCNO, @ENTNAMEMAIN, @MGRBRNO, @GAOEMPID)" 
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM CUSTMGR_GROUP WHERE (GROUPNO = @GROUPNO)" 
        
        UpdateCommand="UPDATE CUSTMGR_GROUP SET GROUPNAME = @GROUPNAME, CRCNO = @CRCNO, ENTNAMEMAIN = @ENTNAMEMAIN, MGRBRNO = @MGRBRNO, GAOEMPID = @GAOEMPID, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (ENTSERNOMAIN = @ENTSERNOMAIN)">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_GroupNO" Name="GROUPNO" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_GroupName" Name="GROUPNAME" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_EntSerNoMain" Name="ENTSERNOMAIN" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="drList_Crc" Name="CRCNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txt_EntNameMain" Name="ENTNAMEMAIN" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="drList_MgrBrno" Name="MGRBRNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drList_Gao" Name="GAOEMPID" 
                PropertyName="SelectedValue" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_GroupNO" Name="GROUPNO" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="GROUPNAME" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="GAOEMPID" Type="String" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>

