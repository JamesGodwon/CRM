<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiaryAdd.aspx.cs"
    Inherits="DiaryAdd" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>訪問日誌新增</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <style type="text/css">
        .style4
        {
            width: 262px;
        }
        .style5
        {
            height: 23px;
        }
    </style>
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
                ID="lab_Title" Text="訪問日誌新增" runat="server"></asp:Label> </strong>
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
    <asp:FormView ID="FormView1" runat="server" 
        DataKeyNames="BRNO,SERNO,EDITEMPNO,VISITDATE" DataSourceID="dsDiaryAdd" 
        DefaultMode="Insert" EnableModelValidation="True" 
        oniteminserted="FormView1_ItemInserted" 
        oniteminserting="FormView1_ItemInserting">
        <EditItemTemplate>
            BRNO:
            <asp:Label ID="BRNOLabel1" runat="server" Text='<%# Eval("BRNO") %>' />
            <br />
            MGREMPNO:
            <asp:TextBox ID="MGREMPNOTextBox" runat="server" 
                Text='<%# Bind("MGREMPNO") %>' />
            <br />
            SERNO:
            <asp:Label ID="SERNOLabel1" runat="server" Text='<%# Eval("SERNO") %>' />
            <br />
            EDITEMPNO:
            <asp:Label ID="EDITEMPNOLabel1" runat="server" 
                Text='<%# Eval("EDITEMPNO") %>' />
            <br />
            EDITPOSTION:
            <asp:TextBox ID="EDITPOSTIONTextBox" runat="server" 
                Text='<%# Bind("EDITPOSTION") %>' />
            <br />
            VISITTYPE:
            <asp:TextBox ID="VISITTYPETextBox" runat="server" 
                Text='<%# Bind("VISITTYPE") %>' />
            <br />
            VISTORNAME:
            <asp:TextBox ID="VISTORNAMETextBox" runat="server" 
                Text='<%# Bind("VISTORNAME") %>' />
            <br />
            VISITORPOSITION:
            <asp:TextBox ID="VISITORPOSITIONTextBox" runat="server" 
                Text='<%# Bind("VISITORPOSITION") %>' />
            <br />
            VISITDATE:
            <asp:Label ID="VISITDATELabel1" runat="server" 
                Text='<%# Eval("VISITDATE") %>' />
            <br />
            RECORDDATE:
            <asp:TextBox ID="RECORDDATETextBox" runat="server" 
                Text='<%# Bind("RECORDDATE") %>' />
            <br />
            MAJORBANK1:
            <asp:TextBox ID="MAJORBANK1TextBox" runat="server" 
                Text='<%# Bind("MAJORBANK1") %>' />
            <br />
            MAJORBANK2:
            <asp:TextBox ID="MAJORBANK2TextBox" runat="server" 
                Text='<%# Bind("MAJORBANK2") %>' />
            <br />
            MAJORBANK3:
            <asp:TextBox ID="MAJORBANK3TextBox" runat="server" 
                Text='<%# Bind("MAJORBANK3") %>' />
            <br />
            MAJORBANK4:
            <asp:TextBox ID="MAJORBANK4TextBox" runat="server" 
                Text='<%# Bind("MAJORBANK4") %>' />
            <br />
            MAJORBANK5:
            <asp:TextBox ID="MAJORBANK5TextBox" runat="server" 
                Text='<%# Bind("MAJORBANK5") %>' />
            <br />
            MEMO:
            <asp:TextBox ID="MEMOTextBox" runat="server" Text='<%# Bind("MEMO") %>' />
            <br />
            MODIFYDATE:
            <asp:TextBox ID="MODIFYDATETextBox" runat="server" 
                Text='<%# Bind("MODIFYDATE") %>' />
            <br />
            EDITEMPID:
            <asp:TextBox ID="EDITEMPIDTextBox" runat="server" 
                Text='<%# Bind("EDITEMPID") %>' />
            <br />
            DIARYNO:
            <asp:TextBox ID="DIARYNOTextBox" runat="server" Text='<%# Bind("DIARYNO") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width:700px;">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="分行代號"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lab_Brno" runat="server" Text="<%# hidn_BRNO.Value %>"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="登錄員"></asp:Label>
                    </td>
                         <td>
                             <asp:Label ID="lab_MgrName" runat="server" Text="<%# lab_EmpName.Text %>"></asp:Label>
                             <asp:DropDownList ID="drList_EditPosition" runat="server" 
                                 DataSourceID="dsPosition" DataTextField="COLDESC" DataValueField="COLVALUE" 
                                 SelectedValue='<%# Bind("EDITPOSTION") %>'>
                             </asp:DropDownList>
                             <asp:SqlDataSource ID="dsPosition" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                                 SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'POSITION')">
                             </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                         <td>
                             &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" 
                            Text="*訪問日期(西元年YYYYMMDD)&lt;br/&gt;例：20130101"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="VISITDATETextBox" runat="server" 
                            Text='<%# Bind("VISITDATE") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                         <td>
                             <asp:SqlDataSource ID="dsMgrQuery" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                                 
                                 
                                 SelectCommand="SELECT a.MGREMPNO + '_' + b.NAME + '_' + c.COLDESC AS NAME, a.MGREMPNO, '1' AS MGRRANK FROM CUSTMGR_EDITMGR AS a INNER JOIN CUSTMGR_OPTION AS c ON a.POSITION = c.COLVALUE AND c.DBCOLUMN = 'POSITION' LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @brno) UNION SELECT STAFF + '_' + NAME + '_登錄員' AS NAME, STAFF AS MGREMPNO, '2' AS MGRRANK FROM chb_pub.dbo.EMPLOYEE AS b WHERE (STAFF = @STAFF) ORDER BY MGRRANK, a.MGREMPNO">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="hidn_BRNO" Name="brno" PropertyName="Value" />
                                     <asp:ControlParameter ControlID="hidn_EmpNo" Name="STAFF" 
                                         PropertyName="Value" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                         <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="方式"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbtn_VisitWay" runat="server" 
                            DataSourceID="dsVisitType" DataTextField="COLDESC" DataValueField="COLVALUE" 
                            SelectedValue='<%# Bind("VISITTYPE") %>' RepeatDirection="Horizontal" 
                            AutoPostBack="True" 
                            onselectedindexchanged="rbtn_VisitWay_SelectedIndexChanged1">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="dsVisitType" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'VISITTYPE')">
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label39" runat="server" Text=" "></asp:Label>
                        <asp:Label ID="Label40" runat="server" Text="是否為新戶"></asp:Label>
                    </td>
                         <td>
                             <asp:RadioButtonList ID="rbtn_NEWCUST" runat="server" DataSourceID="dsNewCust" 
                                 DataTextField="COLDESC" DataValueField="COLVALUE" RepeatDirection="Horizontal" 
                                 SelectedValue='<%# Bind("NEWCUST") %>'>
                             </asp:RadioButtonList>
                             <asp:SqlDataSource ID="dsNewCust" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                                 SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'NEWCUST')">
                             </asp:SqlDataSource>
                    </td>
                        <td>
                        &nbsp;</td>
                         <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="陪同人員(分行)"></asp:Label>
                    </td>
                    <td colspan=5>
                        <asp:DropDownList ID="drList_BrnoMemeberSelect" runat="server" 
                            DataSourceID="dsBrnoMemberSelect" DataTextField="NAME" DataValueField="STAFF" 
                            SelectedValue='<%# Bind("BRNOMEMBER1") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsBrnoMemberSelect" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '' AS NAME, '' AS Staff UNION SELECT STAFF + '_' + NAME AS NAME, STAFF FROM chb_pub.dbo.EMPLOYEE WHERE (BRNO = @BRNO) AND (STATUS = 1)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="drList_BrnoMemeberSelect0" runat="server" 
                            DataSourceID="dsBrnoMemberSelect" DataTextField="NAME" DataValueField="STAFF" 
                            SelectedValue='<%# Bind("BRNOMEMBER2") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_BrnoMemeberSelect1" runat="server" 
                            DataSourceID="dsBrnoMemberSelect" DataTextField="NAME" DataValueField="STAFF" 
                            SelectedValue='<%# Bind("BRNOMEMBER3") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_BrnoMemeberSelect2" runat="server" 
                            DataSourceID="dsBrnoMemberSelect" DataTextField="NAME" DataValueField="STAFF" 
                            SelectedValue='<%# Bind("BRNOMEMBER4") %>'>
                        </asp:DropDownList>
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="陪同人員(總行或CRC)"></asp:Label>
                    </td>
                    <td colspan=5>
                        <asp:TextBox ID="txtMAINMEMBE1" runat="server" 
                            Text='<%# Bind("MAINMEMBER1") %>' Width="80px"></asp:TextBox>
                        <asp:TextBox ID="txtMAINMEMBER2" runat="server" 
                            Text='<%# Bind("MAINMEMBER2") %>' Width="80px"></asp:TextBox>
                        <asp:TextBox ID="txtMAINMEMBER3" runat="server" 
                            Text='<%# Bind("MAINMEMBER3") %>' Width="80px"></asp:TextBox>
                        <asp:TextBox ID="txtMAINMEMBER4" runat="server" 
                            Text='<%# Bind("MAINMEMBER4") %>' Width="80px"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                     <td>
                        <asp:Label ID="Label12" runat="server" Text="客戶資料" 
                             style="font-weight: 700; color: #0000FF"></asp:Label>
                    </td>
                    <td colspan=4>                        
                        &nbsp;</td>
                   
                    <td>
                        &nbsp;</td>    
                </tr>
                <tr>
                     <td colspan=5>
                         <asp:Label ID="Label36" runat="server" Text="*統一編號："></asp:Label>
                         <asp:TextBox ID="txt_SerNoBind" runat="server"></asp:TextBox>
                         <asp:Button ID="btn_QueryId" runat="server" 
                             onclientclick="window.open('SubFormQueryCustList.aspx','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" 
                             Text="搜尋" />
                         <asp:Button ID="Button2" runat="server" onclick="btn_Button2_Click" 
                             Text="帶入" />
                         <asp:Button ID="btn_ConfirmEdit" runat="server" onclick="btn_ConfirmEdit_Click" 
                             Text="確認" />
                         <asp:Label ID="lab_SernoDesc" runat="server" 
                             style="font-weight: 700; color: #0000FF" Text="按確認前請輸入統一編號"></asp:Label>
                         <asp:Label ID="lab_CustState" runat="server" style="color: #0000FF"></asp:Label>
                         <asp:Label ID="Label7" runat="server" Text="管理員"></asp:Label>
                         <asp:DropDownList ID="drList_MgrEmpId" runat="server" AutoPostBack="True" 
                             DataSourceID="dsMgrQuery" DataTextField="NAME" DataValueField="MGREMPNO" 
                             SelectedValue='<%# Bind("MGREMPNO") %>'>
                         </asp:DropDownList>
                     </td>
                
                   
                    <td>
                        &nbsp;</td>    
                </tr>                     
            </table>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="BRNO,SERNO" 
                DataSourceID="dsCustListAdd" DefaultMode="Insert" EnableModelValidation="True" 
                EmptyDataText="無客戶資料" 
                ondatabound="FormView2_DataBound" oniteminserted="FormView2_ItemInserted" 
                onitemupdated="FormView2_ItemUpdated">
                <EditItemTemplate>
                    &nbsp;<table style="width:700px;">                                                
                        <tr>
                            <td>
                                <asp:Label ID="Label27" runat="server" Text="*統一編號"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="label_SERNODISPLAY" runat="server" Text='<%# Bind("SERNO") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label28" runat="server" Text="有效戶"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lab_Useful" runat="server" Text='<%# Bind("USEFUL") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" Text="*客戶名稱"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:Label ID="lab_AccountNameDisplay" runat="server" 
                                    Text='<%# Bind("ACCOUNTNAME") %>'></asp:Label>
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
                            <td colspan="3">
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
                            
                            
                            onclientclick="window.open('SubFormQueryCustListForMajor.aspx?HASSUB=1','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" />
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
                            <td colspan="3">
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
                    &nbsp;
                </EditItemTemplate>
                <InsertItemTemplate>
                    &nbsp;<table style="width:700px;">                                                
                        <tr>
                            <td class="style5">
                                <asp:Label ID="Label27" runat="server" Text="*統一編號" Visible="False"></asp:Label>
                            </td>
                            <td class="style5">
                                <asp:TextBox ID="SERNOTextBox" runat="server" Text='<%# Bind("SERNO") %>' 
                                    ReadOnly="True" Visible="False" />
                            </td>
                            <td class="style5">
                                <asp:Label ID="Label28" runat="server" Text="有效戶" Visible="False"></asp:Label>
                            </td>
                            <td class="style5">
                                <asp:DropDownList ID="drList_Useful" runat="server" 
                                    SelectedValue='<%# Bind("USEFUL") %>' Enabled="False" Visible="False">
                                    <asp:ListItem Selected="True">Y</asp:ListItem>
                                    <asp:ListItem>N</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" Text="*客戶名稱"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="ACCOUNTNAMETextBox0" runat="server" 
                                    Text='<%# Bind("ACCOUNTNAME") %>' Width="300px" />
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
                            <td colspan="3">
                                <asp:RadioButtonList ID="rbList_CustType" runat="server" 
                                    DataSourceID="dsCustType" DataTextField="COLDESC" DataValueField="COLVALUE" 
                                    RepeatDirection="Horizontal" SelectedValue='<%# Bind("CUSTTYPE") %>' 
                                    ondatabound="rbList_CustType_DataBound">
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
                            
                            
                            onclientclick="window.open('SubFormQueryCustListForMajor.aspx?HASSUB=1','','height=300,width=700,status=no,toolbar=no,menubar=no,location=no','')" />
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
                            <td colspan="3">
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
                    <asp:CheckBox ID="ckbox_AddToCustList" runat="server" style="color: #0000FF" 
                        Text="加入客戶名單" />
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
            <asp:SqlDataSource ID="dsCustListAdd" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                DeleteCommand="DELETE FROM CUSTMGR_CUSTLIST_PASS WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
                InsertCommand="INSERT INTO CUSTMGR_CUSTLIST_PASS(BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTNAMEMAIN, GROUPNO, GROUPNAME, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, EDITEMPID) VALUES (@BRNO, @MGREMPNO, @SERNO, @ACCOUNTNAME, @USEFUL, @CUSTNICKNAME, @CUSTTYPE, @ENTSIZE, @ENTSERNOMAIN, @ENTNAMEMAIN, @GROUPNO, @GROUPNAME, @ENTSERNOMAJOR, @ENTNAMEMAJOR, @ZONENAME, @CONTRACTADDRESS, @CONTRACTPEOPLE, @CONTRACTTEL, @EDITEMPID)" 
                SelectCommand="SELECT BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTNAMEMAIN, GROUPNO, GROUPNAME, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, BUILDDATE, MODIFYDATE, EDITEMPID FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
                
                
                
                
                
                UpdateCommand="UPDATE [CUSTMGR_CUSTLIST] SET  [CUSTNICKNAME] = @CUSTNICKNAME, [CUSTTYPE] = @CUSTTYPE, [ENTSIZE] = @ENTSIZE, [ENTSERNOMAIN] = @ENTSERNOMAIN,[ENTSERNOMAJOR] = @ENTSERNOMAJOR, [ENTNAMEMAJOR] = @ENTNAMEMAJOR, [ZONENAME] = @ZONENAME, [CONTRACTADDRESS] = @CONTRACTADDRESS, [CONTRACTPEOPLE] = @CONTRACTPEOPLE, [CONTRACTTEL] = @CONTRACTTEL, [MODIFYDATE] = CONVERT([char](8),getdate(),(112)), [EDITEMPID] = @EDITEMPID WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" PropertyName="Value" 
                        Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="drList_MgrEmpId" Name="MGREMPNO" 
                        PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="txt_SerNoBind" Name="SERNO" 
                        PropertyName="Text" Type="String" />
                    <asp:Parameter Name="ACCOUNTNAME" Type="String" />
                    <asp:Parameter Name="USEFUL" Type="String" DefaultValue="Y" />
                    <asp:Parameter Name="CUSTNICKNAME" Type="String" DefaultValue="" />
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
                    <asp:Parameter Name="ENTNAMEMAIN" />
                    <asp:Parameter Name="GROUPNO" />
                    <asp:Parameter Name="GROUPNAME" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
                    <asp:ControlParameter ControlID="txt_SerNoBind" Name="SERNO" 
                        PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
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
                    <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txt_SerNoBind" Name="SERNO" 
                        PropertyName="Text" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <table style="width:700px;">
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="受訪者姓名"></asp:Label>
                        
                    </td>
                    <td colspan=2>
                    <asp:TextBox ID="VISTORNAMETextBox" runat="server" 
                            Text='<%# Bind("VISTORNAME") %>' />
                    </td>
                    <td>                        
                            <asp:Label ID="Label8" runat="server" Text="職稱"></asp:Label>                            
                    </td>                
                    <td colspan=2>
                    <asp:TextBox ID="VISITORPOSITIONTextBox" runat="server" 
                                 Text='<%# Bind("VISITORPOSITION") %>' />
                    </td>
                </tr>
                 <tr>
                    <td class="style4">
                        <asp:Label ID="Label34" runat="server" Text="主要往來銀行"></asp:Label>
                    </td>
                    <td colspan=5>
                        <asp:DropDownList ID="drList_MajorBank1" runat="server" 
                            DataSourceID="dsMajorBank1" DataTextField="BANKNAME" DataValueField="BANKNO" 
                            SelectedValue='<%# Bind("MAJORBANK1") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_MajorBank2" runat="server" 
                            DataSourceID="dsMajorBank2" DataTextField="BANKNAME" DataValueField="BANKNO" 
                            SelectedValue='<%# Bind("MAJORBANK2") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_MajorBank3" runat="server" 
                            DataSourceID="dsMajorBank3" DataTextField="BANKNAME" DataValueField="BANKNO" 
                            SelectedValue='<%# Bind("MAJORBANK3") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_MajorBank4" runat="server" 
                            DataSourceID="dsMajorBank4" DataTextField="BANKNAME" DataValueField="BANKNO" 
                            SelectedValue='<%# Bind("MAJORBANK4") %>'>
                        </asp:DropDownList>
                        <asp:DropDownList ID="drList_MajorBank5" runat="server" 
                            DataSourceID="dsMajorBank5" DataTextField="BANKNAME" DataValueField="BANKNO" 
                            SelectedValue='<%# Bind("MAJORBANK5") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsMajorBank1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS BANKNAME, '' AS BANKNO UNION SELECT BANKNO + '_' + BANKNICKNAME AS BANKNAME, BANKNO FROM CUSTMGR_BANK WHERE (BRANCHNO IS NULL) AND (BANKNO &lt;&gt; '000') ORDER BY BANKNO">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsMajorBank2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS BANKNAME, '' AS BANKNO UNION SELECT BANKNO + '_' + BANKNICKNAME AS BANKNAME, BANKNO FROM CUSTMGR_BANK WHERE (BRANCHNO IS NULL) AND (BANKNO &lt;&gt; '000') ORDER BY BANKNO">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsMajorBank3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS BANKNAME, '' AS BANKNO UNION SELECT BANKNO + '_' + BANKNICKNAME AS BANKNAME, BANKNO FROM CUSTMGR_BANK WHERE (BRANCHNO IS NULL) AND (BANKNO &lt;&gt; '000') ORDER BY BANKNO">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsMajorBank4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS BANKNAME, '' AS BANKNO UNION SELECT BANKNO + '_' + BANKNICKNAME AS BANKNAME, BANKNO FROM CUSTMGR_BANK WHERE (BRANCHNO IS NULL) AND (BANKNO &lt;&gt; '000') ORDER BY BANKNO">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsMajorBank5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT '請選擇' AS BANKNAME, '' AS BANKNO UNION SELECT BANKNO + '_' + BANKNICKNAME AS BANKNAME, BANKNO FROM CUSTMGR_BANK WHERE (BRANCHNO IS NULL) AND (BANKNO &lt;&gt; '000') ORDER BY BANKNO">
                        </asp:SqlDataSource>
                        </td>                    
                </tr>      
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label32" runat="server" Text="洽談業務項目"></asp:Label>
                    </td>
                    <td colspan=5>
                        <asp:SqlDataSource ID="dsCHATTYPE" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'CHATTYPE')">
                        </asp:SqlDataSource>
                        <asp:CheckBoxList ID="ckList_ChatType" runat="server" DataSourceID="dsCHATTYPE" 
                            DataTextField="COLDESC" DataValueField="COLVALUE" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>
                        </td>                    
                </tr>                     
                
                <tr>
                    <td style="border-style: double none none double">
                        <asp:Label ID="Label31" runat="server" Text="預期可增加的新商機"></asp:Label>
                    </td>
                    <td colspan=5 style="border-style: double double none none">
                        <asp:SqlDataSource ID="dsOPPTYPE" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                            SelectCommand="SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'OPPTYPE')">
                        </asp:SqlDataSource>
                        <asp:CheckBoxList ID="ckList_OpType" runat="server" DataSourceID="dsOPPTYPE" 
                            DataTextField="COLDESC" DataValueField="COLVALUE" RepeatDirection="Horizontal">
                        </asp:CheckBoxList>                        
                        </td>                    
                </tr>      
                <tr>
                    <td style="border-left-style: double" >
                        <asp:Label ID="Label26" runat="server" Text="預估可增加的收益金額"></asp:Label>
                    </td>
                    <td colspan=5 style="border-right-style: double" >
                        <asp:TextBox ID="txt_PrepareIncome" runat="server" 
                            Text='<%# Bind("PREPAREINCOME") %>'></asp:TextBox>
                        <asp:Label ID="Label38" runat="server" Text="單位：台幣千元(千元以下四捨五入取至個位數)"></asp:Label>
                        </td>                    
                </tr>      
                <tr>
                    <td style="border-style: none none double double">
                        <asp:Label ID="Label33" runat="server" style="font-weight: 700; color: #3333FF" 
                            Text="商機資料"></asp:Label>
                    </td>
                    <td style="border-style: none none double none">
                        <asp:Label ID="Label37" runat="server" Text="單號"></asp:Label>
                        <asp:Label ID="lab_OppNoDes" runat="server"></asp:Label>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="3" CellSpacing="2" DataSourceID="dsOPPORTUNITIES" 
                            EmptyDataText="無商機資料" EnableModelValidation="True" 
                            ondatabound="GridView3_DataBound" Visible="False">
                            <Columns>
                                <asp:BoundField DataField="COLDESC" HeaderText="商機種類" 
                                    SortExpression="COLDESC" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        <asp:Label ID="lab_OppDisplay" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lab_TotalOppNum" runat="server" Text="累計商機數："></asp:Label>
                        <br />
                        <asp:Label ID="lab_EndProject" runat="server" Text="是否結案："></asp:Label>
                    </td>
                    <td style="border-style: none none double none">
                        &nbsp;</td>
                         <td style="border-style: none none double none">
                        &nbsp;</td>
                        <td style="border-style: none none double none">
                        &nbsp;</td>
                         <td style="border-style: none double double none">
                        &nbsp;</td>
                </tr>           
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label30" runat="server" Text="Memo"></asp:Label>
                        <asp:Label ID="lab_MemoDesc" runat="server" 
                            style="font-weight: 700; color: #0000FF" Text="&lt;br/&gt;400字以內"></asp:Label>
                    </td>
                    <td colspan=5>
                        <asp:TextBox ID="MEMOTextBox" runat="server" Rows="15" 
                            Text='<%# Bind("MEMO") %>' TextMode="MultiLine" Width="600px" />
                    </td>                 
                </tr>   
            </table>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="新增日誌" />
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
            EDITEMPNO:
            <asp:Label ID="EDITEMPNOLabel" runat="server" Text='<%# Eval("EDITEMPNO") %>' />
            <br />
            EDITPOSTION:
            <asp:Label ID="EDITPOSTIONLabel" runat="server" 
                Text='<%# Bind("EDITPOSTION") %>' />
            <br />
            VISITTYPE:
            <asp:Label ID="VISITTYPELabel" runat="server" Text='<%# Bind("VISITTYPE") %>' />
            <br />
            VISTORNAME:
            <asp:Label ID="VISTORNAMELabel" runat="server" 
                Text='<%# Bind("VISTORNAME") %>' />
            <br />
            VISITORPOSITION:
            <asp:Label ID="VISITORPOSITIONLabel" runat="server" 
                Text='<%# Bind("VISITORPOSITION") %>' />
            <br />
            VISITDATE:
            <asp:Label ID="VISITDATELabel" runat="server" Text='<%# Eval("VISITDATE") %>' />
            <br />
            RECORDDATE:
            <asp:Label ID="RECORDDATELabel" runat="server" 
                Text='<%# Bind("RECORDDATE") %>' />
            <br />
            MAJORBANK1:
            <asp:Label ID="MAJORBANK1Label" runat="server" 
                Text='<%# Bind("MAJORBANK1") %>' />
            <br />
            MAJORBANK2:
            <asp:Label ID="MAJORBANK2Label" runat="server" 
                Text='<%# Bind("MAJORBANK2") %>' />
            <br />
            MAJORBANK3:
            <asp:Label ID="MAJORBANK3Label" runat="server" 
                Text='<%# Bind("MAJORBANK3") %>' />
            <br />
            MAJORBANK4:
            <asp:Label ID="MAJORBANK4Label" runat="server" 
                Text='<%# Bind("MAJORBANK4") %>' />
            <br />
            MAJORBANK5:
            <asp:Label ID="MAJORBANK5Label" runat="server" 
                Text='<%# Bind("MAJORBANK5") %>' />
            <br />
            MEMO:
            <asp:Label ID="MEMOLabel" runat="server" Text='<%# Bind("MEMO") %>' />
            <br />
            MODIFYDATE:
            <asp:Label ID="MODIFYDATELabel" runat="server" 
                Text='<%# Bind("MODIFYDATE") %>' />
            <br />
            EDITEMPID:
            <asp:Label ID="EDITEMPIDLabel" runat="server" Text='<%# Bind("EDITEMPID") %>' />
            <br />
            DIARYNO:
            <asp:Label ID="DIARYNOLabel" runat="server" Text='<%# Bind("DIARYNO") %>' />
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
            <asp:HyperLink ID="hylink_Edit" runat="server" Visible="False">[hylink_Edit]</asp:HyperLink>
            <br />   
    <br />
    <asp:HiddenField ID="hidn_SERNO" runat="server" />
    <asp:SqlDataSource ID="dsCheckCustList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_CUSTLIST] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        InsertCommand="IF NOT EXISTS ( SELECT SERNO FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)) INSERT INTO CUSTMGR_CUSTLIST SELECT BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTNAMEMAIN, GROUPNO, GROUPNAME, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, BUILDDATE, MODIFYDATE, EDITEMPID FROM CUSTMGR_CUSTLIST_PASS WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        
        
        
        
        
        
        
        UpdateCommand="UPDATE [CUSTMGR_CUSTLIST] SET  [CUSTNICKNAME] = @CUSTNICKNAME, [CUSTTYPE] = @CUSTTYPE, [ENTSIZE] = @ENTSIZE, [ENTSERNOMAIN] = @ENTSERNOMAIN, [ENTSERNOMAJOR] = @ENTSERNOMAJOR, [ENTNAMEMAJOR] = @ENTNAMEMAJOR, [ZONENAME] = @ZONENAME, [CONTRACTADDRESS] = @CONTRACTADDRESS, [CONTRACTPEOPLE] = @CONTRACTPEOPLE, [CONTRACTTEL] = @CONTRACTTEL, [BUILDDATE] = @BUILDDATE, [MODIFYDATE] = @MODIFYDATE, [EDITEMPID] = @EDITEMPID WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
            <asp:Parameter Name="SERNO" />
        </SelectParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_DiaryNo" runat="server" />
    <asp:HiddenField ID="hidn_ResultSERNO" runat="server" />
    <br />
    <asp:SqlDataSource ID="dsDiaryAdd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_DIARY] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO AND [EDITEMPNO] = @EDITEMPNO AND [VISITDATE] = @VISITDATE" 
        InsertCommand="INSERT INTO CUSTMGR_DIARY(BRNO, MGREMPNO, SERNO, EDITEMPNO, EDITPOSTION, VISITTYPE, VISTORNAME, VISITORPOSITION, VISITDATE, MAJORBANK1, MAJORBANK2, MAJORBANK3, MAJORBANK4, MAJORBANK5, MEMO, EDITEMPID, BRNOMEMBER1, BRNOMEMBER2, BRNOMEMBER3, BRNOMEMBER4, MAINMEMBER1, MAINMEMBER2, MAINMEMBER3, MAINMEMBER4, PREPAREINCOME, NEWCUST) VALUES (@BRNO, @MGREMPNO, @SERNO, @EDITEMPNO, @EDITPOSTION, @VISITTYPE, @VISTORNAME, @VISITORPOSITION, @VISITDATE, @MAJORBANK1, @MAJORBANK2, @MAJORBANK3, @MAJORBANK4, @MAJORBANK5, @MEMO, @EDITEMPID, @BRNOMEMBER1, @BRNOMEMBER2, @BRNOMEMBER3, @BRNOMEMBER4, @MAINMEMBER1, @MAINMEMBER2, @MAINMEMBER3, @MAINMEMBER4, @PREPAREINCOME, @NEWCUST)" 
        SelectCommand="SELECT * FROM [CUSTMGR_DIARY]" 
        
        
        UpdateCommand="UPDATE [CUSTMGR_DIARY] SET [MGREMPNO] = @MGREMPNO, [EDITPOSTION] = @EDITPOSTION, [VISITTYPE] = @VISITTYPE, [VISTORNAME] = @VISTORNAME, [VISITORPOSITION] = @VISITORPOSITION, [RECORDDATE] = @RECORDDATE, [MAJORBANK1] = @MAJORBANK1, [MAJORBANK2] = @MAJORBANK2, [MAJORBANK3] = @MAJORBANK3, [MAJORBANK4] = @MAJORBANK4, [MAJORBANK5] = @MAJORBANK5, [MEMO] = @MEMO, [MODIFYDATE] = @MODIFYDATE, [EDITEMPID] = @EDITEMPID, [DIARYNO] = @DIARYNO WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO AND [EDITEMPNO] = @EDITEMPNO AND [VISITDATE] = @VISITDATE" 
        oninserted="dsDiaryAdd_Inserted">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="EDITEMPNO" Type="String" />
            <asp:Parameter Name="VISITDATE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPNO" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="EDITPOSTION" Type="Int32" />
            <asp:Parameter Name="VISITTYPE" Type="Int32" />
            <asp:Parameter Name="VISTORNAME" Type="String" />
            <asp:Parameter Name="VISITORPOSITION" Type="String" />
            <asp:Parameter Name="VISITDATE" Type="String" />
            <asp:Parameter Name="MAJORBANK1" Type="String" />
            <asp:Parameter Name="MAJORBANK2" Type="String" />
            <asp:Parameter Name="MAJORBANK3" Type="String" />
            <asp:Parameter Name="MAJORBANK4" Type="String" />
            <asp:Parameter Name="MAJORBANK5" Type="String" />
            <asp:Parameter Name="MEMO" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="BRNOMEMBER1" />
            <asp:Parameter Name="BRNOMEMBER2" />
            <asp:Parameter Name="BRNOMEMBER3" />
            <asp:Parameter Name="BRNOMEMBER4" />
            <asp:Parameter Name="MAINMEMBER1" />
            <asp:Parameter Name="MAINMEMBER2" />
            <asp:Parameter Name="MAINMEMBER3" />
            <asp:Parameter Name="MAINMEMBER4" />
            <asp:Parameter Name="PREPAREINCOME" />
            <asp:Parameter Name="NEWCUST" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MGREMPNO" Type="String" />
            <asp:Parameter Name="EDITPOSTION" Type="Int32" />
            <asp:Parameter Name="VISITTYPE" Type="Int32" />
            <asp:Parameter Name="VISTORNAME" Type="String" />
            <asp:Parameter Name="VISITORPOSITION" Type="String" />
            <asp:Parameter Name="RECORDDATE" Type="String" />
            <asp:Parameter Name="MAJORBANK1" Type="String" />
            <asp:Parameter Name="MAJORBANK2" Type="String" />
            <asp:Parameter Name="MAJORBANK3" Type="String" />
            <asp:Parameter Name="MAJORBANK4" Type="String" />
            <asp:Parameter Name="MAJORBANK5" Type="String" />
            <asp:Parameter Name="MEMO" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:Parameter Name="EDITEMPID" Type="String" />
            <asp:Parameter Name="DIARYNO" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="EDITEMPNO" Type="String" />
            <asp:Parameter Name="VISITDATE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDetermineOPPNO" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                
                
        
        SelectCommand="IF EXISTS(SELECT 1 FROM CUSTMGR_OPPORTUNITIES WHERE BRNO = @BRNO AND SERNO = @SERNO AND EDITEMPNO = @EDITEMPNO AND ENDPROJECT='N') SELECT TOP 1 OPPNO FROM CUSTMGR_OPPORTUNITIES WHERE BRNO = @BRNO AND SERNO = @SERNO AND EDITEMPNO = @EDITEMPNO AND ENDPROJECT='N' ELSE SELECT 'OP' + @BRNO + @EDITEMPNO + @SERNO + '_' + cast(count(1) + 1 AS VARCHAR) FROM (SELECT DISTINCT OPPNO FROM CUSTMGR_OPPORTUNITIES WHERE BRNO = @BRNO AND SERNO = @SERNO AND EDITEMPNO = @EDITEMPNO AND ENDPROJECT = 'Y') c" 
        DeleteCommand="IF NOT EXISTS ( SELECT c.DIARYNO,c.OPPTYPE FROM CUSTMGR_OPPORTUNITIES a INNER JOIN CUSTMGR_DIARYOPPMAPPING b ON a.OPPNO = b.OPPNO INNER JOIN CUSTMGR_DIARYOPPORTUNITIES c ON b.DIARYNO &lt;&gt; c.DIARYNO WHERE a.OPPNO = @OPPNO AND c.OPPTYPE = @OPPTYPE AND b.DIARYNO = @DIARYNO ) DELETE FROM CUSTMGR_OPPORTUNITIES WHERE (OPPNO = @OPPNO) AND (OPPTYPE = @OPPTYPE)" 
        
        
        
        
        
        
        InsertCommand="IF NOT EXISTS(SELECT 1 FROM CUSTMGR_OPPORTUNITIES WHERE OPPNO=@OPPNO AND OPPTYPE=@OPPTYPE) INSERT INTO CUSTMGR_OPPORTUNITIES(OPPNO, BRNO, SERNO, EDITEMPNO, OPPTYPE, ENDPROJECT) VALUES (@OPPNO, @BRNO, @SERNO, @EDITEMPNO, @OPPTYPE, 'N')">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
            <asp:Parameter Name="OPPTYPE" />
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="lab_EmpNo" Name="EDITEMPNO" 
                PropertyName="Text" />
            <asp:Parameter Name="OPPTYPE" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="lab_EmpNo" Name="EDITEMPNO" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_OppNo" runat="server" />
    <asp:SqlDataSource ID="dsOPPORTUNITIES" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT b.COLDESC FROM CUSTMGR_OPPORTUNITIES AS a INNER JOIN CUSTMGR_OPTION AS b ON a.OPPTYPE = b.COLVALUE AND b.DBCOLUMN = 'OPPTYPE' WHERE (a.OPPNO = @OPPNO) ORDER BY a.OPPTYPE">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCheckDiary" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_CUSTLIST] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        InsertCommand="INSERT INTO CUSTMGR_CUSTLIST SELECT BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, BUILDDATE, MODIFYDATE, EDITEMPID FROM CUSTMGR_CUSTLIST_PASS WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        SelectCommand="SELECT 1 AS Expr1 FROM CUSTMGR_DIARY WHERE (BRNO = @BRNO) AND (SERNO = @SERNO) AND (EDITEMPNO = @EDITEMPNO) AND (VISITDATE = @VISITDATE)" 
        
        
        
        
        
        
        UpdateCommand="UPDATE [CUSTMGR_CUSTLIST] SET  [CUSTNICKNAME] = @CUSTNICKNAME, [CUSTTYPE] = @CUSTTYPE, [ENTSIZE] = @ENTSIZE, [ENTSERNOMAIN] = @ENTSERNOMAIN, [ENTSERNOMAJOR] = @ENTSERNOMAJOR, [ENTNAMEMAJOR] = @ENTNAMEMAJOR, [ZONENAME] = @ZONENAME, [CONTRACTADDRESS] = @CONTRACTADDRESS, [CONTRACTPEOPLE] = @CONTRACTPEOPLE, [CONTRACTTEL] = @CONTRACTTEL, [BUILDDATE] = @BUILDDATE, [MODIFYDATE] = @MODIFYDATE, [EDITEMPID] = @EDITEMPID WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        onselecting="dsCheckDiary_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_VisitDate" Name="VISITDATE" 
                PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsInsertZone" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        InsertCommand="IF NOT EXISTS(SELECT 1 FROM [iom].[dbo].[CUSTMGR_INDUSTRIALZONE] WHERE ZONENAME=@ZONENAME) INSERT INTO [iom].[dbo].[CUSTMGR_INDUSTRIALZONE] ([ZONENAME] ) VALUES (@ZONENAME)" 
        SelectCommand="SELECT 1 AS Expr1">
        <InsertParameters>
            <asp:Parameter Name="ZONENAME" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOPPORTUNITIESEND" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT TOP (1) ENDPROJECT FROM CUSTMGR_OPPORTUNITIES WHERE (OPPNO = @OPPNO)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDiaryOppMapping" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_DIARYOPPMAPPING] WHERE [OPPNO] = @OPPNO AND [DIARYNO] = @DIARYNO" 
        InsertCommand="INSERT INTO [CUSTMGR_DIARYOPPMAPPING] ([OPPNO], [DIARYNO]) VALUES (@OPPNO, @DIARYNO)" 
        
        SelectCommand="SELECT DIARYNO FROM CUSTMGR_DIARY WHERE (BRNO = @BRNO) AND (SERNO = @SERNO) AND (EDITEMPNO = @EDITEMPNO) AND (VISITDATE = @VISITDATE)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_VisitDate" Name="VISITDATE" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_VisitDate" runat="server" />
    <asp:SqlDataSource ID="dsSetDiaryOpp" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                
                
        
        SelectCommand="SELECT OPPTYPE FROM CUSTMGR_DIARYOPPORTUNITIES WHERE (DIARYNO = @DIARYNO)" 
        DeleteCommand="DELETE FROM CUSTMGR_DIARYOPPORTUNITIES WHERE (DIARYNO = @DIARYNO)" 
        
        
        
        
        InsertCommand="IF NOT EXISTS(SELECT 1 FROM CUSTMGR_DIARYOPPORTUNITIES WHERE DIARYNO=@DIARYNO AND OPPTYPE=@OPPTYPE) INSERT INTO [CUSTMGR_DIARYOPPORTUNITIES] ([DIARYNO], [OPPTYPE]) VALUES (@DIARYNO, @OPPTYPE)" 
        oninserting="dsSetDiaryOpp_Inserting" 
        onselecting="dsSetDiaryOpp_Selecting">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_SelectedItem" runat="server" />
    <asp:HiddenField ID="hidn_SelectedItem0" runat="server" />
    <asp:SqlDataSource ID="dsGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="IF NOT EXISTS(SELECT 1 FROM CUSTMGR_GROUP WHERE ENTSERNOMAIN = @ENTSERNOMAIN) INSERT INTO CUSTMGR_GROUP(GROUPNO, GROUPNAME, ENTSERNOMAIN, ENTNAMEMAIN) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN,@ENTNAMEMAIN)" 
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
    
    <asp:SqlDataSource ID="dsGetMGREMPNOFromList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_CUSTLIST] WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        InsertCommand="INSERT INTO CUSTMGR_CUSTLIST SELECT BRNO, MGREMPNO, SERNO, ACCOUNTNAME, USEFUL, CUSTNICKNAME, CUSTTYPE, ENTSIZE, ENTSERNOMAIN, ENTNAMEMAIN, GROUPNO, GROUPNAME, ENTSERNOMAJOR, ENTNAMEMAJOR, ZONENAME, CONTRACTADDRESS, CONTRACTPEOPLE, CONTRACTTEL, BUILDDATE, MODIFYDATE, EDITEMPID FROM CUSTMGR_CUSTLIST_PASS WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        SelectCommand="SELECT MGREMPNO FROM CUSTMGR_CUSTLIST WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)" 
        
        
        
        
        
        
        
        UpdateCommand="UPDATE [CUSTMGR_CUSTLIST] SET  [CUSTNICKNAME] = @CUSTNICKNAME, [CUSTTYPE] = @CUSTTYPE, [ENTSIZE] = @ENTSIZE, [ENTSERNOMAIN] = @ENTSERNOMAIN, [ENTSERNOMAJOR] = @ENTSERNOMAJOR, [ENTNAMEMAJOR] = @ENTNAMEMAJOR, [ZONENAME] = @ZONENAME, [CONTRACTADDRESS] = @CONTRACTADDRESS, [CONTRACTPEOPLE] = @CONTRACTPEOPLE, [CONTRACTTEL] = @CONTRACTTEL, [BUILDDATE] = @BUILDDATE, [MODIFYDATE] = @MODIFYDATE, [EDITEMPID] = @EDITEMPID WHERE [BRNO] = @BRNO AND [SERNO] = @SERNO" 
        onselecting="dsGetMGREMPNOFromList_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_SERNO" Name="SERNO" 
                PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
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
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" 
                Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsSetDiaryChat" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
                
                
        
        SelectCommand="SELECT CHATTYPE FROM CUSTMGR_DIARYCHATTYPE WHERE (DIARYNO = @DIARYNO)" 
        DeleteCommand="DELETE FROM CUSTMGR_DIARYCHATTYPE WHERE (DIARYNO = @DIARYNO)" 
        
        
        
        
        
        InsertCommand="IF NOT EXISTS(SELECT 1 FROM CUSTMGR_DIARYCHATTYPE WHERE DIARYNO=@DIARYNO AND CHATTYPE=@CHATTYPE) INSERT INTO [CUSTMGR_DIARYCHATTYPE] ([DIARYNO], [CHATTYPE]) VALUES (@DIARYNO, @CHATTYPE)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="CHATTYPE" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_DiaryNo" Name="DIARYNO" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsCheckHiddenCust" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT ENTNAME, ENTADDRESS FROM CUSTMGR_HIDDENCUST WHERE (SERNO = @SERNO)">
        <SelectParameters>
            <asp:Parameter Name="SERNO" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </form>
</body>
</html>

