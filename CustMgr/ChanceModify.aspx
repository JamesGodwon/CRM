<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChanceModify.aspx.cs"
    Inherits="ChanceModify" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>商機明細查詢/修改</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
<script language="javascript" type="text/javascript">
// <![CDATA[

function btnPrint_onclick() {

}

function btnPrint_onclick() {

}

// ]]>
</script>
<style type="text/css" media="print">
         .print_disable
         {
             visibility: hidden;
         }
         
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>                 
            <div id="printlist">  
            <table border="2" cellpadding="2" cellspacing="2" width="720">
                <td class="style2">
                    <img alt=""  src="彰銀圖.gif" style="vertical-align: text-align: center" 
                        width="50" />
                </td>
                <td colspan=3>
                    <span><strong>
                    <asp:Label
                ID="lab_Title" Text="商機明細查詢/修改" runat="server"></asp:Label> </strong>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/Program/CustMgr/ChanceQuery.aspx" class="print_disable">【回到商機追蹤】</asp:HyperLink> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    <input id="btnPrint" type="button" value="列印" 
                    onclick="window.print()" onclick="return btnPrint_onclick()" class="print_disable" onclick="return btnPrint_onclick()" />                      
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
            
        <asp:FormView ID="FormView2" runat="server" 
                DataSourceID="dsOpportunitiesValueDetermine" DefaultMode="Edit" 
                EnableModelValidation="True">
            <EditItemTemplate>
                <table style="width:700px;">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="分行代號"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_Brname" runat="server" Text='<%# Eval("BRNAME") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="登錄員"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_EditName" runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="建立日期"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_RecordDate" runat="server" Text='<%# Eval("RECORDDATE") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" Text="商機單號"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_OppNo" runat="server" Text='<%# Eval("OPPNO") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label40" runat="server" Text="最後異動日"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_ModifyDate" runat="server" Text='<%# Eval("MODIFYDATE") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label42" runat="server" Text="客戶統編"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_SerNo" runat="server" Text='<%# Eval("SERNO") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label43" runat="server" Text="客戶名稱"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_AccountName" runat="server" 
                                Text='<%# Eval("ACCOUNTNAME") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label41" runat="server" Text="企業規模"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_EntSize" runat="server" Text='<%# Eval("ENTSIZE") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="集團代號"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_GroupNo" runat="server" Text='<%# Eval("GROUPNO") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="集團名稱"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lab_GroupName" runat="server" Text='<%# Eval("GROUPNAME") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>                    
                </table>
                &nbsp;
            </EditItemTemplate>
            <InsertItemTemplate>
                BRNAME:
                <asp:TextBox ID="BRNAMETextBox" runat="server" Text='<%# Bind("BRNAME") %>' />
                <br />
                ACCOUNTNAME:
                <asp:TextBox ID="ACCOUNTNAMETextBox" runat="server" 
                    Text='<%# Bind("ACCOUNTNAME") %>' />
                <br />
                ENTSIZE:
                <asp:TextBox ID="ENTSIZETextBox" runat="server" Text='<%# Bind("ENTSIZE") %>' />
                <br />
                GROUPNAME:
                <asp:TextBox ID="GROUPNAMETextBox" runat="server" 
                    Text='<%# Bind("GROUPNAME") %>' />
                <br />
                GROUPNO:
                <asp:TextBox ID="GROUPNOTextBox" runat="server" Text='<%# Bind("GROUPNO") %>' />
                <br />
                NAME:
                <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                <br />
                OPPNO:
                <asp:TextBox ID="OPPNOTextBox" runat="server" Text='<%# Bind("OPPNO") %>' />
                <br />
                SERNO:
                <asp:TextBox ID="SERNOTextBox" runat="server" Text='<%# Bind("SERNO") %>' />
                <br />
                RECORDDATE:
                <asp:TextBox ID="RECORDDATETextBox" runat="server" 
                    Text='<%# Bind("RECORDDATE") %>' />
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
                BRNAME:
                <asp:Label ID="BRNAMELabel" runat="server" Text='<%# Bind("BRNAME") %>' />
                <br />
                ACCOUNTNAME:
                <asp:Label ID="ACCOUNTNAMELabel" runat="server" 
                    Text='<%# Bind("ACCOUNTNAME") %>' />
                <br />
                ENTSIZE:
                <asp:Label ID="ENTSIZELabel" runat="server" Text='<%# Bind("ENTSIZE") %>' />
                <br />
                GROUPNAME:
                <asp:Label ID="GROUPNAMELabel" runat="server" Text='<%# Bind("GROUPNAME") %>' />
                <br />
                GROUPNO:
                <asp:Label ID="GROUPNOLabel" runat="server" Text='<%# Bind("GROUPNO") %>' />
                <br />
                NAME:
                <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                <br />
                OPPNO:
                <asp:Label ID="OPPNOLabel" runat="server" Text='<%# Bind("OPPNO") %>' />
                <br />
                SERNO:
                <asp:Label ID="SERNOLabel" runat="server" Text='<%# Bind("SERNO") %>' />
                <br />
                RECORDDATE:
                <asp:Label ID="RECORDDATELabel" runat="server" 
                    Text='<%# Bind("RECORDDATE") %>' />
                <br />
                MODIFYDATE:
                <asp:Label ID="MODIFYDATELabel" runat="server" 
                    Text='<%# Bind("MODIFYDATE") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="編輯" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="刪除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="新增" />
            </ItemTemplate>
        </asp:FormView>

        <table>
        <tr>
                    <td class="style4">
                        <asp:Label ID="Label7" runat="server" Text="日誌資料"></asp:Label>
                    </td>
                    <td>
                        <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" 
                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                            CellSpacing="2" DataSourceID="dsGetDiary" GridLines="Both" 
                            onitemdatabound="DataList1_ItemDataBound" RepeatDirection="Horizontal">
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" 
                                    NavigateUrl='<%# Eval("DIARYNO", "DiaryModify.aspx?DIARYNO={0}") %>' 
                                    Text='<%# Eval("VISITDATE") %>'></asp:HyperLink>
                                <br />
