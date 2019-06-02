<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubEnterpriseAdd.aspx.cs"
    Inherits="SubEnterpriseAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>分子企業新增/變更/刪除</title>
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
                ID="lab_Title" Text="分子企業新增/變更/刪除" runat="server"></asp:Label> </strong>
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
    <asp:Label ID="Label13" runat="server" Text="子企業新增" 
                    style="font-weight: 700; color: #0000FF"></asp:Label>
            </td>                      
        </tr>
             <tr>
            <td>
    <asp:Label ID="Label14" runat="server" Text="建立日期"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lab_Date" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label3" runat="server" Text="集團所屬CRC"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_GroupCRC" runat="server" Width="314px" Enabled="False"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="label11aa" runat="server" Text="集團管理行"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_GroupMgrBrno" runat="server" Width="314px" Enabled="False"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="lavv" runat="server" Text="集團代號"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_GroupNo" runat="server" Width="314px" Enabled="False"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label16" runat="server" Text="集團名稱"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_GroupName" runat="server" Width="314px" Enabled="False"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label17" runat="server" Text="分子企業統編"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_EntSerNoSub" runat="server" Width="314px" AutoPostBack="True" 
                    ontextchanged="txt_EntSerNoSub_TextChanged"></asp:TextBox>
         
                <asp:Label ID="Label25" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         <br />
                <asp:Label ID="lab_CheckSubEnt" runat="server" style="color: #3366FF"></asp:Label>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label18" runat="server" Text="分子企業名稱"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_EntNameSub" runat="server" Width="314px"></asp:TextBox>
         
                <asp:Label ID="Label26" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         
        </tr>                     
        <tr>
            <td>
    <asp:Label ID="Label22" runat="server" Text="分子企業所屬分行"></asp:Label>
            </td>
            <td>
         
                <asp:TextBox ID="txt_SubBrno" runat="server" AutoPostBack="True" 
                    ontextchanged="txt_SubBrno_TextChanged"></asp:TextBox>
         
                <asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" 
                    DataTextField="BRNAME" DataValueField="BRNO" AutoPostBack="True" Enabled="False" 
                   >
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsBrno" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    SelectCommand="SELECT '請選擇' AS BRNAME, - 1 AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNAME LIKE '%分行') OR (BRNO = '2200') ORDER BY BRNO">
                </asp:SqlDataSource>
         
            </tr>
        <tr>
            <td>
    <asp:Label ID="Label21" runat="server" Text="分子企業所屬CRC"></asp:Label>
            </td>
            <td>
         
                <asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" 
                    DataTextField="BRNAME" DataValueField="BRNO" Width="200px" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsCRC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT '' AS BRNAME, '- 1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br WHERE (BRNO = @BRNO))) ORDER BY BRNO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drList_Brno" Name="BRNO" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
         
            </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="btn_Add_Click" Text="新增" />
                <asp:Button ID="btn_Clear" runat="server" onclick="btn_Clear_Click" Text="清空" />
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
                
            </td>
            <td>
         
                &nbsp;</tr>
        
    </table>
        
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            <br />
            <asp:Label ID="Label24" runat="server" style="font-weight: 700; color: #0000FF" 
                Text="分子企業資料明細"></asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataSourceID="dsSubEntpriseDataDetail" 
                EmptyDataText="無明細資料" EnableModelValidation="True" 
                DataKeyNames="ENTSERNOSUB" AllowSorting="True">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ENTSERNOSUB,GROUPNO" 
                        DataNavigateUrlFormatString="SubEnterpriseModify.aspx?ENTSERNOSUB={0}&amp;GROUPNO={1}" 
                        Text="編輯" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Delete" onclientclick="return confirm('是否要刪除?')" Text="刪除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BUILDDATE" HeaderText="初次建立日" />
                    <asp:BoundField DataField="MODIFYDATE" HeaderText="異動日" />
                    <asp:BoundField DataField="GROUPCRC" HeaderText="集團所屬CRC" />
                    <asp:BoundField DataField="GROUPMGRBRNO" HeaderText="集團管理行" />
                    <asp:BoundField DataField="GROUPNO" HeaderText="集團代號" />
                    <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" />
                    <asp:TemplateField HeaderText="分子企業統一編號" SortExpression="ENTSERNOSUB">
                        <ItemTemplate>
                            <asp:Label ID="lab_ENTSERNOSUB" runat="server" 
                                Text='<%# Bind("ENTSERNOSUB") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ENTSERNOSUB") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ENTNAMESUB" HeaderText="分子企業名稱" 
                        SortExpression="ENTNAMESUB" />
                    <asp:BoundField DataField="CRCNO" HeaderText="分子企業所屬CRC" />
                    <asp:BoundField DataField="MGRBRNO" HeaderText="分子企業所屬分行" ReadOnly="True" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                    Wrap="False" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsSubEntpriseDataDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                
                
                SelectCommand="SELECT c.BUILDDATE, c.MODIFYDATE, a.CRCNO AS GROUPCRC, a.MGRBRNO AS GROUPMGRBRNO, a.GROUPNO, a.GROUPNAME, c.ENTSERNOSUB, c.ENTNAMESUB, c.CRCNO, c.MGRBRNO + '_' + d.BRNAME AS MGRBRNO FROM CUSTMGR_GROUP AS a LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.GAOEMPID = b.STAFF LEFT OUTER JOIN CUSTMGR_SUBENTERPRISE AS c ON a.GROUPNO = c.GROUPNO LEFT OUTER JOIN chb_pub.dbo.BRANCH AS d ON c.MGRBRNO = d.BRNO WHERE (a.GROUPNO = @GROUPNO) ORDER BY c.CRCNO, MGRBRNO, c.ENTNAMESUB" 
                
                
                DeleteCommand="DELETE FROM CUSTMGR_SUBENTERPRISE WHERE (ENTSERNOSUB = @ENTSERNOSUB)">
                <DeleteParameters>
                    <asp:Parameter Name="ENTSERNOSUB" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_GroupNo" Name="GROUPNO" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:SqlDataSource ID="dsGroupQuery" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="INSERT INTO CUSTMGR_GROUP(GROUPNO, GROUPNAME, ENTSERNOMAIN, CRCNO, ENTNAMEMAIN, MGRBRNO, GAOEMPID) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @CRCNO, @ENTNAMEMAIN, @MGRBRNO, @GAOEMPID)" 
        SelectCommand="SELECT CRCNO, MGRBRNO, GROUPNO, GROUPNAME FROM CUSTMGR_GROUP WHERE (GROUPNO = @GROUPNO)" 
        
        
        UpdateCommand="UPDATE CUSTMGR_GROUP SET GROUPNO = @GROUPNO, GROUPNAME = @GROUPNAME, CRCNO = @CRCNO, ENTNAMEMAIN = @ENTNAMEMAIN, MGRBRNO = @MGRBRNO, GAOEMPID = @GAOEMPID, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (ENTSERNOMAIN = @ENTSERNOMAIN)">
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
            <asp:ControlParameter ControlID="hidn_GROUPNO" Name="GROUPNO" 
                PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="GROUPNO" Type="String" />
            <asp:Parameter Name="GROUPNAME" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="GAOEMPID" Type="String" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:HiddenField ID="hidn_GROUPNO" runat="server" />
    <asp:SqlDataSource ID="dsSubEntprise" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_SUBENTERPRISE] WHERE [ENTSERNOSUB] = @ENTSERNOSUB" 
        InsertCommand="INSERT INTO CUSTMGR_SUBENTERPRISE(GROUPNO, ENTSERNOSUB, ENTNAMESUB, CRCNO, MGRBRNO, EDITEMPID) VALUES (@GROUPNO, @ENTSERNOSUB, @ENTNAMESUB, @CRCNO, @MGRBRNO, @EDITEMPID)" 
        SelectCommand="SELECT * FROM [CUSTMGR_SUBENTERPRISE]" 
        UpdateCommand="UPDATE CUSTMGR_SUBENTERPRISE SET GROUPNO = @GROUPNO, ENTNAMESUB = @ENTNAMESUB, CRCNO = @CRCNO, MGRBRNO = @MGRBRNO, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), EDITEMPID = @EDITEMPID WHERE (ENTSERNOSUB = @ENTSERNOSUB)">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOSUB" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_GroupNo" Name="GROUPNO" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_EntSerNoSub" Name="ENTSERNOSUB" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_EntNameSub" Name="ENTNAMESUB" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="drList_Crc" Name="CRCNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drList_Brno" Name="MGRBRNO" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GROUPNO" Type="String" />
            <asp:Parameter Name="ENTNAMESUB" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="ENTSERNOSUB" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCheckSubEnterprise" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM CUSTMGR_SUBENTERPRISE WHERE (GROUPNO = @GROUPNO) AND (ENTSERNOSUB = @ENTSERNOSUB)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_GroupNo" Name="GROUPNO" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_EntSerNoSub" Name="ENTSERNOSUB" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

