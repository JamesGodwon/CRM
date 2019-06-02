<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChanceQuery.aspx.cs"
	Inherits="ChanceQuery" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>商機追蹤</title>
	<link href="Site.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>

	<style type="text/css">
		.style3
		{
			width: 128px;
		}
	</style>
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
					<asp:Label ID="lab_Title" Text="商機追蹤" runat="server"></asp:Label>
				</strong></span>               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btn_ExportExcel" runat="server" onclick="btn_ExportExcel_Click" 
					Text="匯出Excel" />&nbsp;
					<input id="btnPrint" type="button" value="列印" 
				onclick="printScreen(printlist)"/>
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
				<td class="style3">
					<asp:Label ID="Label8" runat="server" Text="請輸入查詢條件" Style="font-weight: 700"></asp:Label>
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="style3">
					<asp:Label ID="Label11" runat="server" Text="案件狀態"></asp:Label>
				</td>
				<td>
					<asp:RadioButtonList ID="rbtn_OppEndStatus" runat="server" RepeatDirection="Horizontal"
						AutoPostBack="True" onselectedindexchanged="rbtn_OppEndStatus_SelectedIndexChanged">
						<asp:ListItem Selected="True" Value="0">未結案</asp:ListItem>
						<asp:ListItem Value="1">已結案</asp:ListItem>
						<asp:ListItem Value="2">全部</asp:ListItem>
					</asp:RadioButtonList>
					<asp:RadioButtonList ID="rbtn_NotEndPeiod" runat="server" 
						RepeatDirection="Horizontal">
						<asp:ListItem Selected="True" Value="0">最近3M未結案</asp:ListItem>
						<asp:ListItem Value="1">逾3M未結案</asp:ListItem>
					</asp:RadioButtonList>
					<asp:Label ID="Label16" runat="server" Text="拜訪日期"></asp:Label>&nbsp;&nbsp;
					<asp:Label ID="Label15" runat="server" Text="開始日期"></asp:Label>
					<asp:TextBox ID="txt_VisitDateStart" runat="server"></asp:TextBox>
					<asp:Label ID="Label13" runat="server" Text="結束日期"></asp:Label>
					<asp:TextBox ID="txt_VisitDateEnd" runat="server"></asp:TextBox><br />
					<asp:Label ID="Label14" runat="server" Text="西元年(YYYYMMDD) 例如：20110101"></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="style3">
					<asp:Label ID="Label3" runat="server" Text="統一編號或名稱"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txt_SERNO" runat="server" Width="314px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td class="style3">
					<asp:Label ID="Label6" runat="server" Text="集團代號或名稱"></asp:Label>
				</td>
				<td>
					<asp:TextBox ID="txt_SERNOSUB" runat="server" Width="314px"></asp:TextBox>
			</tr>
			<tr>
				<td class="style3">
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
				<td class="style3">
					<asp:Label ID="lab_CrcDisplay" runat="server" Text="CRC代號" Visible="False"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" DataTextField="BRNAME"
						DataValueField="BRNO" Width="200px" Visible="False" AutoPostBack="True" 
						onselectedindexchanged="drList_Crc_SelectedIndexChanged">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsCRC" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub1 %>"
						SelectCommand="SELECT '請選擇' AS BRNAME, '-1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br)) ORDER BY BRNO">
					</asp:SqlDataSource>
			</tr>
			<tr>
				<td class="style3">
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
	(BRNAME LIKE ''%分行''  or BRNO=''2200'')
 '+@condition+'	