<br />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                    </td>                 
                </tr>
            
                 <tr>
                    <td class="style4">
                        <asp:Label ID="Label44" runat="server" Text="執行結果"></asp:Label>
                     </td>
                    <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="OPPNO,OPPTYPE" 
                DataSourceID="dsGetOpportunities" EnableModelValidation="True" 
                            >
            <Columns>
                <asp:BoundField DataField="OPPNO" HeaderText="OPPNO" ReadOnly="True" 
                    SortExpression="OPPNO" Visible="False" />
                <asp:TemplateField HeaderText="OPPTYPE" SortExpression="OPPTYPE" 
                    Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label31" runat="server" Text='<%# Eval("OPPTYPE") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lab_OpType" runat="server" Text='<%# Bind("OPPTYPE") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OPPTYPEDESC" HeaderText="商機" 
                    SortExpression="OPPTYPEDESC" />
                <asp:BoundField DataField="EXDESC" HeaderText="處理狀態" SortExpression="EXDESC" />
                <asp:TemplateField HeaderText="執行結果" SortExpression="EXRESULTDESC">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EXRESULTDESC") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:RadioButtonList ID="rbtn_ExeResult" runat="server" 
                            RepeatDirection="Horizontal" SelectedValue='<%# Bind("EXRESULT") %>' 
                            AutoPostBack="True" 
                            onselectedindexchanged="rbtn_ExeResult_SelectedIndexChanged" >                                                        
                            <asp:ListItem Value="">尚未執行</asp:ListItem>
                            <asp:ListItem Value="1">已實現</asp:ListItem>
                            <asp:ListItem Value="0">勸誘無望</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="執行結果(數字)" SortExpression="EXRESULT" 
                    Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lab_ExResult" runat="server" Text='<%# Bind("EXRESULT") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EXRESULT") %>'></asp:TextBox>
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











                    </td>                 
                </tr>
                 <tr>
                    <td class="style4">
                        <asp:Label ID="Label45" runat="server" Text="已實現商機&lt;br/&gt;可增加收益"></asp:Label>
                     </td>
                    <td>











                        <asp:TextBox ID="txt_Income" runat="server" Width="321px"></asp:TextBox>
                        <asp:Label ID="Label46" runat="server" Text="單位：台幣千元(千元以下四捨五入取至個位數)"></asp:Label>
                    </td>                 
                </tr>
                 <tr>
                    <td class="style4">
                        <asp:Label ID="Label8" runat="server" Text="是否結案"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbtn_EndProject" runat="server" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                            onselectedindexchanged="rbtn_EndProject_SelectedIndexChanged">
                            <asp:ListItem>Y</asp:ListItem>
                            <asp:ListItem>N</asp:ListItem>
                        </asp:RadioButtonList>











    <asp:Label ID="lab_State0" runat="server" style="color: #0000FF" class="print_disable"></asp:Label>
                     </td>                 
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label30" runat="server" Text="Memo"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_Memo" runat="server" Rows="15" 
                             TextMode="MultiLine" Width="600px" />
                    </td>                 
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>











            <asp:LinkButton ID="btn_Modify" runat="server" onclick="btn_Modify_Click" class="print_disable">確定</asp:LinkButton>











    <asp:Label ID="lab_State" runat="server" style="color: #0000FF" class="print_disable"></asp:Label>
                    </td>                 
                </tr>

            </table>
