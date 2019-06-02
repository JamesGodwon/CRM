<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChanceReport.aspx.cs" Inherits="ChanceReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>商機追蹤表</title>
	<link href="Site.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
</head>
<body>
	<form id="form1" runat="server">
	<table border="2" cellpadding="2" cellspacing="2" width="720">
		<td class="style2">
			<img alt="" src="彰銀圖.gif" style="vertical-align: text-align: center" width="50" />
		</td>
		<td colspan="3">
			<span><strong>
				<asp:Label ID="lab_Title" Text="統計查詢→商機追蹤表" runat="server"></asp:Label>
			</strong></span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;
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
			<td>
				<asp:Label ID="Label5" runat="server" Text="請輸入查詢條件" Style="font-weight: 700"></asp:Label>
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<asp:Label ID="Label12" runat="server" Text="建立日期"></asp:Label>
			</td>
			<td>
				<asp:RadioButtonList ID="rbtn_Useful" runat="server" RepeatDirection="Horizontal"
					AutoPostBack="True">
					<asp:ListItem Selected="True" Value="0">本月</asp:ListItem>
					<asp:ListItem Value="1">上月</asp:ListItem>
				</asp:RadioButtonList>
				<asp:Label ID="Label15" runat="server" Text="開始日期"></asp:Label>
				<asp:TextBox ID="txt_VisitDateStart" runat="server"></asp:TextBox>
				<asp:Label ID="Label13" runat="server" Text="結束日期"></asp:Label>
				<asp:TextBox ID="txt_VisitDateEnd" runat="server"></asp:TextBox>
				<asp:Label ID="Label14" runat="server" Text="西元年(YYYYMMDD) 例如：20110101"></asp:Label>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Label ID="Label7" runat="server" Text="商機狀態"></asp:Label>
			</td>
			<td>
				<asp:RadioButtonList ID="rbtn_EndProject" runat="server" RepeatDirection="Horizontal">
					<asp:ListItem Selected="True" Value="0">全部</asp:ListItem>
					<asp:ListItem Value="Y">已結案</asp:ListItem>
					<asp:ListItem Value="N">未結案</asp:ListItem>
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
				<asp:Label ID="Label11" runat="server" Text="母公司統一編號或名稱"></asp:Label>
			</td>
			<td>
				<asp:TextBox ID="txt_SERNOMAIN" runat="server" Width="314px"></asp:TextBox>
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
			<td colspan="2">
				<asp:Button ID="btn_Query" runat="server" Text="查詢" OnClick="btn_Query_Click" />
				<asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
			</td>
		</tr>
	</table>
	<asp:LinkButton ID="LinkBtn_BrnoDetail" runat="server" OnClick="LinkBtn_BrnoDetail_Click">展開分行明細</asp:LinkButton>
	&nbsp;
	<asp:LinkButton ID="LinkBtn_CustDetail" runat="server" OnClick="LinkBtn_CustDetail_Click">展開客戶明細</asp:LinkButton>
	&nbsp;<asp:LinkButton ID="LinkBtn_QueryResultDisplay" runat="server" OnClick="LinkBtn_QueryResultDisplay_Click">回到查詢結果</asp:LinkButton>&nbsp;
	<asp:LinkButton ID="LinkBtn_ReportExport" runat="server" OnClick="LinkBtn_ReportExport_Click">轉excel格式</asp:LinkButton>
	<br />
    <div id="printlist">
	<asp:Label ID="lab_QueryTitle" runat="server" Style="font-weight: 700; color: #0000FF"
		Text="查詢結果"></asp:Label>
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
		BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
		DataSourceID="dsChanceLisMain" EnableModelValidation="True" EmptyDataText="查無客戶名單資料"
		OnDataBound="GridView1_DataBound" onrowcreated="GridView1_RowCreated">
		<Columns>
			<asp:BoundField DataField="CRC" HeaderText="CRC" SortExpression="CRC" />
			<asp:BoundField DataField="分行代號" HeaderText="分行代號" SortExpression="分行代號" />
			<asp:BoundField DataField="分行名稱" HeaderText="分行名稱" SortExpression="分行名稱" />
			<asp:BoundField DataField="登錄員人數" HeaderText="登錄員人數" ReadOnly="True" 
                SortExpression="登錄員人數" />
			<asp:BoundField DataField="客戶數" HeaderText="客戶數" ReadOnly="True" 
                SortExpression="客戶數" />
			<asp:BoundField DataField="存款商機數" HeaderText="存款商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="存款商機數" />
			<asp:BoundField DataField="存款已實現數" HeaderText="存款已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="存款已實現數" />
			<asp:BoundField DataField="授信商機數" HeaderText="授信商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="授信商機數" />
			<asp:BoundField DataField="授信已實現數" HeaderText="授信已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="授信已實現數" />
			<asp:BoundField DataField="外匯商機數" HeaderText="外匯商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="外匯商機數" />
			<asp:BoundField DataField="外匯已實現數" HeaderText="外匯已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="外匯已實現數" />
			<asp:BoundField DataField="衍生性商品商機數" HeaderText="衍生性商品商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="衍生性商品商機數" />
			<asp:BoundField DataField="衍生性商品已實現數" HeaderText="衍生性商品已實現數" NullDisplayText="0"
				ReadOnly="True" SortExpression="衍生性商品已實現數" />
			<asp:BoundField DataField="國內外AR商機數" HeaderText="國內外AR商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="國內外AR商機數" />
			<asp:BoundField DataField="國內外AR已實現數" HeaderText="國內外AR已實現數" NullDisplayText="0"
				ReadOnly="True" SortExpression="國內外AR已實現數" />
			<asp:BoundField DataField="聯貸商機數" HeaderText="聯貸商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="聯貸商機數" />
			<asp:BoundField DataField="聯貸已實現數" HeaderText="聯貸已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="聯貸已實現數" />
			<asp:BoundField DataField="保險商機數" HeaderText="保險商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="保險商機數" />
			<asp:BoundField DataField="保險已實現數" HeaderText="保險已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="保險已實現數" />
			<asp:BoundField DataField="電子業務商機數" HeaderText="電子業務商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="電子業務商機數" />
			<asp:BoundField DataField="電子業務已實現數" HeaderText="電子業務已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="電子業務已實現數" />
			<asp:BoundField DataField="其它商機數" HeaderText="其它商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="其它商機數" />
			<asp:BoundField DataField="其它已實現數" HeaderText="其它已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="其它已實現數" />
			<asp:BoundField DataField="商機數" HeaderText="商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機數" />
			<asp:BoundField DataField="商機已實現數" HeaderText="商機已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已實現數" />
			<asp:BoundField DataField="商機已實現率" HeaderText="商機已實現率" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已實現率" DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="商機已執行數" HeaderText="商機已執行數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已執行數" />
			<asp:BoundField DataField="商機已執行率" HeaderText="商機已執行率" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已執行率" DataFormatString="{0:0.00%}" />
		    <asp:BoundField DataField="已實現商機可增加收益" HeaderText="已實現商機可增加收益" 
                SortExpression="已實現商機可增加收益" />
		</Columns>
		<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
		<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
		<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
		<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
		<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
	<asp:Label ID="lab_BrnoTitle" runat="server" Style="font-weight: 700; color: #0000FF"
		Text="分行明細"></asp:Label>
	<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
		BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
		DataSourceID="dsChanceLisByBrno" EnableModelValidation="True" 
        EmptyDataText="查無分行明細資料" onrowcreated="GridView2_RowCreated">
		<Columns>
			<asp:BoundField DataField="CRC" HeaderText="CRC" SortExpression="CRC" />
			<asp:BoundField DataField="分行代號" HeaderText="分行代號" SortExpression="分行代號" />
			<asp:BoundField DataField="分行名稱" HeaderText="分行名稱" SortExpression="分行名稱" />
			<asp:BoundField DataField="登錄員" HeaderText="登錄員" SortExpression="登錄員" />
			<asp:BoundField DataField="客戶數" HeaderText="客戶數" SortExpression="客戶數" />
			<asp:BoundField DataField="登錄員員編" HeaderText="登錄員員編" SortExpression="登錄員員編" Visible="False" />
			<asp:BoundField DataField="存款商機數" HeaderText="存款商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="存款商機數" />
			<asp:BoundField DataField="存款已實現數" HeaderText="存款已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="存款已實現數" />
			<asp:BoundField DataField="授信商機數" HeaderText="授信商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="授信商機數" />
			<asp:BoundField DataField="授信已實現數" HeaderText="授信已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="授信已實現數" />
			<asp:BoundField DataField="外匯商機數" HeaderText="外匯商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="外匯商機數" />
			<asp:BoundField DataField="外匯已實現數" HeaderText="外匯已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="外匯已實現數" />
			<asp:BoundField DataField="衍生性商品商機數" HeaderText="衍生性商品商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="衍生性商品商機數" />
			<asp:BoundField DataField="衍生性商品已實現數" HeaderText="衍生性商品已實現數" NullDisplayText="0"
				ReadOnly="True" SortExpression="衍生性商品已實現數" />
			<asp:BoundField DataField="國內外AR商機數" HeaderText="國內外AR商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="國內外AR商機數" />
			<asp:BoundField DataField="國內外AR已實現數" HeaderText="國內外AR已實現數" NullDisplayText="0"
				ReadOnly="True" SortExpression="國內外AR已實現數" />
			<asp:BoundField DataField="聯貸商機數" HeaderText="聯貸商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="聯貸商機數" />
			<asp:BoundField DataField="聯貸已實現數" HeaderText="聯貸已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="聯貸已實現數" />
			<asp:BoundField DataField="保險商機數" HeaderText="保險商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="保險商機數" />
			<asp:BoundField DataField="保險已實現數" HeaderText="保險已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="保險已實現數" />
			<asp:BoundField DataField="電子業務商機數" HeaderText="電子業務商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="電子業務商機數" />
			<asp:BoundField DataField="電子業務已實現數" HeaderText="電子業務已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="電子業務已實現數" />
			<asp:BoundField DataField="其它商機數" HeaderText="其它商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="其它商機數" />
			<asp:BoundField DataField="其它已實現數" HeaderText="其它已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="其它已實現數" />
			<asp:BoundField DataField="商機數" HeaderText="商機數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機數" />
			<asp:BoundField DataField="商機已實現數" HeaderText="商機已實現數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已實現數" />
			<asp:BoundField DataField="商機已實現率" HeaderText="商機已實現率" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已實現率" DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="商機已執行數" HeaderText="商機已執行數" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已執行數" />
			<asp:BoundField DataField="商機已執行率" HeaderText="商機已執行率" NullDisplayText="0" ReadOnly="True"
				SortExpression="商機已執行率" DataFormatString="{0:0.00%}" />
		    <asp:BoundField DataField="已實現商機可增加收益" HeaderText="已實現商機可增加收益" 
                SortExpression="已實現商機可增加收益" />
		</Columns>
		<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
		<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
		<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
		<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
		<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
	<asp:Label ID="lab_CustTitle" runat="server" Style="font-weight: 700; color: #0000FF"
		Text="客戶明細"></asp:Label>
	<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
		BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
		DataSourceID="dsChanceLisByCustSerNo" EmptyDataText="查無客戶明細資料" EnableModelValidation="True"
		DataKeyNames="OPPNO" onrowcreated="GridView3_RowCreated">
		<Columns>
			<asp:BoundField DataField="CRC" HeaderText="CRC" SortExpression="CRC" />
			<asp:BoundField DataField="分行代號" HeaderText="分行代號" SortExpression="分行代號" />
			<asp:BoundField DataField="分行名稱" HeaderText="分行名稱" SortExpression="分行名稱" />
			<asp:BoundField DataField="登錄員" HeaderText="登錄員" SortExpression="登錄員" />
			<asp:BoundField DataField="客戶名稱" HeaderText="客戶名稱" ReadOnly="True" SortExpression="客戶名稱" />
			<asp:BoundField DataField="集團名稱" HeaderText="集團名稱" ReadOnly="True" SortExpression="集團名稱" />
			<asp:BoundField DataField="登錄員員編" HeaderText="登錄員員編" SortExpression="登錄員員編" />
			<asp:BoundField DataField="SERNO" HeaderText="SERNO" SortExpression="SERNO" Visible="False" />
			<asp:BoundField DataField="OPPNO" HeaderText="商機單號" ReadOnly="True" SortExpression="OPPNO" />
			<asp:BoundField DataField="存款商機/實現" HeaderText="存款商機/實現" ReadOnly="True" SortExpression="存款商機/實現" />
			<asp:BoundField DataField="授信商機/實現" HeaderText="授信商機/實現" ReadOnly="True" SortExpression="授信商機/實現" />
			<asp:BoundField DataField="外匯商機/實現" HeaderText="外匯商機/實現" ReadOnly="True" SortExpression="外匯商機/實現" />
			<asp:BoundField DataField="衍生性商品商機/實現" HeaderText="衍生性商品商機/實現" ReadOnly="True" SortExpression="衍生性商品商機/實現" />
			<asp:BoundField DataField="國內外AR商機/實現" HeaderText="國內外AR商機/實現" ReadOnly="True" SortExpression="國內外AR商機/實現" />
			<asp:BoundField DataField="聯貸商機/實現" HeaderText="聯貸商機/實現" ReadOnly="True" SortExpression="聯貸商機/實現" />
			<asp:BoundField DataField="保險商機/實現" HeaderText="保險商機/實現" ReadOnly="True" SortExpression="保險商機/實現" />
			<asp:BoundField DataField="電子業務商機/實現" HeaderText="電子業務商機/實現" ReadOnly="True" SortExpression="電子業務商機/實現" />
			<asp:BoundField DataField="其它商機/實現" HeaderText="其它商機/實現" ReadOnly="True" SortExpression="其它商機/實現" />
			<asp:BoundField DataField="商機數" HeaderText="商機數" ReadOnly="True" SortExpression="商機數" />
			<asp:BoundField DataField="商機已實現數" HeaderText="商機已實現數" ReadOnly="True" SortExpression="商機已實現數" />
			<asp:BoundField DataField="商機已實現率" HeaderText="商機已實現率" ReadOnly="True" SortExpression="商機已實現率"
				DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="商機已執行數" HeaderText="商機已執行數" ReadOnly="True" SortExpression="商機已執行數" />
			<asp:BoundField DataField="商機已執行率" HeaderText="商機已執行率" ReadOnly="True" SortExpression="商機已執行率"
				DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="已實現商機可增加收益" HeaderText="已實現商機可增加收益" 
                SortExpression="已實現商機可增加收益" />
			<asp:BoundField DataField="結案" HeaderText="結案" ReadOnly="True" SortExpression="結案" />
		</Columns>
		<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
		<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
		<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
		<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
		<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
	<asp:Label ID="lab_ReportPring" runat="server" Style="font-weight: 700; color: #0000FF"
		Text="轉excel格式"></asp:Label>
	<asp:Button ID="btn_ExcelDownload" runat="server" OnClick="btn_ExcelDownload_Click"
		Text="EXCEL下載" />
	<asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
		BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
		DataSourceID="dsChanceLisReport" EmptyDataText="查無客戶明細資料" EnableModelValidation="True"
		DataKeyNames="OPPNO" OnRowDataBound="GridView4_RowDataBound" 
        onrowcreated="GridView4_RowCreated">
		<Columns>
			<asp:BoundField DataField="CRC" HeaderText="CRC" SortExpression="CRC" />
			<asp:BoundField DataField="分行代號" HeaderText="分行代號" SortExpression="分行代號" />
			<asp:BoundField DataField="分行名稱" HeaderText="分行名稱" SortExpression="分行名稱" />
			<asp:BoundField DataField="登錄員" HeaderText="登錄員" SortExpression="登錄員" />
			<asp:BoundField DataField="客戶統編" HeaderText="客戶統編" SortExpression="客戶統編" />
			<asp:BoundField DataField="客戶名稱" HeaderText="客戶名稱" ReadOnly="True" SortExpression="客戶名稱" />
			<asp:BoundField DataField="客戶類型" HeaderText="客戶類型" ReadOnly="True" SortExpression="客戶類型" />
			<asp:BoundField DataField="集團代號" HeaderText="集團代號" ReadOnly="True" SortExpression="集團代號" />
			<asp:BoundField DataField="集團名稱" HeaderText="集團名稱" ReadOnly="True" SortExpression="集團名稱" />
			<asp:BoundField DataField="總公司統編" HeaderText="總公司統編" ReadOnly="True" SortExpression="總公司統編" />
			<asp:BoundField DataField="總公司名稱" HeaderText="總公司名稱" ReadOnly="True" SortExpression="總公司名稱" />
			<asp:BoundField DataField="登錄員員編" HeaderText="登錄員員編" SortExpression="登錄員員編" />
			<asp:BoundField DataField="SERNO" HeaderText="SERNO" SortExpression="SERNO" Visible="False" />
			<asp:BoundField DataField="OPPNO" HeaderText="商機單號" ReadOnly="True" SortExpression="OPPNO" />
			<asp:BoundField DataField="存款商機/實現" HeaderText="存款商機/實現" ReadOnly="True" SortExpression="存款商機/實現" />
			<asp:BoundField DataField="授信商機/實現" HeaderText="授信商機/實現" ReadOnly="True" SortExpression="授信商機/實現" />
			<asp:BoundField DataField="外匯商機/實現" HeaderText="外匯商機/實現" ReadOnly="True" SortExpression="外匯商機/實現" />
			<asp:BoundField DataField="衍生性商品商機/實現" HeaderText="衍生性商品商機/實現" ReadOnly="True" SortExpression="衍生性商品商機/實現" />
			<asp:BoundField DataField="國內外AR商機/實現" HeaderText="國內外AR商機/實現" ReadOnly="True" SortExpression="國內外AR商機/實現" />
			<asp:BoundField DataField="聯貸商機/實現" HeaderText="聯貸商機/實現" ReadOnly="True" SortExpression="聯貸商機/實現" />
			<asp:BoundField DataField="保險商機/實現" HeaderText="保險商機/實現" ReadOnly="True" SortExpression="保險商機/實現" />
			<asp:BoundField DataField="電子業務商機/實現" HeaderText="電子業務商機/實現" ReadOnly="True" SortExpression="電子業務商機/實現" />
			<asp:BoundField DataField="其它商機/實現" HeaderText="其它商機/實現" ReadOnly="True" SortExpression="其它商機/實現" />
			<asp:BoundField DataField="商機數" HeaderText="商機數" ReadOnly="True" SortExpression="商機數" />
			<asp:BoundField DataField="商機已實現數" HeaderText="商機已實現數" ReadOnly="True" SortExpression="商機已實現數" />
			<asp:BoundField DataField="商機已實現率" HeaderText="商機已實現率" ReadOnly="True" SortExpression="商機已實現率"
				DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="商機已執行數" HeaderText="商機已執行數" ReadOnly="True" SortExpression="商機已執行數" />
			<asp:BoundField DataField="商機已執行率" HeaderText="商機已執行率" ReadOnly="True" SortExpression="商機已執行率"
				DataFormatString="{0:0.00%}" />
			<asp:BoundField DataField="已實現商機可增加收益" HeaderText="已實現商機可增加收益" 
                SortExpression="已實現商機可增加收益" />
			<asp:BoundField DataField="結案" HeaderText="結案" ReadOnly="True" SortExpression="結案" />
		</Columns>
		<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
		<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
		<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
		<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
		<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
	</asp:GridView>
    </div>
	<asp:SqlDataSource ID="dsChanceLisByBrno" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
		SelectCommand="EXEC ('SELECT f.CRCNO AS [CRC]
	 , e.BRNAME AS [分行名稱]	 
	 , g.NAME AS [登錄員]	 
	 , d.*
	 , isnull(y.INCOME,0) as [已實現商機可增加收益]
	 , x.TOTALCUSTSUM as [客戶數]