ORDER BY
	BRNO')">
						<SelectParameters>
							<asp:ControlParameter ControlID="hidn_conditionBrno" Name="condition" PropertyName="Value" />
						</SelectParameters>
					</asp:SqlDataSource>
			</tr>
			<tr>
				<td class="style3">
					<asp:Label ID="Label7" runat="server" Text="登錄員"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_MgrId" runat="server" DataSourceID="dsMgrEmpNo" DataTextField="NAME"
						DataValueField="STAFF" Width="200px">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsMgrEmpNo" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
						SelectCommand="SELECT '請選擇' AS NAME, '-1' AS STAFF UNION SELECT a.EDITEMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_DIARY AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.EDITEMPNO = b.STAFF WHERE (a.BRNO = @brno) ORDER BY STAFF">
						<SelectParameters>
							<asp:ControlParameter ControlID="drList_Brno" Name="brno" PropertyName="SelectedValue" />
						</SelectParameters>
					</asp:SqlDataSource>
					<asp:Label ID="Label10" runat="server" Style="font-weight: 700; color: #0000FF" Text="查詢分行代號該分行的登錄員"></asp:Label>
			</tr>
			
			<tr>
				<td class="style3">
					<asp:Label ID="Label5" runat="server" Text="商機種類"></asp:Label>
				</td>
				<td>
					<asp:DropDownList ID="drList_OppType" runat="server" 
                        DataSourceID="dsOPPTYPEDisplay" DataTextField="COLDESC"
						DataValueField="COLVALUE" Width="200px">
					</asp:DropDownList>
					<asp:SqlDataSource ID="dsOPPTYPEDisplay" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
						
                        SelectCommand="SELECT '-1' AS COLVALUE, '請選擇' AS COLDESC UNION SELECT COLVALUE, COLDESC FROM CUSTMGR_OPTION WHERE (DBCOLUMN = 'OPPTYPE')">
					</asp:SqlDataSource>
			</tr>
			
			<tr>
				<td colspan="2">
					<asp:Button ID="btn_Query" runat="server" Text="查詢" OnClick="btn_Query_Click" />
					<asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
				</td>
			</tr>
		</table>
		&nbsp;&nbsp; 
		<div id="printlist">  
		&nbsp;<asp:Label ID="lab_QueryDate" runat="server"></asp:Label>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
			BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
			DataSourceID="dsQueryOpp" EnableModelValidation="True" EmptyDataText="查無商機資料" 
				onrowdatabound="GridView1_RowDataBound" AllowSorting="True">
			<Columns>
				<asp:BoundField DataField="CRCNO" HeaderText="CRC" />
				<asp:BoundField DataField="BRNO" HeaderText="分行代號" />
				<asp:BoundField DataField="BRNAME" HeaderText="分行名稱" />
				<asp:TemplateField HeaderText="客戶名稱" SortExpression="ACCOUNTNAME">
					<ItemTemplate>
						<asp:HyperLink ID="HyperLink1" runat="server" 
							NavigateUrl='<%# Eval("OPPNO", "ChanceModify.aspx?OPPNO={0}") %>' 
							Text='<%# Bind("ACCOUNTNAME") %>'></asp:HyperLink>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Eval("ACCOUNTNAME") %>'></asp:Label>
					</EditItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="CUSTTYPE" HeaderText="客戶類型" ReadOnly="True" 
					SortExpression="CUSTTYPE" />
				<asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" ReadOnly="True" 
					SortExpression="GROUPNAME" />
				<asp:BoundField DataField="MGRNAME" HeaderText="管理員" SortExpression="MGRNAME" />
				<asp:BoundField DataField="NAME" HeaderText="登錄員" SortExpression="NAME" />
				<asp:BoundField DataField="OPPNO" HeaderText="商機單號" />
				<asp:BoundField DataField="TotalOppNum" HeaderText="商機數" ReadOnly="True" />
				<asp:BoundField DataField="ImplementNum" HeaderText="商機已實現數" ReadOnly="True" />
				<asp:BoundField DataField="ImplementRate" HeaderText="商機實現率" ReadOnly="True" 
					DataFormatString="{0:0.00%}" />
				<asp:BoundField DataField="ExecuteNum" HeaderText="商機已執行數" ReadOnly="True" />
				<asp:BoundField DataField="ExecuteRate" HeaderText="商機執行率" ReadOnly="True" 
					DataFormatString="{0:0.00%}" />
				<asp:BoundField DataField="ENDPROJECT" HeaderText="結案" />
			</Columns>
			<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
			<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
				Wrap="False" />
			<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
			<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
			<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
		</asp:GridView>
		</div>
		<asp:SqlDataSource ID="dsQueryOpp" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
			
			SelectCommand="EXEC ('
