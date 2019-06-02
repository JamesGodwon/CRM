<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustListModify.aspx.cs"
    Inherits="CustListModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>修改客戶資料</title>
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
                ID="lab_Title" Text="修改客戶資料" runat="server"></asp:Label> 
                </strong>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Program/CustMgr/CustQuery.aspx">【回到客戶管理】</asp:HyperLink>
                    
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
   
            <asp:Label ID="lab_Desc" runat="server" 
                style="font-weight: 700; color: #FF0000"></asp:Label>
   
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="BRNO,SERNO" 
        DataSourceID="dsCustListAdd" DefaultMode="Edit" 
        EnableModelValidation="True" ondatabound="FormView1_DataBound">
        <EditItemTemplate>
             &nbsp;<table style="width:600px;">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="CRC"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_CrcDisplay" runat="server" Text="<%# hidn_Crc.Value %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="分行代號"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_BrnoDisplay" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                        <asp:TextBox ID="txt_EditBrnoByMgr" runat="server" AutoPostBack="True" ontextchanged="txt_EditBrnoByMgr_TextChanged" 
                            ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="建立日期"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_BuildDate" runat="server" 
                            Text='<%# Bind("BUILDDATE") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="異動日"></asp:Label>
                    </td>
                        <td>
                            <asp:Label ID="lab_ModifyDate" runat="server" 
                                Text='<%# DateTime.Now.ToString("yyyyMMdd") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="管理員"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drList_MgrEmpId" runat="server" DataSourceID="dsMgrQuery" 
                            DataTextField="NAME" DataValueField="STAFF"                             
                            SelectedValue='<%# Bind("MGREMPNO") %>' AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsMgrQuery" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            
                            
                            SelectCommand="SELECT '' AS NAME, '' AS STAFF UNION SELECT a.MGREMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_CUSTLIST AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @BRNO) AND (a.SERNO = @SERNO) UNION SELECT a.MGREMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_EDITMGR AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @BRNO) ORDER BY STAFF">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hidn_BrnoFormCustList" Name="BRNO" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="hidn_SernoFormCustList" Name="SERNO" 
                                    PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="職務"></asp:Label>
                    </td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" CellSpacing="2" DataSourceID="dsMgrQueryPosition" 
                                EnableModelValidation="True" ShowHeader="False">
                                <Columns>
                                    <asp:BoundField DataField="COLDESC" SortExpression="COLDESC" />
                                </Columns>
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsMgrQueryPosition" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                                SelectCommand="SELECT b.COLDESC FROM CUSTMGR_EDITMGR AS a INNER JOIN CUSTMGR_OPTION AS b ON a.POSITION = b.COLVALUE WHERE (b.DBCOLUMN = 'POSITION') AND (a.MGREMPNO = @EMPNO)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="drList_MgrEmpId" Name="EMPNO" 
                                        PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="*統一編號"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="SERNO_Label" runat="server" Text='<%# Bind("SERNO") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="有效戶"></asp:Label>
                    </td>
                        <td>
                            <asp:DropDownList ID="drList_Useful" runat="server" 
                                SelectedValue='<%# Bind("USEFUL") %>' 
                                >
                                <asp:ListItem Selected="True">Y</asp:ListItem>
                                <asp:ListItem>N</asp:ListItem>
                            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="*客戶名稱"></asp:Label>
                    </td>
                    <td colspan=3>
                        <asp:TextBox ID="txt_AccountNameEdit" runat="server" 
                            Text='<%# Bind("ACCOUNTNAME") %>'></asp:TextBox>
                    </td>
                  
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="客戶簡稱"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="CUSTNICKNAMETextBox0" runat="server" 
                            Text='<%# Bind("CUSTNICKNAME") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="企業規模"></asp:Label>
                    </td>
                        <td>
                            <asp:DropDownList ID="drList_EntSize" runat="server" DataSourceID="dsEntSize" 
                                DataTextField="COLDESC" DataValueField="COLVALUE" 
                                SelectedValue='<%# Bind("ENTSIZE") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="dsEntSize" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                                SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'ENTSIZE')">
                            </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="客戶類型"></asp:Label>
                    </td>
                    <td colspan=3>
                        <asp:RadioButtonList ID="rbList_CustType" runat="server" 
                            DataSourceID="dsCustType" DataTextField="COLDESC" DataValueField="COLVALUE" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("CUSTTYPE") %>'>
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="dsCustType" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'CUSTTYPE')">
                        </asp:SqlDataSource>
                    </td>                    
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="母公司統編"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_EntSerNoMainEdit" runat="server" AutoPostBack="True" 
                            Text='<%# Bind("ENTSERNOMAIN") %>'></asp:TextBox>
                        <asp:Button ID="btn_QueryENTSERNOMAIN" runat="server" Text="搜尋" 
                            onclientclick="window.open('SubFormQueryMainEntList.aspx','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" />
                        <br />
                    </td>
                    <td class="style3">
                        <asp:Label ID="Label24" runat="server" Text="母公司名稱"></asp:Label>
                    </td>
                        <td>
                            <asp:TextBox ID="txt_EntNameMainEdit" runat="server" AutoPostBack="True" 
                                Text='<%# Bind("ENTNAMEMAIN") %>'></asp:TextBox>
                    </td>
                </tr>             
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="集團代號"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_GroupNo" runat="server" 
                            Text='<%# Bind("GROUPNO") %>' Height="20px" 
                             />
                            <asp:Button ID="Button1" runat="server" Text="搜尋" 
                            
                            onclientclick="window.open('SubFormQueryGroupList.aspx','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" />
                            <br />
                    </td>
                    <td class="style3">
                        <asp:Label ID="Label19" runat="server" Text="集團名稱"></asp:Label>
                    </td>
                        <td>
                            <asp:TextBox ID="txt_GroupName" runat="server" 
                                Text='<%# Bind("GROUPNAME") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="總公司統編"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="ENTSERNOMAJORTextBox" runat="server" 
                            Text='<%# Bind("ENTSERNOMAJOR") %>' Height="20px" 
                             />
                            <asp:Button ID="btn_QueryENTSERNOMAJOR" runat="server" Text="搜尋" 
                            
                            onclientclick="window.open('SubFormQueryCustListForMajor.aspx','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" />
                            <br />
                    </td>
                    <td class="style3">
                        <asp:Label ID="Label18" runat="server" Text="總公司戶名"></asp:Label>
                    </td>
                        <td>
                            <asp:TextBox ID="ENTNAMEMAJORTextBox" runat="server" 
                                Text='<%# Bind("ENTNAMEMAJOR") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="所在工業區名稱"></asp:Label>
                    </td>
                    <td colspan=3>
                        <asp:TextBox ID="txt_ZoneNameEdit" runat="server" 
                            Text='<%# Bind("ZONENAME") %>' Width="350px"></asp:TextBox>
                        <asp:Button ID="btn_QueryZoneName" runat="server" 
                            onclientclick="window.open('SubFormQueryZoneNameList.aspx','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" 
                            Text="搜尋" />
                        <asp:SqlDataSource ID="dsZoneName" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS ZONENAME, '' AS ZONEVALUE UNION SELECT ZONENAME, ZONENAME AS ZONEVALUE FROM CUSTMGR_INDUSTRIALZONE ORDER BY ZONEVALUE">
                        </asp:SqlDataSource>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="聯絡地址"></asp:Label>
                    </td>
                    <td colspan=3>
                        <asp:TextBox ID="CONTRACTADDRESSTextBox0" runat="server" 
                            Text='<%# Bind("CONTRACTADDRESS") %>' Width="300px" />
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="聯絡人"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="CONTRACTPEOPLETextBox0" runat="server" 
                            Text='<%# Bind("CONTRACTPEOPLE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="聯絡電話"></asp:Label>
                    </td>
                        <td>
                            <asp:TextBox ID="CONTRACTTELTextBox0" runat="server" 
                                Text='<%# Bind("CONTRACTTEL") %>' />
                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;
                &nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
           
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="新增" />
            &nbsp;
        </InsertItemTemplate>
        <ItemTemplate>
            BRNO:
            <asp:Label ID="BRNOLabel" runat="server" Text='<%# Eval("BRNO") %>' />
            <br />
            MGREMPNO:
            <asp:Label ID="MGREMPNOLabel" runat="server" Text='<%# Bind("MGREMPNO") %>' />
            <br />
            SERNO:
            <asp:Label ID="SERNOLabel" runat="server" Text='<%# Eval("SERNO") %>' />
            <br />
            ACCOUNTNAME:
            <asp:Label ID="ACCOUNTNAMELabel" runat="server" 
                Text='<%# Bind("ACCOUNTNAME") %>' />
            <br />
            USEFUL:
            <asp:Label ID="USEFULLabel" runat="server" Text='<%# Bind("USEFUL") %>' />
            <br />
            CUSTNICKNAME:
            <asp:Label ID="CUSTNICKNAMELabel" runat="server" 
                Text='<%# Bind("CUSTNICKNAME") %>' />
            <br />
            CUSTTYPE:
            <asp:Label ID="CUSTTYPELabel" runat="server" Text='<%# Bind("CUSTTYPE") %>' />
            <br />
            ENTSIZE:
            <asp:Label ID="ENTSIZELabel" runat="server" Text='<%# Bind("ENTSIZE") %>' />
            <br />
            ENTSERNOMAIN:
            <asp:Label ID="ENTSERNOMAINLabel" runat="server" 
                Text='<%# Bind("ENTSERNOMAIN") %>' />
            <br />
            GROUPNO:
            <asp:Label ID="GROUPNOLabel" runat="server" Text='<%# Bind("GROUPNO") %>' />
            <br />
            ENTSERNOMAJOR:
            <asp:Label ID="ENTSERNOMAJORLabel" runat="server" 
                Text='<%# Bind("ENTSERNOMAJOR") %>' />
            <br />
            ENTNAMEMAJOR:
            <asp:Label ID="ENTNAMEMAJORLabel" runat="server" 
                Text='<%# Bind("ENTNAMEMAJOR") %>' />
            <br />
            ZONENAME:
            <asp:Label ID="ZONENAMELabel" runat="server" Text='<%# Bind("ZONENAME") %>' />
            <br />
            CONTRACTADDRESS:
            <asp:Label ID="CONTRACTADDRESSLabel" runat="server" 
                Text='<%# Bind("CONTRACTADDRESS") %>' />
            <br />
            CONTRACTPEOPLE:
            <asp:Label ID="CONTRACTPEOPLELabel" runat="server" 
                Text='<%# Bind("CONTRACTPEOPLE") %>' />
            <br />
            CONTRACTTEL:
            <asp:Label ID="CONTRACTTELLabel" runat="server" 
                Text='<%# Bind("CONTRACTTEL") %>' />
            <br />
            BUILDDATE:
            <asp:Label ID="BUILDDATELabel" runat="server" Text='<%# Bind("BUILDDATE") %>' />
            <br />
            MODIFYDATE:
            <asp:Label ID="MODIFYDATELabel" runat="server" 
                Text='<%# Bind("MODIFYDATE") %>' />
            <br />
            EDITEMPID:
            <asp:Label ID="EDITEMPIDLabel" runat="server" Text='<%# Bind("EDITEMPID") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="刪除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" />
        </ItemTemplate>
    </asp:FormView>
    <asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
    <asp:SqlDataSource ID="dsCustListAdd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_CUSTLIST] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        InsertCommand="INSERT INTO CUSTMGR_CUSTLIST(BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, EDITEMPID) VALUES (@BRNO, @MGREMPNO, @SERNO, @ACCOUNTNAME, @USEFUL, @CUSTNICKNAME, @CUSTTYPE, @ENTSIZE, @ENTSERNOMAIN, @ENTSERNOMAJOR, @ENTNAMEMAJOR, @ZONENAME, @CONTRACTADDRESS, @CONTRACTPEOPLE, @CONTRACTTEL, @EDITEMPID)" 
        SelectCommand="SELECT BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTNAMEMAIN, GROUPNO, GROUPNAME, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, BUILDDATE, MODIFYDATE, EDITEMPID FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        
        
        
        
                
                UpdateCommand="UPDATE CUSTMGR_CUSTLIST SET MGREMPNO = @MGREMPNO, ACCOUNTNAME = @ACCOUNTNAME, USEFUL = @USEFUL, CUSTNICKNAME = @CUSTNICKNAME, CUSTTYPE = @CUSTTYPE, ENTSIZE = @ENTSIZE, ENTSERNOMAIN = @ENTSERNOMAIN, ENTNAMEMAIN = @ENTNAMEMAIN, GROUPNO = @GROUPNO, GROUPNAME = @GROUPNAME, ENTSERNOMAJOR = @ENTSERNOMAJOR, ENTNAMEMAJOR = @ENTNAMEMAJOR, ZONENAME = @ZONENAME, CONTRACTADDRESS = @CONTRACTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CONTRACTTEL = @CONTRACTTEL, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), EDITEMPID = @EDITEMPID WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
                onupdated="dsCustListAdd_Updated" ondeleted="dsCustListAdd_Deleted" onupdating="dsCustListAdd_Updating" 
       >
        <DeleteParameters>
            <asp:QueryStringParameter Name="BRNO" QueryStringField="BRNO" Type="String" />
            <asp:QueryStringParameter Name="SERNO" QueryStringField="SERNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="ACCOUNTNAME" Type="String" />
            <asp:Parameter Name="USEFUL" Type="String" />
            <asp:Parameter Name="CUSTNICKNAME" Type="String" />
            <asp:Parameter Name="CUSTTYPE" Type="Int32" />
            <asp:Parameter Name="ENTSIZE" Type="Int32" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTSERNOMAJOR" Type="String" />
            <asp:Parameter Name="ENTNAMEMAJOR" Type="String" />
            <asp:Parameter Name="ZONENAME" Type="String" />
            <asp:Parameter Name="CONTRACTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CONTRACTTEL" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BRNO" QueryStringField="BRNO" />
            <asp:QueryStringParameter Name="SERNO" QueryStringField="SERNO" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:Parameter Name="ACCOUNTNAME" Type="String" />
            <asp:Parameter Name="USEFUL" Type="String" />
            <asp:Parameter Name="CUSTNICKNAME" Type="String" />
            <asp:Parameter Name="CUSTTYPE" Type="Int32" />
            <asp:Parameter Name="ENTSIZE" Type="Int32" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTSERNOMAJOR" Type="String" />
            <asp:Parameter Name="ENTNAMEMAJOR" Type="String" />
            <asp:Parameter Name="ZONENAME" Type="String" />
            <asp:Parameter Name="CONTRACTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CONTRACTTEL" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:QueryStringParameter Name="BRNO" QueryStringField="BRNO" Type="String" />
            <asp:QueryStringParameter Name="SERNO" QueryStringField="SERNO" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" />
            <asp:Parameter Name="GROUPNO" />
            <asp:Parameter Name="GROUPNAME" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_Crc" runat="server" />
    <asp:SqlDataSource ID="dsCustListCheck" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_CUSTLIST] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        InsertCommand="INSERT INTO CUSTMGR_CUSTLIST(BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, EDITEMPID) VALUES (@BRNO, @MGREMPNO, @SERNO, @ACCOUNTNAME, @USEFUL, @CUSTNICKNAME, @CUSTTYPE, @ENTSIZE, @ENTSERNOMAIN, @ENTSERNOMAJOR, @ENTNAMEMAJOR, @ZONENAME, @CONTRACTADDRESS, @CONTRACTPEOPLE, @CONTRACTTEL, @EDITEMPID)" 
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO) AND (MGREMPNO = @USRID) OR (BRNO = @BRNO) AND (SERNO = @SERNO) AND (EDITEMPID = @USRID)" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_CUSTLIST SET MGREMPNO = @MGREMPNO, ACCOUNTNAME = @ACCOUNTNAME, USEFUL = @USEFUL, CUSTNICKNAME = @CUSTNICKNAME, CUSTTYPE = @CUSTTYPE, ENTSIZE = @ENTSIZE, ENTSERNOMAIN = @ENTSERNOMAIN, ENTSERNOMAJOR = @ENTSERNOMAJOR, ENTNAMEMAJOR = @ENTNAMEMAJOR, ZONENAME = @ZONENAME, CONTRACTADDRESS = @CONTRACTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CONTRACTTEL = @CONTRACTTEL, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), EDITEMPID = @EDITEMPID WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
       >
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="ACCOUNTNAME" Type="String" />
            <asp:Parameter Name="USEFUL" Type="String" />
            <asp:Parameter Name="CUSTNICKNAME" Type="String" />
            <asp:Parameter Name="CUSTTYPE" Type="Int32" />
            <asp:Parameter Name="ENTSIZE" Type="Int32" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTSERNOMAJOR" Type="String" />
            <asp:Parameter Name="ENTNAMEMAJOR" Type="String" />
            <asp:Parameter Name="ZONENAME" Type="String" />
            <asp:Parameter Name="CONTRACTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CONTRACTTEL" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BRNO" QueryStringField="BRNO" />
            <asp:QueryStringParameter Name="SERNO" QueryStringField="SERNO" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="USRID" 
                PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:Parameter Name="ACCOUNTNAME" Type="String" />
            <asp:Parameter Name="USEFUL" Type="String" />
            <asp:Parameter Name="CUSTNICKNAME" Type="String" />
            <asp:Parameter Name="CUSTTYPE" Type="Int32" />
            <asp:Parameter Name="ENTSIZE" Type="Int32" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTSERNOMAJOR" Type="String" />
            <asp:Parameter Name="ENTNAMEMAJOR" Type="String" />
            <asp:Parameter Name="ZONENAME" Type="String" />
            <asp:Parameter Name="CONTRACTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CONTRACTTEL" Type="String" />
            <asp:Parameter Name="EDITEMPID" Type="String" />
            <asp:QueryStringParameter Name="BRNO" QueryStringField="BRNO" Type="String" />
            <asp:QueryStringParameter Name="SERNO" QueryStringField="SERNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
            <br/>
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>
            <br />
            </span>
            <asp:HiddenField ID="hidn_BrnoFormCustList" runat="server" />
            <asp:HiddenField ID="hidn_SernoFormCustList" runat="server" />
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
   
    <asp:HiddenField ID="hidn_EditBrno" runat="server" />
   
    <asp:SqlDataSource ID="dsGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="IF NOT EXISTS(SELECT ENTSERNOMAIN FROM CUSTMGR_GROUP WHERE  ENTSERNOMAIN = @ENTSERNOMAIN) INSERT INTO CUSTMGR_GROUP(GROUPNO, GROUPNAME, ENTSERNOMAIN, ENTNAMEMAIN) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN,@ENTNAMEMAIN)" 
        SelectCommand="SELECT a.GROUPNO, a.GROUPNAME, a.ENTSERNOMAIN, a.CRCNO, a.ENTNAMEMAIN, a.MGRBRNO, a.GAOEMPID, a.BUILDDATE, a.MODIFYDATE, b.NAME FROM CUSTMGR_GROUP AS a LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.GAOEMPID = b.STAFF ORDER BY a.BUILDDATE DESC" 
        
        
        
        
        
        UpdateCommand="UPDATE CUSTMGR_GROUP SET GROUPNAME = @GROUPNAME, CRCNO = @CRCNO, ENTNAMEMAIN = @ENTNAMEMAIN, MGRBRNO = @MGRBRNO, GAOEMPID = @GAOEMPID, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (ENTSERNOMAIN = @ENTSERNOMAIN)">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GROUPNO" Type="String" />
            <asp:Parameter Name="GROUPNAME" Type="String" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" Type="String" />
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
    
            <asp:SqlDataSource ID="dsGetCrc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
        
        SelectCommand="SELECT BRNO AS BRNAME FROM BRANCH WHERE (BRNO = (SELECT TOP (1) CRCNO FROM crc_rel_br WHERE (BRNO = @brno)))">
                <SelectParameters>
                    <asp:Parameter Name="brno" />
                </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsInsertZone" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        InsertCommand="IF NOT EXISTS(SELECT ZONENAME FROM [iom].[dbo].[CUSTMGR_INDUSTRIALZONE] WHERE ZONENAME=@ZONENAME) INSERT INTO [iom].[dbo].[CUSTMGR_INDUSTRIALZONE] ([ZONENAME] ) VALUES (@ZONENAME)" 
        SelectCommand="SELECT 1 AS Expr1">
        <InsertParameters>
            <asp:Parameter Name="ZONENAME" />
        </InsertParameters>
    </asp:SqlDataSource>
   
    </form>
</body>
</html>