FROM
	(SELECT BRNO AS [分行代號]
		  , EDITEMPNO as [登錄員員編]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					TotalOppNum
			END) AS [存款商機數]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					ExecuteNum
			END) AS [存款已實現數]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [存款實現率]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					TotalOppNum
			END) AS [授信商機數]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					ExecuteNum
			END) AS [授信已實現數]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [授信實現率]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					TotalOppNum
			END) AS [外匯商機數]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					ExecuteNum
			END) AS [外匯已實現數]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [外匯實現率]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					TotalOppNum
			END) AS [衍生性商品商機數]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					ExecuteNum
			END) AS [衍生性商品已實現數]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [衍生性商品實現率]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					TotalOppNum
			END) AS [國內外AR商機數]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					ExecuteNum
			END) AS [國內外AR已實現數]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [國內外AR實現率]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					TotalOppNum
			END) AS [聯貸商機數]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					ExecuteNum
			END) AS [聯貸已實現數]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [聯貸實現率]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					TotalOppNum
			END) AS [保險商機數]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					ExecuteNum
			END) AS [保險已實現數]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [保險實現率]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					TotalOppNum
			END) AS [電子業務商機數]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					ExecuteNum
			END) AS [電子業務已實現數]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [電子業務實現率]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					TotalOppNum
			END) AS [其它商機數]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					ExecuteNum
			END) AS [其它已實現數]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [其它實現率]
		  , sum(TotalOppNum) AS [商機數]
		  , sum(ExecuteNum) AS [商機已執行數]
		  , cast(sum(ExecuteNum) AS FLOAT) / cast(sum(TotalOppNum) AS FLOAT) AS [商機已執行率]
		  , sum(ImplementNum) AS [商機已實現數]
		  , cast(sum(ImplementNum) AS FLOAT) / cast(sum(TotalOppNum) AS FLOAT) AS [商機已實現率]
	 FROM
		 (SELECT a.BRNO
			   , a.OPPTYPE
			   , a.EDITEMPNO			   
			   , count(1) AS TotalOppNum
			   , sum(isnumeric(a.EXRESULT)) AS ExecuteNum
			   , sum(isnull(a.EXRESULT, 0)) AS ImplementNum
		  FROM
			  CUSTMGR_OPPORTUNITIES a
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO	  
			  where 1=1 '+ @condition +'
		  GROUP BY
			  a.BRNO
			, a.OPPTYPE
			, a.EDITEMPNO) q
	 GROUP BY
		 BRNO,EDITEMPNO) d
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.分行代號 = e.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br f
		ON d.分行代號 = f.BRNO	
    LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE g
		ON d.登錄員員編 = g.STAFF	
	LEFT OUTER JOIN (
	SELECT a.BRNO , a.EDITEMPNO,sum(d.INCOME) as INCOME 		 
		  FROM
			  CUSTMGR_OPPORTUNITIESMEMO d	
			  LEFT OUTER join CUSTMGR_OPPORTUNITIES a
				  ON d.OPPNO = a.OPPNO AND a.OPPTYPE =(SELECT min(OPPTYPE)
				  from CUSTMGR_OPPORTUNITIES WHERE CUSTMGR_OPPORTUNITIES.OPPNO=d.OPPNO)
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO		      
			  where 1=1 '+ @condition +'
			  GROUP BY a.BRNO,a.EDITEMPNO)y	
		on 	d.分行代號 = y.BRNO AND d.登錄員員編=y.EDITEMPNO	
   LEFT OUTER JOIN (
   SELECT a.BRNO , a.EDITEMPNO,count(DISTINCT a.SERNO) as TOTALCUSTSUM
		  FROM
			   CUSTMGR_OPPORTUNITIES a				 				 
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO		      
			  where 1=1 '+ @condition +' 
			  GROUP BY a.BRNO,a.EDITEMPNO)x	
		on 	d.分行代號 = x.BRNO AND d.登錄員員編=x.EDITEMPNO		
