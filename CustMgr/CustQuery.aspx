<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustQuery.aspx.cs" Inherits="CustQuery" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>客戶管理</title>
	<link href="Site.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<table border="2" cellpadding="2" cellspacing="2" width="720">
			<td class="style2">
				<img alt="" src="彰銀圖.gif" style="vertical-align: text-align: center" width="50" />
			</td>
			<td colspan="3">
				<span><strong>
					<asp:Label ID="lab_Title" Text="客戶管理" runat="server"></asp:Label>
				</strong></span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btn_ExportExcel" runat="server" OnClick="btn_ExportExcel_Click" Text="匯出Excel" />&nbsp;
				<input id="btnPrint" type="button" value="列印" onclick="printScreen(printlist)" />
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
		<table style="width: 100%;">
			<tr>
				<td>
					<asp:Label ID="Label5" runat="server" Text="請輸入查詢條件" Style="font-weight: 700"></asp:Label>
				</td>
				<td>
					<asp:RadioButtonList ID="rbtn_Useful" runat="server" RepeatDirection="Horizontal"
						AutoPostBack="True">
						<asp:ListItem Selected="True" Value="1">有效戶名單</asp:ListItem>
						<asp:ListItem Value="2">已轉入無效戶名單</asp:ListItem>
						<asp:ListItem Value="3">全部名單</asp:ListItem>
					</asp:RadioButtonList>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label3" runat="server" Text="統一編號或名稱"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txt_SERNO" runat="server" Width="314px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label6" runat="server" Text="集團代號或名稱"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txt_SERNOSUB" runat="server" Width="314px"></asp:TextBox>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label9" runat="server" Text="職務"></asp:Label>
				</td>
				<td>
					<asp:RadioButtonList ID="rbtn_Position" runat="server" RepeatDirection="Horizontal"
						AutoPostBack="True">
						<asp:ListItem Value="1">AO</asp:ListItem>
						<asp:ListItem Value="2">助理AO</asp:ListItem>
						<asp:ListItem Value="3">PO</asp:ListItem>
						<asp:ListItem Value="4">其他</asp:ListItem>
						<asp:ListItem Selected="True" Value="5">全部</asp:ListItem>
					</asp:RadioButtonList>
			</tr>
			<tr>
				<td>
					<asp:Label ID="lab_CrcDisplay" runat="server" Text="CRC代號" Visible="False"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" DataTextField="BRNAME"
						DataValueField="BRNO" Width="200px" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="drList_Crc_SelectedIndexChanged">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsCRC" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub1 %>"
						SelectCommand="SELECT '請選擇' AS BRNAME, '-1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br)) ORDER BY BRNO">
					</asp:SqlDataSource>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label4" runat="server" Text="分行代號"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" DataTextField="BRNAME"
						DataValueField="BRNO" Width="200px" AutoPostBack="True">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsBrno" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub1 %>"
						SelectCommand="EXEC('SELECT ''請選擇'' AS BRNAME
	 , -1 AS BRNO UNION
SELECT BRNO + ''_'' + BRNAME AS BRNAME
	 , BRNO
FROM
	BRANCH
WHERE 
	(BRNAME LIKE ''%分行''  or BRNO=''2200'' )
 '+@condition+'	
