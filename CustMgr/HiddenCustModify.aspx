<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HiddenCustModify.aspx.cs"
    Inherits="HiddenCustModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>潛在客戶名單編輯</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
    <style type="text/css">
        .style3
        {
            height: 21px;
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
                ID="lab_Title" Text="潛在客戶名單編輯" runat="server"></asp:Label>  
                    <asp:Button ID="btn_BackPage" runat="server" Text="回上一頁" class="print_disable" /> </strong>
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
    <asp:HiddenField ID="hidn_SERNO" runat="server" />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="BATCHNUMBER" 
        DataSourceID="dsHiddenCustModify" DefaultMode="Edit" 
        EnableModelValidation="True" onitemupdated="FormView1_ItemUpdated" 
        onitemupdating="FormView1_ItemUpdating" EmptyDataText="無商業司公司名單資料">
        <EditItemTemplate>
            <asp:Label ID="Label23" runat="server" 
                style="font-weight: 700; color: #0000FF;" Text="公司名單資料"></asp:Label>
            <br />
            <table style="width:700px;">
                <tr>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="統一編號"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="SERNOTextBox" runat="server" Text='<%# Bind("SERNO") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="上市別 / 代號"></asp:Label>
                    </td>
                        <td>
                            <asp:Label ID="上市別___代號Label" runat="server" Text="<%# hidn_EntType.Value %>" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label25" runat="server" Text="公司名稱"></asp:Label>
                    </td>
                    <td colspan=3 class="style3">
                        <asp:TextBox ID="ENTNAMETextBox" runat="server" Text='<%# Bind("ENTNAME") %>' 
                            Width="350px" />
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="代表人"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="CONTRACTPEOPLETextBox" runat="server" 
                            Text='<%# Bind("CONTRACTPEOPLE") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label27" runat="server" Text="資本額"></asp:Label>
                    </td>
                        <td>
                            <asp:TextBox ID="CAPITALTextBox" runat="server" Text='<%# Bind("CAPITAL") %>' />
                            <asp:Label ID="Label21" runat="server" Text="單位：元"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="設立日期"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="SETDATETextBox" runat="server" Text='<%# Bind("SETDATE") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="變更日期"></asp:Label>
                     </td>
                        <td>
                            <asp:TextBox ID="CHANGEDATETextBox" runat="server" 
                                Text='<%# Bind("CHANGEDATE") %>' />
                     </td>
                </tr>
                 
                 <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="登記地址"></asp:Label>
                     </td>
                    <td colspan=3>
                        <asp:TextBox ID="ENTADDRESSTextBox" runat="server" 
                            Text='<%# Bind("ENTADDRESS") %>' Width="350px" />
                     </td>                  
                </tr>                
                 <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="電話一"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="TELFIRSTTextBox" runat="server" 
                            Text='<%# Bind("TELFIRST") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="電話二"></asp:Label>
                     </td>
                        <td>
                            <asp:TextBox ID="TELSECONDTextBox" runat="server" 
                                Text='<%# Bind("TELSECOND") %>' />
                     </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="聯絡地址"></asp:Label>
                     </td>
                    <td colspan=3>
                        <asp:TextBox ID="OTHERADDRESSTextBox" runat="server" 
                            Text='<%# Bind("OTHERADDRESS") %>' Width="350px" />
                     </td>                  
                </tr>
            </table>       
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            SERNO:
            <asp:TextBox ID="SERNOTextBox" runat="server" Text='<%# Bind("SERNO") %>' />
            <br />
            ENTNAME:
            <asp:TextBox ID="ENTNAMETextBox" runat="server" Text='<%# Bind("ENTNAME") %>' />
            <br />
            ENTADDRESS:
            <asp:TextBox ID="ENTADDRESSTextBox" runat="server" 
                Text='<%# Bind("ENTADDRESS") %>' />
            <br />
            CONTRACTPEOPLE:
            <asp:TextBox ID="CONTRACTPEOPLETextBox" runat="server" 
                Text='<%# Bind("CONTRACTPEOPLE") %>' />
            <br />
            CAPITAL:
            <asp:TextBox ID="CAPITALTextBox" runat="server" Text='<%# Bind("CAPITAL") %>' />
            <br />
            SETDATE:
            <asp:TextBox ID="SETDATETextBox" runat="server" Text='<%# Bind("SETDATE") %>' />
            <br />
            CHANGEDATE:
            <asp:TextBox ID="CHANGEDATETextBox" runat="server" 
                Text='<%# Bind("CHANGEDATE") %>' />
            <br />
            DISSOLVEDATE:
            <asp:TextBox ID="DISSOLVEDATETextBox" runat="server" 
                Text='<%# Bind("DISSOLVEDATE") %>' />
            <br />
            BUILDDATE:
            <asp:TextBox ID="BUILDDATETextBox" runat="server" 
                Text='<%# Bind("BUILDDATE") %>' />
            <br />
            MODIFYDATE:
            <asp:TextBox ID="MODIFYDATETextBox" runat="server" 
                Text='<%# Bind("MODIFYDATE") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            BATCHNUMBER:
            <asp:Label ID="BATCHNUMBERLabel" runat="server" 
                Text='<%# Eval("BATCHNUMBER") %>' />
            <br />
            SERNO:
            <asp:Label ID="SERNOLabel" runat="server" Text='<%# Bind("SERNO") %>' />
            <br />
            ENTNAME:
            <asp:Label ID="ENTNAMELabel" runat="server" Text='<%# Bind("ENTNAME") %>' />
            <br />
            ENTADDRESS:
            <asp:Label ID="ENTADDRESSLabel" runat="server" 
                Text='<%# Bind("ENTADDRESS") %>' />
            <br />
            CONTRACTPEOPLE:
            <asp:Label ID="CONTRACTPEOPLELabel" runat="server" 
                Text='<%# Bind("CONTRACTPEOPLE") %>' />
            <br />
            CAPITAL:
            <asp:Label ID="CAPITALLabel" runat="server" Text='<%# Bind("CAPITAL") %>' />
            <br />
            SETDATE:
            <asp:Label ID="SETDATELabel" runat="server" Text='<%# Bind("SETDATE") %>' />
            <br />
            CHANGEDATE:
            <asp:Label ID="CHANGEDATELabel" runat="server" 
                Text='<%# Bind("CHANGEDATE") %>' />
            <br />
            DISSOLVEDATE:
            <asp:Label ID="DISSOLVEDATELabel" runat="server" 
                Text='<%# Bind("DISSOLVEDATE") %>' />
            <br />
            BUILDDATE:
            <asp:Label ID="BUILDDATELabel" runat="server" Text='<%# Bind("BUILDDATE") %>' />
            <br />
            MODIFYDATE:
            <asp:Label ID="MODIFYDATELabel" runat="server" 
                Text='<%# Bind("MODIFYDATE") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" Visible="False" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="刪除" Visible="False" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" Visible="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="dsHiddenCustModify" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_HIDDENCUST] WHERE [BATCHNUMBER] = @BATCHNUMBER" 
        InsertCommand="INSERT INTO [CUSTMGR_HIDDENCUST] ([SERNO], [ENTNAME], [ENTADDRESS], [CONTRACTPEOPLE], [CAPITAL], [SETDATE], [CHANGEDATE], [DISSOLVEDATE], [BUILDDATE], [MODIFYDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @CHANGEDATE, @DISSOLVEDATE, @BUILDDATE, @MODIFYDATE)" 
        SelectCommand="SELECT BATCHNUMBER, SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, SETDATE, CHANGEDATE, TELFIRST, TELSECOND, OTHERADDRESS FROM CUSTMGR_HIDDENCUST WHERE (BATCHNUMBER = @BATCHNUMBER)" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, CHANGEDATE = @CHANGEDATE, DISSOLVEDATE = @DISSOLVEDATE, TELFIRST = @TELFIRST, TELSECOND = @TELSECOND, OTHERADDRESS = @OTHERADDRESS, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (BATCHNUMBER = @BATCHNUMBER)">
        <DeleteParameters>
            <asp:Parameter Name="BATCHNUMBER" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="ENTNAME" Type="String" />
            <asp:Parameter Name="ENTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CAPITAL" Type="Decimal" />
            <asp:Parameter Name="SETDATE" Type="String" />
            <asp:Parameter Name="CHANGEDATE" Type="String" />
            <asp:Parameter Name="DISSOLVEDATE" Type="String" />
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BATCHNUMBER" QueryStringField="BATCHNUMBER" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="CHANGEDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
            <asp:Parameter Name="BATCHNUMBER" />
            <asp:Parameter Name="TELFIRST" />
            <asp:Parameter Name="TELSECOND" />
            <asp:Parameter Name="OTHERADDRESS" />
        </UpdateParameters>
    </asp:SqlDataSource>
					<asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
    <br />
    <asp:FormView ID="FormView2" runat="server" DataSourceID="dsTejDataDetail" 
        EnableModelValidation="True" EmptyDataText="無中華信評(TEJ)資料">
        <EditItemTemplate>
            統一編號:
            <asp:TextBox ID="統一編號TextBox" runat="server" Text='<%# Bind("統一編號") %>' />
            <br />
            上市別 / 代號:
            <asp:TextBox ID="上市別___代號TextBox" runat="server" 
                Text='<%# Bind("[上市別 / 代號]") %>' />
            <br />
            公司名稱:
            <asp:TextBox ID="公司名稱TextBox" runat="server" Text='<%# Bind("公司名稱") %>' />
            <br />
            董事長:
            <asp:TextBox ID="董事長TextBox" runat="server" Text='<%# Bind("董事長") %>' />
            <br />
            總經理:
            <asp:TextBox ID="總經理TextBox" runat="server" Text='<%# Bind("總經理") %>' />
            <br />
            財務經理:
            <asp:TextBox ID="財務經理TextBox" runat="server" Text='<%# Bind("財務經理") %>' />
            <br />
            電話:
            <asp:TextBox ID="電話TextBox" runat="server" Text='<%# Bind("電話") %>' />
            <br />
            設立日期:
            <asp:TextBox ID="設立日期TextBox" runat="server" Text='<%# Bind("設立日期") %>' />
            <br />
            資本額:
            <asp:TextBox ID="資本額TextBox" runat="server" Text='<%# Bind("資本額") %>' />
            <br />
            集團名稱:
            <asp:TextBox ID="集團名稱TextBox" runat="server" Text='<%# Bind("集團名稱") %>' />
            <br />
            地址:
            <asp:TextBox ID="地址TextBox" runat="server" Text='<%# Bind("地址") %>' />
            <br />
            主要產品:
            <asp:TextBox ID="主要產品TextBox" runat="server" Text='<%# Bind("主要產品") %>' />
            <br />
            公開發行日:
            <asp:TextBox ID="公開發行日TextBox" runat="server" Text='<%# Bind("公開發行日") %>' />
            <br />
            TCRI評等:
            <asp:TextBox ID="TCRI評等TextBox" runat="server" Text='<%# Bind("TCRI評等") %>' />
            <br />
            評等日:
            <asp:TextBox ID="評等日TextBox" runat="server" Text='<%# Bind("評等日") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            統一編號:
            <asp:TextBox ID="統一編號TextBox0" runat="server" Text='<%# Bind("統一編號") %>' />
            <br />
            上市別 / 代號:
            <asp:TextBox ID="上市別___代號TextBox0" runat="server" 
                Text='<%# Bind("[上市別 / 代號]") %>' />
            <br />
            公司名稱:
            <asp:TextBox ID="公司名稱TextBox0" runat="server" Text='<%# Bind("公司名稱") %>' />
            <br />
            董事長:
            <asp:TextBox ID="董事長TextBox0" runat="server" Text='<%# Bind("董事長") %>' />
            <br />
            總經理:
            <asp:TextBox ID="總經理TextBox0" runat="server" Text='<%# Bind("總經理") %>' />
            <br />
            財務經理:
            <asp:TextBox ID="財務經理TextBox0" runat="server" Text='<%# Bind("財務經理") %>' />
            <br />
            電話:
            <asp:TextBox ID="電話TextBox0" runat="server" Text='<%# Bind("電話") %>' />
            <br />
            設立日期:
            <asp:TextBox ID="設立日期TextBox0" runat="server" Text='<%# Bind("設立日期") %>' />
            <br />
            資本額:
            <asp:TextBox ID="資本額TextBox0" runat="server" Text='<%# Bind("資本額") %>' />
            <br />
            集團名稱:
            <asp:TextBox ID="集團名稱TextBox0" runat="server" Text='<%# Bind("集團名稱") %>' />
            <br />
            地址:
            <asp:TextBox ID="地址TextBox0" runat="server" Text='<%# Bind("地址") %>' />
            <br />
            主要產品:
            <asp:TextBox ID="主要產品TextBox0" runat="server" Text='<%# Bind("主要產品") %>' />
            <br />
            公開發行日:
            <asp:TextBox ID="公開發行日TextBox0" runat="server" Text='<%# Bind("公開發行日") %>' />
            <br />
            TCRI評等:
            <asp:TextBox ID="TCRI評等TextBox0" runat="server" Text='<%# Bind("TCRI評等") %>' />
            <br />
            評等日:
            <asp:TextBox ID="評等日TextBox0" runat="server" Text='<%# Bind("評等日") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            &nbsp;<asp:Label ID="Label24" runat="server" 
                style="font-weight: 700; color: #0000FF;" Text="台灣經濟新報(TEJ)資料"></asp:Label>
            <table style="width:700px;">
               
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="董事長"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="董事長Label" runat="server" Text='<%# Bind("董事長") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="總經理"></asp:Label>
                    </td>
                        <td>
                            <asp:Label ID="總經理Label" runat="server" Text='<%# Bind("總經理") %>' />
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="財務經理"></asp:Label>
                     </td>
                    <td>
                        <asp:Label ID="財務經理Label" runat="server" Text='<%# Bind("財務經理") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="電話"></asp:Label>
                     </td>
                        <td>
                            <asp:Label ID="電話Label" runat="server" Text='<%# Bind("電話") %>' />
                     </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="集團名稱"></asp:Label>
                     </td>
                    <td colspan=3>
                        <asp:Label ID="集團名稱Label" runat="server" Text='<%# Bind("集團名稱") %>' />
                     </td>                 
                </tr>                 
                 <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="地址"></asp:Label>
                     </td>
                    <td colspan=3>
                        <asp:Label ID="地址Label" runat="server" Text='<%# Bind("地址") %>' />
                     </td>                  
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="主要產品"></asp:Label>
                     </td>
                    <td colspan=3>
                        <asp:Label ID="主要產品Label" runat="server" Text='<%# Bind("主要產品") %>' />
                     </td>                    
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="TCRI財報年月"></asp:Label>
                     </td>
                    <td>
                        <asp:Label ID="TCRI財報年月Label" runat="server" Text='<%# Bind("TCRI財報年月") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="產業名稱"></asp:Label>
                     </td>
                        <td>
                            <asp:Label ID="產業名稱Label" runat="server" Text='<%# Bind("產業名稱") %>' />
                     </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="TCRI評等"></asp:Label>
                     </td>
                    <td>
                        <asp:Label ID="TCRI評等Label" runat="server" Text='<%# Bind("TCRI評等") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="評等日"></asp:Label>
                     </td>
                        <td>
                            <asp:Label ID="評等日Label" runat="server" Text='<%# Bind("評等日") %>' />
                     </td>
                </tr>               
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="dsTejDataDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        
        
        SelectCommand="SELECT invoice AS 統一編號, mkt + '/' + co_id AS [上市別 / 代號], chief AS 董事長, president AS 總經理, spokes2 AS 財務經理, phone AS 電話, gop_na AS 集團名稱, chi_add AS 地址, btindnm AS 主要產品, crmtcri AS TCRI評等, ad_tcri AS 評等日, yymm_tcri AS TCRI財報年月, sicsnm AS 產業名稱 FROM crmstd WHERE (invoice = @invoice)">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_SERNO" Name="invoice" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="Label22" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="拜訪日誌資料(最近十次)"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="dsGetDiaryData" 
        EnableModelValidation="True" EmptyDataText="查無資料">
        <Columns>
            <asp:BoundField DataField="DIARYNO" HeaderText="DIARYNO" ReadOnly="True" 
                SortExpression="DIARYNO" Visible="False" />
            <asp:TemplateField HeaderText="拜訪日期" SortExpression="VISITDATE">
                <ItemTemplate>                    
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("DIARYNO", "DiaryModify.aspx?DIARYNO={0}&ISHIDDEN=1") %>'
							 Text='<%# Bind("VISITDATE") %>'></asp:HyperLink>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VISITDATE") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BRNO" HeaderText="分行代號" SortExpression="BRNO" />
            <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" 
                SortExpression="BRNAME" />
            <asp:BoundField DataField="EDITEMPNO" HeaderText="登錄員員編" 
                SortExpression="EDITEMPNO" />
            <asp:BoundField DataField="NAME" HeaderText="登錄員姓名" SortExpression="NAME" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsGetDiaryData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT TOP (10) DIARYNO, VISITDATE, BRNO, EDITEMPNO, BRNAME, NAME FROM (SELECT a.DIARYNO, a.VISITDATE, a.BRNO, a.EDITEMPNO, f.BRNAME, g.NAME FROM CUSTMGR_DIARY AS a LEFT OUTER JOIN chb_pub.dbo.BRANCH AS f ON a.BRNO = f.BRNO LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE AS g ON a.EDITEMPNO = g.STAFF WHERE (a.SERNO = @serno)) AS c ORDER BY VISITDATE, BRNO DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_SERNO" Name="serno" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_EntType" runat="server" />
    <asp:SqlDataSource ID="dsGetSerNo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_HIDDENCUST] WHERE [BATCHNUMBER] = @BATCHNUMBER" 
        InsertCommand="INSERT INTO [CUSTMGR_HIDDENCUST] ([SERNO], [ENTNAME], [ENTADDRESS], [CONTRACTPEOPLE], [CAPITAL], [SETDATE], [CHANGEDATE], [DISSOLVEDATE], [BUILDDATE], [MODIFYDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @CHANGEDATE, @DISSOLVEDATE, @BUILDDATE, @MODIFYDATE)" 
        SelectCommand="SELECT SERNO FROM CUSTMGR_HIDDENCUST WHERE (BATCHNUMBER = @BATCHNUMBER)" 
        
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, CHANGEDATE = @CHANGEDATE, DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) WHERE (BATCHNUMBER = @BATCHNUMBER)">
        <DeleteParameters>
            <asp:Parameter Name="BATCHNUMBER" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="ENTNAME" Type="String" />
            <asp:Parameter Name="ENTADDRESS" Type="String" />
            <asp:Parameter Name="CONTRACTPEOPLE" Type="String" />
            <asp:Parameter Name="CAPITAL" Type="Decimal" />
            <asp:Parameter Name="SETDATE" Type="String" />
            <asp:Parameter Name="CHANGEDATE" Type="String" />
            <asp:Parameter Name="DISSOLVEDATE" Type="String" />
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="BATCHNUMBER" QueryStringField="BATCHNUMBER" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="CHANGEDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
            <asp:Parameter Name="BATCHNUMBER" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