ORDER BY
	CRC
  , 分行代號')" OnSelecting="dsChanceLisByBrno_Selecting">
		<SelectParameters>
			<asp:ControlParameter ControlID="hidn_condition0" Name="condition" PropertyName="Value" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:HiddenField ID="hidn_BrnoList" runat="server" />
	<asp:SqlDataSource ID="dsChanceLisByCustSerNo" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
		SelectCommand="EXEC ('SELECT f.CRCNO AS [CRC]
	 , e.BRNAME AS [分行名稱]	 
	 , g.NAME AS [登錄員]
	 , isnull(h.ACCOUNTNAME,i.ACCOUNTNAME) as [客戶名稱]
	 , isnull(h.GROUPNAME,i.GROUPNAME) as [集團名稱]
	 , d.*
	 , isnull(y.INCOME,0) as [已實現商機可增加收益]
FROM
	(SELECT BRNO AS [分行代號]
		  , EDITEMPNO as [登錄員員編]		  
		  , SERNO
		  , OPPNO
		  , cast(max(CASE WHEN OPPTYPE =1 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE =1 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE =1 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [存款商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 2 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 2 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 2 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [授信商機/實現]						 
		  , cast(max(CASE WHEN OPPTYPE = 3 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 3 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 3 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [外匯商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 4 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 4 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 4 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [衍生性商品商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 5 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 5 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 5 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [國內外AR商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 6 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 6 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 6 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [聯貸商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 7 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 7 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 7 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [保險商機/實現]						 						 						 											 
          , cast(max(CASE WHEN OPPTYPE = 8 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 8 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 8 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [電子業務商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 9 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 9 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 9 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [其它商機/實現]						 
          , count(1) AS [商機數]						       
          , sum(isnumeric(EXRESULT))as [商機已執行數]
          , cast(sum(isnumeric(EXRESULT)) AS FLOAT) / cast(count(1) AS FLOAT) AS [商機已執行率]
          , sum(isnull(EXRESULT, 0)) as [商機已實現數]          
          , cast(sum(isnull(EXRESULT, 0)) AS FLOAT) / cast(count(1) AS FLOAT) AS [商機已實現率]
          , max(ENDPROJECT) as [結案]
	 FROM
		 (SELECT a.OPPNO
			   , a.BRNO
			   , a.SERNO
			   , a.OPPTYPE
			   , a.EDITEMPNO			   
			   , a.EXRESULT
			   , a.ENDPROJECT
		  FROM
			  CUSTMGR_OPPORTUNITIES a
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO
			  where 1=1 '+ @condition +'
		   ) q
	 GROUP BY
		 BRNO,EDITEMPNO,OPPNO,SERNO	 
	 ) d	 
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.分行代號 = e.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br f
		ON d.分行代號 = f.BRNO	
    LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE g
		ON d.登錄員員編 = g.STAFF			
	LEFT OUTER JOIN	CUSTMGR_CUSTLIST h
		ON d.分行代號 = h.BRNO AND d.SERNO = h.SERNO	
	LEFT OUTER JOIN	CUSTMGR_CUSTLIST_PASS i
		ON d.分行代號 = i.BRNO AND d.SERNO = i.SERNO
	LEFT OUTER JOIN CUSTMGR_OPPORTUNITIESMEMO y
		ON d.OPPNO = y.OPPNO
ORDER BY
	CRC
  , 分行代號
  , d.SERNO
  , d.OPPNO')" OnSelecting="dsChanceLisByCustSerNo_Selecting">
		<SelectParameters>
			<asp:ControlParameter ControlID="hidn_condition1" Name="condition" PropertyName="Value" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="dsChanceLisMain" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
		SelectCommand="EXEC ('SELECT f.CRCNO AS [CRC]
	 , e.BRNAME AS [分行名稱]
	 , g.TotalCust AS [客戶數]
	 , h.TotalMgr AS [登錄員人數]
	 , d.*
	 , isnull(y.INCOME,0) as [已實現商機可增加收益]
FROM
	(SELECT BRNO AS [分行代號]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					TotalOppNum
			END) AS [存款商機數]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					ExecuteNum
			END) AS [存款已實現數]
		  , max(CASE
				WHEN OPPTYPE = 1 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [存款實現率]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					TotalOppNum
			END) AS [授信商機數]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					ExecuteNum
			END) AS [授信已實現數]
		  , max(CASE
				WHEN OPPTYPE = 2 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [授信實現率]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					TotalOppNum
			END) AS [外匯商機數]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					ExecuteNum
			END) AS [外匯已實現數]
		  , max(CASE
				WHEN OPPTYPE = 3 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [外匯實現率]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					TotalOppNum
			END) AS [衍生性商品商機數]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					ExecuteNum
			END) AS [衍生性商品已實現數]
		  , max(CASE
				WHEN OPPTYPE = 4 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [衍生性商品實現率]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					TotalOppNum
			END) AS [國內外AR商機數]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					ExecuteNum
			END) AS [國內外AR已實現數]
		  , max(CASE
				WHEN OPPTYPE = 5 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [國內外AR實現率]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					TotalOppNum
			END) AS [聯貸商機數]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					ExecuteNum
			END) AS [聯貸已實現數]
		  , max(CASE
				WHEN OPPTYPE = 6 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [聯貸實現率]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					TotalOppNum
			END) AS [保險商機數]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					ExecuteNum
			END) AS [保險已實現數]
		  , max(CASE
				WHEN OPPTYPE = 7 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [保險實現率]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					TotalOppNum
			END) AS [電子業務商機數]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					ExecuteNum
			END) AS [電子業務已實現數]
		  , max(CASE
				WHEN OPPTYPE = 8 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [電子業務實現率]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					TotalOppNum
			END) AS [其它商機數]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					ExecuteNum
			END) AS [其它已實現數]
		  , max(CASE
				WHEN OPPTYPE = 9 THEN
					cast(ExecuteNum AS FLOAT) / cast(TotalOppNum AS FLOAT)
			END) AS [其它實現率]
		  , sum(TotalOppNum) AS [商機數]
		  , sum(ExecuteNum) AS [商機已執行數]
		  , cast(sum(ExecuteNum) AS FLOAT) / cast(sum(TotalOppNum) AS FLOAT) AS [商機已執行率]
		  , sum(ImplementNum) AS [商機已實現數]
		  , cast(sum(ImplementNum) AS FLOAT) / cast(sum(TotalOppNum) AS FLOAT) AS [商機已實現率]
	 FROM
		 (SELECT a.BRNO
			   , a.OPPTYPE
			   , count(1) AS TotalOppNum
			   , sum(isnumeric(a.EXRESULT)) AS ExecuteNum
			   , sum(isnull(a.EXRESULT, 0)) AS ImplementNum
		  FROM
			  CUSTMGR_OPPORTUNITIES a
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO
			  where 1=1 '+ @condition +'
		  GROUP BY
			  a.BRNO
			, a.OPPTYPE) q
	 GROUP BY
		 BRNO) d
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.分行代號 = e.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br f
		ON d.分行代號 = f.BRNO
	LEFT OUTER JOIN (
	SELECT a.BRNO , count(distinct a.SERNO) as TotalCust		 
		  FROM CUSTMGR_OPPORTUNITIES a			
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO		      
			  where 1=1 '+ @condition +'
			  GROUP BY a.BRNO) g
		ON d.分行代號 = g.BRNO
	LEFT OUTER JOIN (
	SELECT a.BRNO , count(distinct EDITEMPNO) as TotalMgr		 
		  FROM CUSTMGR_OPPORTUNITIES a			
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO		      
			  where 1=1 '+ @condition +'
			  GROUP BY a.BRNO ) h
		ON d.分行代號 = h.BRNO
	LEFT OUTER JOIN (
	SELECT a.BRNO ,sum(d.INCOME) as INCOME		 
		  FROM
			  CUSTMGR_OPPORTUNITIESMEMO d	
			  LEFT OUTER join CUSTMGR_OPPORTUNITIES a
				  ON d.OPPNO = a.OPPNO AND a.OPPTYPE =(SELECT min(OPPTYPE)
				  from CUSTMGR_OPPORTUNITIES WHERE CUSTMGR_OPPORTUNITIES.OPPNO=d.OPPNO)
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO		      
			  where 1=1 '+ @condition +'
			  GROUP BY a.BRNO )	y
         ON d.分行代號 =y.BRNO			  	
ORDER BY
	CRC
  , 分行代號')" OnSelecting="dsCustLisMain_Selecting">
		<SelectParameters>
			<asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
		</SelectParameters>
	</asp:SqlDataSource>
	<strong>
		<asp:HiddenField ID="hidn_EmpNo" runat="server" />
	</strong>
	<asp:HiddenField ID="hidn_condition" runat="server" />
	<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
	<asp:SqlDataSource ID="dsChanceLisReport" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
		SelectCommand="EXEC ('SELECT f.CRCNO AS [CRC]
	 , e.BRNAME AS [分行名稱]	 
	 , g.NAME AS [登錄員]
	 , d.SERNO as [客戶統編]
	 , isnull(h.ACCOUNTNAME,i.ACCOUNTNAME) as [客戶名稱]
	 , isnull(j.COLDESC,k.COLDESC) as [客戶類型]
	 , isnull(h.GROUPNO,i.GROUPNO) as [集團代號]
	 , isnull(h.GROUPNAME,i.GROUPNAME) as [集團名稱]
	 , isnull(h.ENTSERNOMAJOR,i.ENTSERNOMAJOR) as [總公司統編]
	 , isnull(h.ENTNAMEMAJOR,i.ENTNAMEMAJOR) as [總公司名稱]
	 , d.*
	 , isnull(y.INCOME,0) as [已實現商機可增加收益]
FROM
	(SELECT BRNO AS [分行代號]
		  , EDITEMPNO as [登錄員員編]		  
		  , SERNO 
		  , OPPNO
		  , cast(max(CASE WHEN OPPTYPE =1 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE =1 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE =1 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [存款商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 2 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 2 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 2 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [授信商機/實現]						 
		  , cast(max(CASE WHEN OPPTYPE = 3 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 3 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 3 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [外匯商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 4 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 4 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 4 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [衍生性商品商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 5 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 5 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 5 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [國內外AR商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 6 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 6 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 6 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [聯貸商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 7 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 7 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 7 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [保險商機/實現]						 						 						 											 
          , cast(max(CASE WHEN OPPTYPE = 8 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 8 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 8 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [電子業務商機/實現]
		  , cast(max(CASE WHEN OPPTYPE = 9 THEN 1 ELSE 0 END) AS VARCHAR)+''/''+
		    cast(max(CASE WHEN OPPTYPE = 9 and EXRESULT =1
						 THEN ''Y'' 
						 WHEN OPPTYPE = 9 and EXRESULT =0
						 THEN ''N''
						 ELSE '''' END) AS VARCHAR)as [其它商機/實現]						 
          , count(1) AS [商機數]						       
          , sum(isnumeric(EXRESULT))as [商機已執行數]
          , cast(sum(isnumeric(EXRESULT)) AS FLOAT) / cast(count(1) AS FLOAT) AS [商機已執行率]
          , sum(isnull(EXRESULT, 0)) as [商機已實現數]          
          , cast(sum(isnull(EXRESULT, 0)) AS FLOAT) / cast(count(1) AS FLOAT) AS [商機已實現率]
          , max(ENDPROJECT) as [結案]
	 FROM
		 (SELECT a.OPPNO
			   , a.BRNO
			   , a.SERNO
			   , a.OPPTYPE
			   , a.EDITEMPNO			   
			   , a.EXRESULT
			   , a.ENDPROJECT
		  FROM
			  CUSTMGR_OPPORTUNITIES a
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST b
				  ON a.SERNO = b.SERNO AND a.BRNO = b.BRNO
			  LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
				  ON a.SERNO = c.SERNO AND a.BRNO = b.BRNO					  
			  LEFT OUTER JOIN (SELECT OPPNO
						  , min(RECORDDATE) AS STARTDATE
					 FROM
						 CUSTMGR_OPPORTUNITIES
					 GROUP BY
						 OPPNO) z
		          ON a.OPPNO = z.OPPNO
			  where 1=1  ' + @condition + '
		   ) q
	 GROUP BY
		 BRNO,EDITEMPNO,OPPNO,SERNO	 
	 ) d	 
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.分行代號 = e.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br f
		ON d.分行代號 = f.BRNO	
    LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE g
		ON d.登錄員員編 = g.STAFF			
	LEFT OUTER JOIN	CUSTMGR_CUSTLIST h
		ON d.分行代號 = h.BRNO AND d.SERNO = h.SERNO	
	LEFT OUTER JOIN	CUSTMGR_CUSTLIST_PASS i
		ON d.分行代號 = i.BRNO AND d.SERNO = i.SERNO
	LEFT OUTER JOIN CUSTMGR_OPTION j
		on h.CUSTTYPE = j.COLVALUE AND j.DBCOLUMN=''CUSTTYPE''		
	LEFT OUTER JOIN CUSTMGR_OPTION k
		on i.CUSTTYPE = k.COLVALUE AND k.DBCOLUMN=''CUSTTYPE''		
	LEFT OUTER JOIN CUSTMGR_OPPORTUNITIESMEMO y
		ON d.OPPNO = y.OPPNO
ORDER BY
	CRC
  , 分行代號
  , d.SERNO
  , d.OPPNO')" OnSelecting="dsCustLisMain_Selecting">
		<SelectParameters>
			<asp:ControlParameter ControlID="hidn_condition2" Name="condition" PropertyName="Value" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:HiddenField ID="hidn_condition0" runat="server" />
	<asp:HiddenField ID="hidn_condition1" runat="server" />
	<asp:HiddenField ID="hidn_condition2" runat="server" />
	</form>
</body>
</html>