<table style="width:100%;">
            <tr>
                <td>
                    &nbsp;<asp:Label ID="Label32" runat="server" Text="單位主管" 
                        style="font-weight: 700"></asp:Label></td>
                <td>
                    &nbsp;<asp:Label ID="Label35" runat="server" Text="負責人" 
                        style="font-weight: 700"></asp:Label></td>
                <td>
                    &nbsp;<asp:Label ID="Label38" runat="server" Text="經辦" 
                        style="font-weight: 700"></asp:Label></td>
            </tr>            
        </table>










            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong></span>
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:HiddenField ID="hidn_OppNo" runat="server" />
    <asp:SqlDataSource ID="dsGetOpportunities" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIES] WHERE [OPPNO] = @OPPNO AND [OPPTYPE] = @OPPTYPE" 
        InsertCommand="INSERT INTO [CUSTMGR_OPPORTUNITIES] ([OPPNO], [BRNO], [SERNO], [EDITEMPNO], [OPPTYPE], [EXRESULT], [RECORDDATE], [ENDPROJECT]) VALUES (@OPPNO, @BRNO, @SERNO, @EDITEMPNO, @OPPTYPE, @EXRESULT, @RECORDDATE, @ENDPROJECT)" 
        SelectCommand="SELECT a.OPPNO, a.OPPTYPE, a.EXRESULT, b.COLDESC AS OPPTYPEDESC, c.COLDESC AS EXRESULTDESC, CASE WHEN EXRESULT IS NULL THEN N'尚未執行' ELSE N'已執行' END AS EXDESC FROM CUSTMGR_OPPORTUNITIES AS a INNER JOIN CUSTMGR_OPTION AS b ON a.OPPTYPE = b.COLVALUE AND b.DBCOLUMN = 'OPPTYPE' LEFT OUTER JOIN CUSTMGR_OPTION AS c ON a.EXRESULT = c.COLVALUE AND c.DBCOLUMN = 'EXRESULT' WHERE (a.OPPNO = @OPPNO)" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET EDITEMPNO = @EDITEMPNO, EXRESULT = @EXRESULT WHERE (OPPNO = @OPPNO) AND (OPPTYPE = @OPPTYPE)">
        <DeleteParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="EDITEMPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
            <asp:Parameter Name="EXRESULT" Type="Int32" />
            <asp:Parameter Name="RECORDDATE" Type="String" />
            <asp:Parameter Name="ENDPROJECT" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPNO" 
                PropertyName="Value" />
            <asp:Parameter Name="EXRESULT" />
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
            <asp:Parameter Name="OPPTYPE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOpportunitiesValueDetermine" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIES] WHERE [OPPNO] = @OPPNO AND [OPPTYPE] = @OPPTYPE" 
        InsertCommand="INSERT INTO [CUSTMGR_OPPORTUNITIES] ([OPPNO], [BRNO], [SERNO], [EDITEMPNO], [OPPTYPE], [EXRESULT], [RECORDDATE], [ENDPROJECT]) VALUES (@OPPNO, @BRNO, @SERNO, @EDITEMPNO, @OPPTYPE, @EXRESULT, @RECORDDATE, @ENDPROJECT)" 
        SelectCommand="SELECT TOP (1) b.BRNO + '_' + b.BRNAME AS BRNAME, ISNULL(d.ACCOUNTNAME, e.ACCOUNTNAME) AS ACCOUNTNAME, ISNULL(f.COLDESC, g.COLDESC) AS ENTSIZE, ISNULL(d.GROUPNAME, e.GROUPNAME) AS GROUPNAME, ISNULL(d.GROUPNO, e.GROUPNO) AS GROUPNO, k.NAME, a.OPPNO, a.SERNO, a.RECORDDATE, a.MODIFYDATE, a.ENDPROJECT FROM CUSTMGR_OPPORTUNITIES AS a LEFT OUTER JOIN chb_pub.dbo.BRANCH AS b ON a.BRNO = b.BRNO LEFT OUTER JOIN CUSTMGR_CUSTLIST AS d ON a.BRNO = d.BRNO AND a.SERNO = d.SERNO LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS AS e ON a.BRNO = e.BRNO AND a.SERNO = e.SERNO LEFT OUTER JOIN CUSTMGR_OPTION AS f ON d.ENTSIZE = f.COLVALUE AND f.DBCOLUMN = 'ENTSIZE' LEFT OUTER JOIN CUSTMGR_OPTION AS g ON e.ENTSIZE = g.COLVALUE AND g.DBCOLUMN = 'ENTSIZE' LEFT OUTER JOIN CUSTMGR_GROUP AS h ON d.ENTSERNOMAIN = h.ENTSERNOMAIN LEFT OUTER JOIN CUSTMGR_GROUP AS i ON e.ENTSERNOMAIN = i.ENTSERNOMAIN INNER JOIN chb_pub.dbo.EMPLOYEE AS k ON a.EDITEMPNO = k.STAFF WHERE (a.OPPNO = @OPPNO) AND (a.RECORDDATE = (SELECT MIN(RECORDDATE) AS Expr1 FROM CUSTMGR_OPPORTUNITIES WHERE (OPPNO = @OPPNO)))" 
        
        
        
        
        
        
        UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET EDITEMPNO = @EDITEMPNO, EXRESULT = @EXRESULT WHERE (OPPNO = @OPPNO) AND (OPPTYPE = @OPPTYPE)">
        <DeleteParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="EDITEMPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
            <asp:Parameter Name="EXRESULT" Type="Int32" />
            <asp:Parameter Name="RECORDDATE" Type="String" />
            <asp:Parameter Name="ENDPROJECT" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="lab_EmpNo" Name="EDITEMPNO" 
                PropertyName="Text" />
            <asp:Parameter Name="EXRESULT" />
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
            <asp:Parameter Name="OPPTYPE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsOpportunitiesMemo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIESMEMO] WHERE [OPPNO] = @OPPNO" 
        InsertCommand="INSERT INTO CUSTMGR_OPPORTUNITIESMEMO(OPPNO, MEMO, INCOME) VALUES (@OPPNO, @MEMO, @INCOME)" 
        SelectCommand="SELECT * FROM [CUSTMGR_OPPORTUNITIESMEMO] WHERE ([OPPNO] = @OPPNO)" 
        
        
                UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), ENDPROJECT = @ENDPROJECT WHERE (OPPNO = @OPPNO)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="txt_Memo" Name="MEMO" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="txt_Income" Name="INCOME" 
                PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="rbtn_EndProject" Name="ENDPROJECT" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGetDiary" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIESMEMO] WHERE [OPPNO] = @OPPNO" 
        InsertCommand="INSERT INTO [CUSTMGR_OPPORTUNITIESMEMO] ([OPPNO], [MEMO]) VALUES (@OPPNO, @MEMO)" 
        SelectCommand="SELECT DISTINCT a.DIARYNO, SUBSTRING(a.DIARYNO, 13, 8) AS VISITDATE FROM CUSTMGR_DIARY AS a INNER JOIN CUSTMGR_DIARYOPPMAPPING AS b ON a.DIARYNO = b.DIARYNO INNER JOIN CUSTMGR_OPPORTUNITIES AS c ON b.OPPNO = c.OPPNO inner join CUSTMGR_DIARYOPPORTUNITIES d