SELECT c.CRCNO
	 , b.BRNO
	 , b.BRNAME
	 , isnull(d.ACCOUNTNAME, e.ACCOUNTNAME) AS ACCOUNTNAME
	 , isnull(d.CUSTNICKNAME, e.CUSTNICKNAME) AS CUSTNICKNAME
	 , isnull(f.COLDESC, g.COLDESC) AS CUSTTYPE
	 , isnull(d.GROUPNAME, e.GROUPNAME) AS GROUPNAME
	 , k.NAME
	 , a.OPPNO
	 , l.TotalOppNum
	 , l.ImplementNum
	 , (cast(l.ImplementNum AS FLOAT) / cast(l.TotalOppNum AS FLOAT))  AS ImplementRate
	 , l.ExecuteNum
	 , cast(l.ExecuteNum AS FLOAT) / cast(l.TotalOppNum AS FLOAT)  AS ExecuteRate
	 , isnull(m.NAME, n.NAME) AS MGRNAME
	 , a.ENDPROJECT
FROM
	CUSTMGR_OPPORTUNITIES a
	LEFT OUTER JOIN chb_pub.dbo.BRANCH b
		ON a.BRNO = b.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br c
		ON a.BRNO = c.BRNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST d
		ON a.BRNO = d.BRNO AND a.SERNO = d.SERNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS e
		ON a.BRNO = e.BRNO AND a.SERNO = e.SERNO
	LEFT OUTER JOIN CUSTMGR_OPTION f
		ON d.CUSTTYPE = f.COLVALUE AND f.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_OPTION g
		ON e.CUSTTYPE = g.COLVALUE AND g.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_GROUP h
		ON d.ENTSERNOMAIN = h.ENTSERNOMAIN
	LEFT OUTER JOIN CUSTMGR_GROUP i
		ON e.ENTSERNOMAIN = i.ENTSERNOMAIN
	INNER JOIN chb_pub.dbo.EMPLOYEE k
		ON a.EDITEMPNO = k.STAFF
	INNER JOIN (SELECT OPPNO
					 , count(1) AS TotalOppNum
					 , sum(isnull(EXRESULT, 0)) AS ImplementNum
					 , sum(isnumeric(EXRESULT)) AS ExecuteNum
				FROM
					CUSTMGR_OPPORTUNITIES
				GROUP BY
					OPPNO) l
		ON a.OPPNO = l.OPPNO AND a.OPPTYPE = (SELECT max(OPPTYPE)
											  FROM
												  CUSTMGR_OPPORTUNITIES
											  WHERE
												  CUSTMGR_OPPORTUNITIES.OPPNO = a.OPPNO
										          '+ @condition2+ '
											  GROUP BY
												  OPPNO)
	left outer join chb_pub.dbo.EMPLOYEE m
		ON d.MGREMPNO = m.STAFF
	left outer join chb_pub.dbo.EMPLOYEE n
		ON e.MGREMPNO = n.STAFF

WHERE 1=1' + @condition + ' order by c.CRCNO,a.BRNO,isnull(d.ACCOUNTNAME, e.ACCOUNTNAME) ')" 
			OnSelecting="dsQueryDiary_Selecting">
			<SelectParameters>
				<asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
			    <asp:ControlParameter ControlID="hidn_condition0" Name="condition2" 
                    PropertyName="Value" />
			</SelectParameters>
		</asp:SqlDataSource>
		<strong>
			<asp:HiddenField ID="hidn_EmpNo" runat="server" />
		</strong></span>
	</div>
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
	<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
	<asp:HiddenField ID="hidn_condition" runat="server" />
	<asp:HiddenField ID="hidn_condition0" runat="server" />
	</form>
</body>
</html>