ORDER BY
	BRNO')">
						<SelectParameters>
							<asp:ControlParameter ControlID="hidn_conditionBrno" Name="condition" PropertyName="Value" />
						</SelectParameters>
					</asp:SqlDataSource>
			</tr>
			<tr>
				<td>
					<asp:Label ID="Label7" runat="server" Text="管理員"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_MgrId" runat="server" DataSourceID="dsMgrEmpNo" DataTextField="NAME"
						DataValueField="STAFF" Width="200px">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsMgrEmpNo" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
						SelectCommand="SELECT '請選擇' AS NAME, '-1' AS STAFF UNION SELECT a.MGREMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_EDITMGR AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @brno) ORDER BY STAFF">
						<SelectParameters>
							<asp:ControlParameter ControlID="drList_Brno" Name="brno" PropertyName="SelectedValue" />
						</SelectParameters>
					</asp:SqlDataSource>
					<asp:Label ID="Label10" runat="server" Style="font-weight: 700; color: #0000FF" Text="查詢分行代號該分行的管理員"></asp:Label>
			</tr>
			<tr>
				<td colspan="2">
					<asp:Button ID="btn_Query" runat="server" Text="查詢" OnClick="btn_Query_Click" />
					<asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
				</td>
			</tr>
		</table>
		<strong>
			<asp:HiddenField ID="hidn_EmpNo" runat="server" />
		</strong></span>
	</div>
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
	<p>
		<asp:HyperLink ID="Link_AddCustList" runat="server" NavigateUrl="~/Program/CustMgr/CustListAdd.aspx">新增名單</asp:HyperLink>
		&nbsp;
		<asp:HyperLink ID="Link_AddGroup0" runat="server" NavigateUrl="~/Program/CustMgr/BrnoMgrEdit.aspx">管理員維護</asp:HyperLink>
		&nbsp;&nbsp;<asp:Label ID="lab_State2" runat="server" Style="color: #0000FF"></asp:Label>
		&nbsp;<asp:Button ID="btn_ConverToUseLessTrue" runat="server" Enabled="False" OnClick="btn_ConverToUseLessTrue_Click"
			Text="轉入無效戶" onclientclick="return confirm('是否轉入無效戶?')" />
		&nbsp;<div id="printlist">
			&nbsp;<asp:Label ID="lab_QueryDate" runat="server"></asp:Label>
			<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
				BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
				DataSourceID="dsCustListQuery" EnableModelValidation="True" DataKeyNames="SERNO,BRNO"
				EmptyDataText="查無客戶名單資料" OnDataBound="GridView1_DataBound" AllowSorting="True" 
                onrowdatabound="GridView1_RowDataBound" AllowPaging="True" PageSize="100">
				<Columns>
					<asp:TemplateField HeaderText="選取">
						<ItemTemplate>
							<asp:CheckBox ID="ck_MgrSelected" runat="server" AutoPostBack="True" 
                                oncheckedchanged="ck_MgrSelected_CheckedChanged" />
						</ItemTemplate>
						<EditItemTemplate>
							<asp:CheckBox ID="CheckBox1" runat="server" />
						</EditItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="CRCNO" HeaderText="CRC" SortExpression="CRCNO" />
                    <asp:BoundField DataField="BRNO" HeaderText="分行" SortExpression="BRNO" />
					<asp:TemplateField HeaderText="客戶名稱" SortExpression="ACCOUNTNAME">
						<ItemTemplate>
							<asp:HyperLink ID="Link_AccountName" runat="server" Text='<%# Bind("ACCOUNTNAME") %>'></asp:HyperLink>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ACCOUNTNAME") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="統一編號" SortExpression="SERNO">
						<ItemTemplate>
							<asp:Label ID="Lab_SerNo" runat="server" Text='<%# Bind("SERNO") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SERNO") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="CUSTTYPE" HeaderText="客戶類型" SortExpression="CUSTTYPE" />
					<asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" SortExpression="GROUPNAME" />
					<asp:BoundField DataField="ENTSIZE" HeaderText="企業規模" SortExpression="ENTSIZE" />
					<asp:BoundField DataField="VISITDATE" HeaderText="最後拜訪日期" SortExpression="VISITDATE" />
					<asp:TemplateField HeaderText="分行" SortExpression="BRNO" Visible="False">
						<ItemTemplate>
							<asp:Label ID="lab_Brno" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BRNO") %>'></asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="NAME" HeaderText="管理員" SortExpression="NAME" />
					<asp:BoundField DataField="USEFUL" HeaderText="有效戶" SortExpression="USEFUL" />
					<asp:BoundField DataField="ZONENAME" HeaderText="所在工業區" SortExpression="ZONENAME" />
					<asp:BoundField DataField="MGRDESC" HeaderText="地址／聯絡人／電話" 
                        SortExpression="MGRDESC" />
				</Columns>
				<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
				<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
				<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
				<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
				<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
			</asp:GridView>
		</div>
		<asp:SqlDataSource ID="dsCustListQuery" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
			SelectCommand="EXEC ('SELECT a.ACCOUNTNAME
	 , c.COLDESC AS CUSTTYPE
	 , a.GROUPNAME
	 , e.COLDESC AS ENTSIZE
	 , b.VISITDATE
	 , a.BRNO
	 , f.NAME
	 , a.USEFUL
	 , a.SERNO
	 , a.ZONENAME
	 , isnull(a.CONTRACTADDRESS,'''')+''／''+isnull(a.CONTRACTPEOPLE,'''')+''／''+isnull(a.CONTRACTTEL,'''')  as MGRDESC
	 , h.CRCNO
FROM
	CUSTMGR_CUSTLIST a
	LEFT OUTER JOIN CUSTMGR_DIARY b
		ON a.BRNO = b.BRNO AND a.SERNO = b.SERNO AND b.VISITDATE = (SELECT max(VISITDATE)
																	FROM
																		CUSTMGR_DIARY
																	WHERE
																		CUSTMGR_DIARY.BRNO = a.BRNO
																		AND CUSTMGR_DIARY.SERNO = a.SERNO)
	INNER JOIN CUSTMGR_OPTION c
		ON a.CUSTTYPE = c.COLVALUE AND c.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_GROUP d
		ON a.ENTSERNOMAIN = d.ENTSERNOMAIN
	LEFT OUTER JOIN CUSTMGR_OPTION e
		ON a.ENTSIZE = e.COLVALUE AND e.DBCOLUMN = ''ENTSIZE''
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE f
		ON a.MGREMPNO = f.STAFF
    LEFT OUTER JOIN CUSTMGR_INDUSTRIALZONE g
		ON a.ZONENAME = g.ZONENAME	
    LEFT OUTER JOIN chb_pub.dbo.crc_rel_br h
        on a.BRNO = h.BRNO   			
	where 1=1 ' + @condition + '

ORDER BY
	h.CRCNO,a.BRNO ,a.ACCOUNTNAME')" OnSelecting="dsCustListQuery_Selecting">
			<SelectParameters>
				<asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
			</SelectParameters>
		</asp:SqlDataSource>
		<asp:HiddenField ID="hidn_condition" runat="server" />
		<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
		<asp:SqlDataSource ID="dsUsefulChange" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
			DeleteCommand="DELETE FROM [CUSTMGR_EDITMGR] WHERE [BRNO] = @BRNO AND [MGREMPNO] = @MGREMPNO"
			InsertCommand="INSERT INTO [CUSTMGR_EDITMGR] ([BRNO], [MGREMPNO], [POSITION]) VALUES (@BRNO, @MGREMPNO, @POSITION)"
			SelectCommand="SELECT a.ACCOUNTNAME, a.SERNO, a.BRNO, a.MGREMPNO, c.COLDESC, d.NAME FROM CUSTMGR_CUSTLIST AS a LEFT OUTER JOIN CUSTMGR_EDITMGR AS b ON a.BRNO = b.BRNO AND a.MGREMPNO = b.MGREMPNO INNER JOIN CUSTMGR_OPTION AS c ON b.POSITION = c.COLVALUE AND c.DBCOLUMN = 'POSITION' INNER JOIN chb_pub.dbo.EMPLOYEE AS d ON a.MGREMPNO = d.STAFF WHERE (a.BRNO = @BRNO) ORDER BY a.MGREMPNO"
			UpdateCommand="UPDATE CUSTMGR_CUSTLIST SET USEFUL = 'N' WHERE (BRNO = @BRNO) AND (SERNO = @SERNO)">
			<DeleteParameters>
				<asp:Parameter Name="BRNO" Type="String" />
				<asp:Parameter Name="MGREMPNO" Type="String" />
			</DeleteParameters>
			<InsertParameters>
				<asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" Type="String" />
				<asp:ControlParameter ControlID="txt_MGREMPNO" Name="MGREMPNO" PropertyName="Text"
					Type="String" />
				<asp:ControlParameter ControlID="rbtn_Position" Name="POSITION" PropertyName="SelectedValue"
					Type="Int32" />
			</InsertParameters>
			<SelectParameters>
				<asp:ControlParameter ControlID="hidn_BRNO" Name="BRNO" PropertyName="Value" />
			</SelectParameters>
			<UpdateParameters>
				<asp:Parameter Name="BRNO" />
				<asp:Parameter Name="SERNO" />
			</UpdateParameters>
		</asp:SqlDataSource>
	</form>
</body>
</html>
