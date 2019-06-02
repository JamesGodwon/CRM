<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GroupQuery.aspx.cs"
    Inherits="GroupQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>集團維護</title>
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
                ID="lab_Title" Text="集團維護" runat="server"></asp:Label> </strong>
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
            <td>
                <asp:Label ID="Label5" runat="server" Text="請輸入查詢條件" style="font-weight: 700"></asp:Label>
                </td>
            <td>
         
                <asp:RadioButtonList ID="rbtn_Position" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True" 
                    onselectedindexchanged="rbtn_Position_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="1">全部集團 </asp:ListItem>
                    <asp:ListItem Value="2">集團代號或名稱</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lab_GroupNo" runat="server" Text="集團代號或名稱" Visible="False"></asp:Label>
                <asp:TextBox ID="txt_GroupNo" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            
        <tr>
            <td>
    <asp:Label ID="Label3" runat="server" Text="集團核心企業統一編號或名稱"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_SERNOMAIN" runat="server" Width="314px" 
                    ></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label6" runat="server" Text="分子企業統一編號或名稱"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_SERNOSUB" runat="server" Width="314px"></asp:TextBox>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label4" runat="server" Text="管理行"></asp:Label>
            </td>
            <td>
         
         <asp:TextBox ID="txt_MgrBrno" runat="server" ></asp:TextBox>
         
                <asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" 
                    DataTextField="BRNAME" DataValueField="BRNO" Width="200px" Visible="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsBrno" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    SelectCommand="SELECT '請選擇' AS BRNAME, '- 1' AS BRNO UNION SELECT DISTINCT b.BRNO + '_' + b.BRNAME AS BRNAME, b.BRNO FROM iom.dbo.CUSTMGR_GROUP AS a INNER JOIN BRANCH AS b ON a.MGRBRNO = b.BRNO ORDER BY BRNO">
                </asp:SqlDataSource>
         
                <asp:Label ID="Label8" runat="server" style="font-weight: 700; color: #3333FF" 
                    Text="現行集團已有的管理行"></asp:Label>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label7" runat="server" Text="集團CRC"></asp:Label>
            </td>
            <td>
         
                <asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" 
                    DataTextField="BRNAME" DataValueField="BRNO" Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsCRC" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    SelectCommand="SELECT '請選擇' AS BRNAME, '-1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br)) ORDER BY BRNO">
                </asp:SqlDataSource>
         
        </tr>
          <tr>
          <td colspan=2>
              <asp:Button ID="btn_Query" runat="server" Text="查詢" onclick="btn_Query_Click" />
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
          </td>
          </tr>      
        
    </table>
    <br />
            
                <asp:HyperLink ID="Link_AddGroup" runat="server" 
                NavigateUrl="~/Program/CustMgr/GroupAdd.aspx">新增/修改集團資料</asp:HyperLink>
                &nbsp;
                <asp:HyperLink ID="Link_ImportGroupAndSubEnt" runat="server" 
                NavigateUrl="~/Program/CustMgr/ImportGroupAndSub.aspx">匯入集團及分子企業資料</asp:HyperLink>
                <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataSourceID="dsGroupList" 
                EnableModelValidation="True" EmptyDataText="查無集團資料">
                <Columns>
                    <asp:BoundField DataField="GROUPNO" HeaderText="集團代號" 
                        SortExpression="GROUPNO" />
                    <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                        SortExpression="GROUPNAME" />
                    <asp:BoundField DataField="ENTNAMEMAIN" HeaderText="集團核心企業名稱" 
                        SortExpression="ENTNAMEMAIN" />
                    <asp:BoundField DataField="MODIFYDATE" HeaderText="最後更新日" 
                        SortExpression="MODIFYDATE" />
                    <asp:BoundField DataField="CRCNO" HeaderText="集團所屬CRC" SortExpression="CRCNO" />
                    <asp:BoundField DataField="MGRBRNO" HeaderText="集團管理行" 
                        SortExpression="MGRBRNO" />
                    <asp:BoundField DataField="NAME" HeaderText="管理員" SortExpression="NAME" />
                    
                    <asp:TemplateField HeaderText="分子企業維護">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# Eval("GROUPNO", "SubEnterpriseAdd.aspx?GROUPNO={0}") %>'  
                                Text="新增/刪除"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsGroupList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                
                
                
                SelectCommand="EXEC('SELECT a.ENTSERNOMAIN, a.GROUPNO, a.GROUPNAME, a.ENTNAMEMAIN, a.MODIFYDATE, a.CRCNO, a.MGRBRNO + ''_'' + c.BRNAME AS MGRBRNO, b.NAME FROM CUSTMGR_GROUP AS a left outer JOIN chb_pub.dbo.EMPLOYEE AS b ON a.GAOEMPID = b.STAFF left outer JOIN chb_pub.dbo.BRANCH AS c ON a.MGRBRNO = c.BRNO where 1=1 '+@condition+' ORDER BY a.CRCNO , a.MGRBRNO , a.GROUPNAME')" 
                onselecting="dsGroupList_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </span>
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:HiddenField ID="hidn_condition" runat="server" />
    </form>
</body>
</html>

