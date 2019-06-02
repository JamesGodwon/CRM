<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndustrialZoneMgr.aspx.cs"
    Inherits="IndustrialZoneMgr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>工業區維護</title>
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
                ID="lab_Title" runat="server">工業區維護</asp:Label> </strong>
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
    <br />
    <table style="width:100%;">
        <tr>
            <td>
    <asp:Label ID="Label3" runat="server" Text="工業區名稱"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txt_ZoneName" runat="server" Width="314px"></asp:TextBox>
         
                <asp:Label ID="Label25" runat="server" style="font-weight: 700; color: #0000FF" 
                    Text="必填"></asp:Label>
         
            </td>
            
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label12" runat="server" Text="工業區管理分行"></asp:Label>
            </td>
            <td>
         
                <asp:TextBox ID="txt_MgrBrno" runat="server" AutoPostBack="True" 
                    ontextchanged="txt_MgrBrno_TextChanged"></asp:TextBox>
         
                <asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" 
                    DataTextField="BRNAME" DataValueField="BRNO" Enabled="False">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsBrno" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
                    
                    
                    
                    
                    SelectCommand="SELECT '' AS BRNAME, '' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNAME LIKE '%分行') OR (BRNO = '2200') ORDER BY BRNO">
                </asp:SqlDataSource>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label5" runat="server" Text="區域"></asp:Label>
            </td>
            <td>
         
                <asp:DropDownList ID="drList_Region" runat="server" DataSourceID="dsRegion" 
                    DataTextField="COLDESC" DataValueField="COLVALUE">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsRegion" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                    
                    
                    
                    SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'REGION')">
                </asp:SqlDataSource>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label4" runat="server" Text="所在縣市區"></asp:Label>
            </td>
            <td>
         
                <asp:Label ID="Label14" runat="server" Text="縣市"></asp:Label>
                <asp:DropDownList ID="drListCity" runat="server" AutoPostBack="True" 
                    DataSourceID="dsCity" DataTextField="CITYNAME" DataValueField="CITYNAME" 
                    onselectedindexchanged="drListCity_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsCity" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                    SelectCommand="SELECT '請選擇' AS CITYNAME, '-1' AS CITYNO UNION SELECT DISTINCT CITYNAME, CITYNO FROM CUSTMGR_CITY ORDER BY CITYNO">
                </asp:SqlDataSource>
                <asp:Label ID="Label13" runat="server" Text="鄉鎮市區"></asp:Label>
                <asp:DropDownList ID="drListSection" runat="server" AutoPostBack="True" 
                    DataSourceID="dsSection" DataTextField="SECTIONNAME" 
                    DataValueField="SECTIONNAME" 
                    onselectedindexchanged="drListSection_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsSection" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                    
                    SelectCommand="SELECT '請選擇' AS SECTIONNAME, '-1' AS SECTIONNO UNION SELECT SECTIONNAME, SECTIONNO FROM CUSTMGR_CITY WHERE (CITYNAME = @CITYNAME) ORDER BY SECTIONNO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="drListCity" Name="CITYNAME" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="hidn_Location" runat="server" />
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label9" runat="server" Text="管理處聯絡人"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_MgrName" runat="server" Width="314px"></asp:TextBox>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label10" runat="server" Text="管理處聯絡電話"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_MgrTel" runat="server" Width="314px"></asp:TextBox>
         
        </tr>
        <tr>
            <td>
    <asp:Label ID="Label11" runat="server" Text="管理處聯絡地址"></asp:Label>
            </td>
            <td>
         
    <asp:TextBox ID="txt_MgrAddress" runat="server" Width="314px"></asp:TextBox>
         
        </tr>
        
        
    </table>
    <asp:Button ID="btn_Add" runat="server" Text="新增" onclick="btn_Add_Click" />
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
    <br />
    <asp:HyperLink ID="Link_Bank" runat="server" 
        >銀行檔維護</asp:HyperLink>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="ZONENAME" 
        DataSourceID="dsMgrIndustrialZone" EnableModelValidation="True" 
        EmptyDataText="無工業區資料">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ZONENAME" 
                DataNavigateUrlFormatString="IndustrialZoneModify.aspx?ZONENAME={0}" 
                Text="編輯" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" onclientclick="return confirm('是否要刪除?')" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ZONENAME" HeaderText="工業區名稱" ReadOnly="True" 
                SortExpression="ZONENAME" />
            <asp:BoundField DataField="REGIONDESC" HeaderText="區域" 
                SortExpression="REGIONDESC" />
            <asp:BoundField DataField="LOCATION" HeaderText="所在縣市區" 
                SortExpression="LOCATION" />
            <asp:BoundField DataField="MGRNAME" HeaderText="管理處聯絡人" 
                SortExpression="MGRNAME" />
            <asp:BoundField DataField="MGRTEL" HeaderText="管理處聯絡電話" 
                SortExpression="MGRTEL" />
            <asp:BoundField DataField="MGRADDRESS" HeaderText="管理處聯絡地址" 
                SortExpression="MGRADDRESS" />
            <asp:TemplateField HeaderText="工業區管理分行" SortExpression="BRNO">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BRNO") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:SqlDataSource ID="dsMgrIndustrialZone" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_INDUSTRIALZONE] WHERE [ZONENAME] = @ZONENAME" 
        InsertCommand="INSERT INTO CUSTMGR_INDUSTRIALZONE(ZONENAME, LOCATION, REGION, MGRNAME, MGRTEL, MGRADDRESS, BRNO, EDITEMPID) VALUES (@ZONENAME, @LOCATION, @REGION, @MGRNAME, @MGRTEL, @MGRADDRESS, @BRNO, @EDITEMPID)" 
        SelectCommand="SELECT a.ZONENAME, a.LOCATION, a.MGRNAME, a.MGRTEL, a.MGRADDRESS, a.BRNO + '_' + c.BRNAME AS BRNO, a.BUILDDATE, a.MODIFYDATE, d.COLDESC AS REGIONDESC FROM CUSTMGR_INDUSTRIALZONE AS a LEFT OUTER JOIN chb_pub.dbo.crc_rel_br AS b ON a.BRNO = b.BRNO LEFT OUTER JOIN chb_pub.dbo.BRANCH AS c ON a.BRNO = c.BRNO LEFT OUTER JOIN CUSTMGR_OPTION AS d ON a.REGION = d.COLVALUE AND d.DBCOLUMN = 'REGION' ORDER BY a.REGION, b.CRCNO, BRNO" 
        
        
        
        
        
        UpdateCommand="UPDATE CUSTMGR_INDUSTRIALZONE SET LOCATION = @LOCATION, MGRNAME = @MGRNAME, MGRTEL = @MGRTEL, MGRADDRESS = @MGRADDRESS, BRNO = @BRNO, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112),EDITEMPID=@EDITEMPID WHERE (ZONENAME = @ZONENAME)">
        <DeleteParameters>
            <asp:Parameter Name="ZONENAME" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_ZoneName" Name="ZONENAME" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="hidn_Location" Name="LOCATION" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="txt_MgrName" Name="MGRNAME" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_MgrTel" Name="MGRTEL" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txt_MgrAddress" Name="MGRADDRESS" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txt_MgrBrno" Name="BRNO" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="drList_Region" Name="REGION" 
                PropertyName="SelectedValue" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LOCATION" Type="String" />
            <asp:Parameter Name="MGRNAME" Type="String" />
            <asp:Parameter Name="MGRTEL" Type="String" />
            <asp:Parameter Name="MGRADDRESS" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="ZONENAME" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