on a.DIARYNO=d.DIARYNO WHERE (c.OPPNO = @OPPNO) ORDER BY a.DIARYNO DESC" 
        
        
        
                UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), ENDPROJECT = @ENDPROJECT WHERE (OPPNO = @OPPNO)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="txt_Memo" Name="MEMO" PropertyName="Text" 
                Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="rbtn_EndProject" Name="ENDPROJECT" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCheckDiaryNotInSameBrno" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIESMEMO] WHERE [OPPNO] = @OPPNO" 
        InsertCommand="INSERT INTO [CUSTMGR_OPPORTUNITIESMEMO] ([OPPNO], [MEMO]) VALUES (@OPPNO, @MEMO)" 
        SelectCommand="SELECT COUNT(1) AS Expr1 FROM CUSTMGR_DIARY WHERE (DIARYNO = @DIARYNO) AND (EDITEMPNO = @EMPID) AND (BRNO &lt;&gt; @BRNO) OR (DIARYNO = @DIARYNO) AND (BRNO &lt;&gt; @BRNO) AND (MGREMPNO = @EMPID)" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112), ENDPROJECT = @ENDPROJECT WHERE (OPPNO = @OPPNO)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="txt_Memo" Name="MEMO" PropertyName="Text" 
                Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="DIARYNO" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EMPID" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
            <asp:ControlParameter ControlID="rbtn_EndProject" Name="ENDPROJECT" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGetOpportunitiesNULL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_OPPORTUNITIES] WHERE [OPPNO] = @OPPNO AND [OPPTYPE] = @OPPTYPE" 
        InsertCommand="INSERT INTO [CUSTMGR_OPPORTUNITIES] ([OPPNO], [BRNO], [SERNO], [EDITEMPNO], [OPPTYPE], [EXRESULT], [RECORDDATE], [ENDPROJECT]) VALUES (@OPPNO, @BRNO, @SERNO, @EDITEMPNO, @OPPTYPE, @EXRESULT, @RECORDDATE, @ENDPROJECT)" 
        SelectCommand="SELECT a.OPPNO, a.OPPTYPE, a.EXRESULT, b.COLDESC AS OPPTYPEDESC, c.COLDESC AS EXRESULTDESC FROM CUSTMGR_OPPORTUNITIES AS a INNER JOIN CUSTMGR_OPTION AS b ON a.OPPTYPE = b.COLVALUE AND b.DBCOLUMN = 'OPPTYPE' LEFT OUTER JOIN CUSTMGR_OPTION AS c ON a.EXRESULT = c.COLVALUE AND c.DBCOLUMN = 'EXRESULT' WHERE (a.OPPNO = @OPPNO)" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_OPPORTUNITIES SET EDITEMPNO = @EDITEMPNO, EXRESULT = NULL WHERE (OPPNO = @OPPNO) AND (OPPTYPE = @OPPTYPE)">
        <DeleteParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OPPNO" Type="String" />
            <asp:Parameter Name="BRNO" Type="String" />
            <asp:Parameter Name="SERNO" Type="String" />
            <asp:Parameter Name="EDITEMPNO" Type="String" />
            <asp:Parameter Name="OPPTYPE" Type="Int32" />
            <asp:Parameter Name="EXRESULT" Type="Int32" />
            <asp:Parameter Name="RECORDDATE" Type="String" />
            <asp:Parameter Name="ENDPROJECT" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" PropertyName="Value" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPNO" 
                PropertyName="Value" />
            <asp:ControlParameter ControlID="hidn_OppNo" Name="OPPNO" 
                PropertyName="Value" />
            <asp:Parameter Name="OPPTYPE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>

