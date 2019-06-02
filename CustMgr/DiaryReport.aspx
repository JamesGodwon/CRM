<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiaryReport.aspx.cs"
    Inherits="DiaryReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>拜訪日誌統計查詢</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
</head>
<body>
    <form id="form1" runat="server">                    
            <table border="2" cellpadding="2" cellspacing="2" width="720">
                <td class="style2">
                    <img alt=""  src="彰銀圖.gif" style="vertical-align: text-align: center" 
                        width="50" />
                </td>
                <td colspan=3>
                    <span><strong>
                    <asp:Label
                ID="lab_Title" Text="統計查詢→拜訪日誌" runat="server"></asp:Label> </strong>
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;
					<input id="btnPrint" type="button" value="列印" 
				onclick="printScreen(printlist)"/>
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
		 
				&nbsp;</td>
			</tr>
		<tr>
			<td>
					<asp:Label ID="Label12" runat="server" Text="拜訪日期"></asp:Label>
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
					<asp:Label ID="Label14" runat="server" Text="西元年(YYYYMMDD) 例如：20110101"></asp:Label></td>
			
		</tr>	
		<tr>
			<td>
	<asp:Label ID="Label3" runat="server" Text="統一編號或名稱"></asp:Label>
			</td>
			<td>
	<asp:TextBox ID="txt_SERNO" runat="server" Width="314px" 
					></asp:TextBox>
			</td>
			
		</tr>
		<tr>
			<td>
	<asp:Label ID="Label11" runat="server" Text="母公司統一編號或名稱"></asp:Label>
			</td>
			<td>
		 
	<asp:TextBox ID="txt_SERNOMAIN" runat="server" Width="314px" 
					></asp:TextBox>
		 
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
		 
				<asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" 
					DataTextField="BRNAME" DataValueField="BRNO" Width="200px" Visible="False" 
                    AutoPostBack="True" onselectedindexchanged="drList_Crc_SelectedIndexChanged">
				</asp:DropDownList>
				<asp:SqlDataSource ID="dsCRC" runat="server" 
					ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
					
					
					
                    SelectCommand="SELECT '請選擇' AS BRNAME, '-1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM crc_rel_br)) ORDER BY BRNO">
				</asp:SqlDataSource>
		 
		</tr>
		<tr>
			<td>
	<asp:Label ID="Label4" runat="server" Text="分行代號"></asp:Label>
			</td>
			<td>
		 
				<asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" 
					DataTextField="BRNAME" DataValueField="BRNO" Width="200px" 
					AutoPostBack="True">
				</asp:DropDownList>
				<asp:SqlDataSource ID="dsBrno" runat="server" 
					ConnectionString="<%$ ConnectionStrings:chb_pub1 %>" 
					
					
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
						<asp:ControlParameter ControlID="hidn_conditionBrno" Name="condition" 
							PropertyName="Value" />
					</SelectParameters>
				</asp:SqlDataSource>
		 
		</tr>
		 
		<tr>
			<td>
	<asp:Label ID="Label7" runat="server" Text="登錄員"></asp:Label>
			</td>
			<td>
		 
				<asp:DropDownList ID="drList_MgrId" runat="server" DataSourceID="dsMgrEmpNo" 
					DataTextField="NAME" DataValueField="STAFF" Width="200px">
				</asp:DropDownList>
				<asp:SqlDataSource ID="dsMgrEmpNo" runat="server" 
					ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
					
					
					
					
                    SelectCommand="SELECT '請選擇' AS NAME, '-1' AS STAFF UNION SELECT a.EDITEMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_DIARY AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.EDITEMPNO = b.STAFF WHERE (a.BRNO = @brno) ORDER BY STAFF">
					<SelectParameters>
						<asp:ControlParameter ControlID="drList_Brno" Name="brno" 
							PropertyName="SelectedValue" />
					</SelectParameters>
				</asp:SqlDataSource>
		 
				<asp:Label ID="Label10" runat="server" style="font-weight: 700; color: #0000FF" 
					Text="查詢分行代號該分行的登錄員"></asp:Label>
		 
		</tr>
		  <tr>
		  <td colspan=2>
			  <asp:Button ID="btn_Query" runat="server" Text="查詢" 
                  onclick="btn_Query_Click"  />
	<asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
		  </td>
		  </tr>      		
	</table>      
        <asp:LinkButton ID="LinkBtn_BrnoDetail" runat="server" 
                onclick="LinkBtn_BrnoDetail_Click">展開分行明細</asp:LinkButton> &nbsp;
        <asp:LinkButton ID="LinkBtn_CustDetail" runat="server" 
                onclick="LinkBtn_CustDetail_Click">展開客戶明細</asp:LinkButton>
    &nbsp;<asp:LinkButton ID="LinkBtn_ByParner" runat="server" onclick="LinkBtn_ByParner_Click" 
                >陪同人員次數統計</asp:LinkButton>
       
      &nbsp;<asp:LinkButton ID="LinkBtn_QueryResultDisplay" runat="server" 
                onclick="LinkBtn_QueryResultDisplay_Click">回到查詢結果</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkBtn_ReportExport" runat="server" onclick="LinkBtn_ReportExport_Click" 
                >轉excel格式</asp:LinkButton>
       
      <br />      
      <div id="printlist">
    <asp:Label ID="lab_QueryTitle" runat="server" 
        style="font-weight: 700; color: #0000FF" Text="查詢結果"></asp:Label>    
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="BRNO" 
                DataSourceID="dsDiaryLisMain" EnableModelValidation="True" 
                EmptyDataText="查無客戶名單資料" ondatabound="GridView1_DataBound">
                <Columns>
                    <asp:BoundField DataField="CRCNAME" HeaderText="CRC" SortExpression="CRCNAME" />
                    <asp:TemplateField HeaderText="分行代號" SortExpression="BRNO">
                        <ItemTemplate>
                            <asp:Label ID="lab_Brno" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BRNO") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" 
                        SortExpression="BRNAME" />
                    <asp:BoundField DataField="TOTALEDITEMPNO" HeaderText="登錄員人數" 
                        SortExpression="TOTALEDITEMPNO" />
                    <asp:BoundField DataField="TOTALCUSTSUM" HeaderText="客戶數" ReadOnly="True" 
                        SortExpression="TOTALCUSTSUM" />
                    <asp:BoundField DataField="TOTALPHONE" HeaderText="電訪次數" ReadOnly="True" 
                        SortExpression="TOTALPHONE" />
                    <asp:BoundField DataField="TOTALPERSON" HeaderText="親訪次數" ReadOnly="True" 
                        SortExpression="TOTALPERSON" />
                    <asp:BoundField DataField="TOTALCUST" HeaderText="總次數" ReadOnly="True" 
                        SortExpression="TOTALCUST" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
    <asp:Label ID="lab_BrnoTitle" runat="server" 
        style="font-weight: 700; color: #0000FF" Text="分行明細"></asp:Label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="BRNO" 
                DataSourceID="dsDiaryLisByBrno" EnableModelValidation="True" 
                EmptyDataText="查無分行明細資料">
                <Columns>
                    <asp:BoundField DataField="CRCNAME" HeaderText="CRC" SortExpression="CRCNAME" />
                    <asp:BoundField DataField="BRNO" HeaderText="分行代號" ReadOnly="True" 
                        SortExpression="BRNO" />
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
                    <asp:BoundField DataField="NAME" HeaderText="登錄員" SortExpression="NAME" />
                    <asp:BoundField DataField="POSITION" HeaderText="職務名稱" 
                        SortExpression="POSITION" />
                    <asp:BoundField DataField="TOTALCUSTSUM" HeaderText="客戶數" 
                        SortExpression="TOTALCUSTSUM" />
                    <asp:BoundField DataField="TOTALPHONE" HeaderText="電訪次數" ReadOnly="True" 
                        SortExpression="TOTALPHONE" />
                    <asp:BoundField DataField="TOTALPERSON" HeaderText="親訪次數" ReadOnly="True" 
                        SortExpression="TOTALPERSON" />
                    <asp:BoundField DataField="TOTALCUST" HeaderText="總次數" ReadOnly="True" 
                        SortExpression="TOTALCUST" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
             <asp:Label ID="lab_CustTitle" runat="server" 
        style="font-weight: 700; color: #0000FF" Text="客戶明細"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" 
        DataSourceID="dsDiaryLisByCustSerNo" EmptyDataText="查無客戶明細資料" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="CRCNAME" HeaderText="CRC" SortExpression="CRCNAME" />
            <asp:BoundField DataField="BRNO" HeaderText="分行代號" SortExpression="BRNO" />
            <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
            <asp:BoundField DataField="NAME" HeaderText="登錄員" SortExpression="NAME" />
            <asp:BoundField DataField="POSITION" HeaderText="職務名稱" 
                SortExpression="POSITION" />
            <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" ReadOnly="True" 
                SortExpression="ACCOUNTNAME" />
            <asp:BoundField DataField="ENTSIZE" HeaderText="企業規模" ReadOnly="True" 
                SortExpression="ENTSIZE" />
            <asp:BoundField DataField="CUSTTYPE" HeaderText="客戶類型" ReadOnly="True" 
                SortExpression="CUSTTYPE" />
            <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                SortExpression="GROUPNAME" />
            <asp:BoundField DataField="VISITDATE" HeaderText="拜訪日期" 
                SortExpression="VISITDATE" />
            <asp:BoundField DataField="RECORDDATE" HeaderText="登錄日期" 
                SortExpression="RECORDDATE" />
            <asp:BoundField DataField="VISITTYPE" HeaderText="電訪/親訪" 
                SortExpression="VISITTYPE" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
             <asp:Label ID="lab_ReportPring" runat="server" 
                style="font-weight: 700; color: #0000FF" Text="轉excel格式"></asp:Label>
            <asp:Button ID="btn_ExcelDownload" runat="server" 
                onclick="btn_ExcelDownload_Click" Text="EXCEL下載" />
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" 
        DataSourceID="dsDiaryLisReport" EmptyDataText="查無客戶明細資料" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="CRCNAME" HeaderText="CRC" SortExpression="CRCNAME" />
            <asp:BoundField DataField="BRNO" HeaderText="分行代號" SortExpression="BRNO" />
            <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
            <asp:BoundField DataField="NAME" HeaderText="登錄員" SortExpression="NAME" />
            <asp:BoundField DataField="POSITION" HeaderText="職務名稱" 
                SortExpression="POSITION" />
            <asp:BoundField DataField="SERNO" HeaderText="統一編號" SortExpression="SERNO" />
            <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" ReadOnly="True" 
                SortExpression="ACCOUNTNAME" />
            <asp:BoundField DataField="ENTSIZE" HeaderText="企業規模" ReadOnly="True" 
                SortExpression="ENTSIZE" />
            <asp:BoundField DataField="CUSTTYPE" HeaderText="客戶類型" ReadOnly="True" 
                SortExpression="CUSTTYPE" />
            <asp:BoundField DataField="GROUPNO" HeaderText="集團代號" 
                SortExpression="GROUPNO" />
            <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                SortExpression="GROUPNAME" />
            <asp:BoundField DataField="ENTSERNOMAJOR" HeaderText="總公司統編" 
                SortExpression="ENTSERNOMAJOR" />
            <asp:BoundField DataField="ENTNAMEMAJOR" HeaderText="總公司名稱" 
                SortExpression="ENTNAMEMAJOR" />
            <asp:BoundField DataField="VISITDATE" HeaderText="拜訪日期" 
                SortExpression="VISITDATE" />
            <asp:BoundField DataField="RECORDDATE" HeaderText="登錄日期" 
                SortExpression="RECORDDATE" />
            <asp:BoundField DataField="VISITTYPE" HeaderText="電訪/親訪" 
                SortExpression="VISITTYPE" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
            Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    </div>
             <asp:Label ID="lab_ByParner" runat="server" 
                style="font-weight: 700; color: #0000FF" Text="陪同人員次數"></asp:Label>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" DataKeyNames="BRNO" 
                DataSourceID="dsDiaryListByParner" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="CRCNAME" HeaderText="CRC" 
                        SortExpression="CRCNAME" />
                    <asp:BoundField DataField="BRNO" HeaderText="分行代號" ReadOnly="True" 
                        SortExpression="BRNO" />
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
                    <asp:BoundField DataField="NAME" HeaderText="分行陪同人員姓名" SortExpression="NAME" />
                    <asp:BoundField DataField="TOTALCUSTSUM" HeaderText="客戶數" ReadOnly="True" 
                        SortExpression="TOTALCUSTSUM" />
                    <asp:BoundField DataField="TOTALPHONE" HeaderText="電訪次數" ReadOnly="True" 
                        SortExpression="TOTALPHONE" />
                    <asp:BoundField DataField="TOTALPERSON" HeaderText="親訪次數" ReadOnly="True" 
                        SortExpression="TOTALPERSON" />
                    <asp:BoundField DataField="TOTALCUST" HeaderText="總次數" ReadOnly="True" 
                        SortExpression="TOTALCUST" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                    Wrap="False" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsDiaryListByParner" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" SelectCommand="EXEC ('SELECT  CRCNAME
	 , BRNO
	 , BRNAME		 
	 , NAME
	 , count(DISTINCT SERNO) as TOTALCUSTSUM
	 , sum(PHONECALL) AS TOTALPHONE
	 , sum(PERSONCALL) AS TOTALPERSON
	 , sum(1) AS TOTALCUST
	 
FROM
	(SELECT e.BRNAME AS CRCNAME
		  , a.BRNO
		  , a.SERNO
		  , d.CRCNO
		  , c.BRNAME	
		  , aa.BRNOMEMBER	
		  ,	o.NAME	    		  		  
		  , CASE
				WHEN a.VISITTYPE = 1 THEN
					1
				ELSE
					0
			END AS PHONECALL
		  , CASE
				WHEN a.VISITTYPE = 2 THEN
					1
				ELSE
					0
			END AS PERSONCALL
	 FROM
		 (
		 SELECT isnull(BRNOMEMBER1,''0'') as BRNOMEMBER,BRNO from CUSTMGR_DIARY
UNION
SELECT isnull(BRNOMEMBER2,''0'') as BRNOMEMBER,BRNO from CUSTMGR_DIARY
UNION
SELECT isnull(BRNOMEMBER3,''0'') as BRNOMEMBER,BRNO from CUSTMGR_DIARY
union	
SELECT isnull(BRNOMEMBER4,''0'') as BRNOMEMBER,BRNO from CUSTMGR_DIARY 
		 ) aa
		 INNER JOIN CUSTMGR_DIARY a		 
		 ON aa.BRNO = a.BRNO AND (aa.BRNOMEMBER = a.BRNOMEMBER1 OR aa.BRNOMEMBER = a.BRNOMEMBER2 OR
		 aa.BRNOMEMBER = a.BRNOMEMBER3 OR aa.BRNOMEMBER = a.BRNOMEMBER4)AND aa.BRNOMEMBER&lt;&gt;0
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH c
			 ON a.BRNO = c.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
			 ON a.BRNO = d.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH e
			 ON d.CRCNO = e.BRNO
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST f
			 ON a.SERNO = f.SERNO AND a.BRNO = f.BRNO
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS g
			 ON a.SERNO = g.SERNO AND a.BRNO = g.BRNO
		 LEFT OUTER JOIN CUSTMGR_GROUP m
			 ON f.ENTSERNOMAIN = m.ENTSERNOMAIN
		 LEFT OUTER JOIN CUSTMGR_GROUP n
			 ON g.ENTSERNOMAIN = n.ENTSERNOMAIN	 			
		 LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE o
			 ON aa.BRNOMEMBER = o.STAFF 
	 WHERE
		 1 = 1 ' + @condition + ' ) h
	 			 
GROUP BY
	CRCNO
  , CRCNAME
  , BRNO
  , BRNAME 
  , BRNOMEMBER
  , NAME
ORDER BY
	CRCNO
  , BRNO')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition3" Name="condition" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="dsDiaryLisByBrno" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT CRCNO
	 , CRCNAME
	 , BRNO
	 , BRNAME
	 , NAME
	 , POSITION
	 , sum(PHONECALL) AS TOTALPHONE
	 , sum(PERSONCALL) AS TOTALPERSON
	 , sum(1) AS TOTALCUST
	 , count(DISTINCT SERNO) as TOTALCUSTSUM
FROM
	(SELECT d.CRCNO
		  , e.BRNAME AS CRCNAME
		  , a.BRNO
		  , c.BRNAME
		  , b.NAME
		  , h.COLDESC as POSITION
		  , a.SERNO
		  , CASE
				WHEN a.VISITTYPE = 1 THEN
					1
				ELSE
					0
			END AS PHONECALL
		  , CASE
				WHEN a.VISITTYPE = 2 THEN
					1
				ELSE
					0
			END AS PERSONCALL


	 FROM
		 CUSTMGR_DIARY a
		 LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE b
			 ON a.EDITEMPNO = b.STAFF
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH c
			 ON a.BRNO = c.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
			 ON a.BRNO = d.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH e
			 ON d.CRCNO = e.BRNO		 
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST f
			 ON a.BRNO = f.BRNO AND a.SERNO = f.SERNO
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS g
			 ON a.BRNO = g.BRNO AND a.SERNO = g.SERNO
		 LEFT OUTER JOIN CUSTMGR_OPTION h
			 ON a.EDITPOSTION = h.COLVALUE AND h.DBCOLUMN = ''POSITION''
	     LEFT OUTER JOIN CUSTMGR_GROUP m
			 ON f.ENTSERNOMAIN = m.ENTSERNOMAIN
		 LEFT OUTER JOIN CUSTMGR_GROUP n
			 ON g.ENTSERNOMAIN = n.ENTSERNOMAIN
	 WHERE
		 1=1 ' + @condition + ' ) i
GROUP BY
	CRCNO
  , CRCNAME
  , BRNO
  , BRNAME
  , NAME
  , POSITION
ORDER BY
	CRCNO
  , BRNO')" 
        onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition0" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <asp:HiddenField ID="hidn_BrnoList" runat="server" />
             <asp:SqlDataSource ID="dsDiaryLisByCustSerNo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT e.BRNAME AS CRCNAME
	 , a.BRNO
	 , c.BRNAME
	 , b.NAME
	 , l.COLDESC AS POSITION
	 , isnull(f.ACCOUNTNAME, g.ACCOUNTNAME) AS ACCOUNTNAME
	 , isnull(h.COLDESC, i.COLDESC) AS ENTSIZE
	 , isnull(j.COLDESC, k.COLDESC) AS CUSTTYPE
	 , isnull(f.GROUPNAME, g.GROUPNAME) as GROUPNAME
	 , a.VISITDATE
	 , a.RECORDDATE
	 , o.COLDESC AS VISITTYPE
FROM
	CUSTMGR_DIARY a
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE b
		ON a.EDITEMPNO = b.STAFF
	LEFT OUTER JOIN chb_pub.dbo.BRANCH c
		ON a.BRNO = c.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
		ON a.BRNO = d.BRNO
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.CRCNO = e.BRNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST f
		ON a.BRNO = f.BRNO AND a.SERNO = f.SERNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS g
		ON a.BRNO = g.BRNO AND a.SERNO = g.SERNO
	LEFT OUTER JOIN CUSTMGR_OPTION h
		ON f.ENTSIZE = h.COLVALUE AND h.DBCOLUMN = ''ENTSIZE''
	LEFT OUTER JOIN CUSTMGR_OPTION i
		ON g.ENTSIZE = i.COLVALUE AND i.DBCOLUMN = ''ENTSIZE''
	LEFT OUTER JOIN CUSTMGR_OPTION j
		ON f.CUSTTYPE = j.COLVALUE AND j.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_OPTION k
		ON g.CUSTTYPE = k.COLVALUE AND k.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_OPTION l
		ON a.EDITPOSTION = l.COLVALUE AND l.DBCOLUMN = ''POSITION''
	LEFT OUTER JOIN CUSTMGR_GROUP m
		ON f.ENTSERNOMAIN = m.ENTSERNOMAIN
	LEFT OUTER JOIN CUSTMGR_GROUP n
		ON g.ENTSERNOMAIN = n.ENTSERNOMAIN		
	LEFT OUTER JOIN CUSTMGR_OPTION o
		ON a.VISITTYPE = o.COLVALUE AND o.DBCOLUMN = ''VISITTYPE''
WHERE 1=1 '+@condition+' 	
ORDER BY
	d.CRCNO
  , d.BRNO
  , a.VISITDATE')" onselecting="dsDiaryLisByCustSerNo_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition1" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="dsDiaryLisMain" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" SelectCommand="EXEC ('SELECT CRCNO
	 , CRCNAME
	 , BRNO
	 , BRNAME
	 , TOTALMGR
	 , count(DISTINCT EDITEMPNO) as TOTALEDITEMPNO
	 , count(DISTINCT SERNO) as TOTALCUSTSUM
	 , sum(PHONECALL) AS TOTALPHONE
	 , sum(PERSONCALL) AS TOTALPERSON
	 , sum(1) AS TOTALCUST
	 
FROM
	(SELECT e.BRNAME AS CRCNAME
		  , a.BRNO
		  , a.SERNO
		  , d.CRCNO
		  , c.BRNAME		  
		  , b.TOTALMGR
		  , a.EDITEMPNO
		  , CASE
				WHEN a.VISITTYPE = 1 THEN
					1
				ELSE
					0
			END AS PHONECALL
		  , CASE
				WHEN a.VISITTYPE = 2 THEN
					1
				ELSE
					0
			END AS PERSONCALL
	 FROM
		 CUSTMGR_DIARY a
		 LEFT OUTER JOIN (SELECT BRNO
							   , sum(1) AS TOTALMGR
						  FROM
							  CUSTMGR_EDITMGR
						  GROUP BY
							  BRNO) b
			 ON a.BRNO = b.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH c
			 ON a.BRNO = c.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
			 ON a.BRNO = d.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.BRANCH e
			 ON d.CRCNO = e.BRNO
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST f
			 ON a.SERNO = f.SERNO AND a.BRNO = f.BRNO
		 LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS g
			 ON a.SERNO = g.SERNO AND a.BRNO = g.BRNO
		 LEFT OUTER JOIN CUSTMGR_GROUP m
			 ON f.ENTSERNOMAIN = m.ENTSERNOMAIN
		 LEFT OUTER JOIN CUSTMGR_GROUP n
			 ON g.ENTSERNOMAIN = n.ENTSERNOMAIN	 
	 WHERE
		 1 = 1 ' + @condition + ' ) h
GROUP BY
	CRCNO
  , CRCNAME
  , BRNO
  , BRNAME
  , TOTALMGR
ORDER BY
	CRCNO
  , BRNO')" onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>    
				  
	<asp:HiddenField ID="hidn_condition" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition0" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition1" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition2" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition3" runat="server" />
	<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
				  
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
             <asp:SqlDataSource ID="dsDiaryLisReport" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT e.BRNAME AS CRCNAME
	 , a.BRNO
	 , c.BRNAME
	 , b.NAME
	 , l.COLDESC AS POSITION
	 , a.SERNO
	 , isnull(f.ACCOUNTNAME, g.ACCOUNTNAME) AS ACCOUNTNAME
	 , isnull(h.COLDESC, i.COLDESC) AS ENTSIZE
	 , isnull(j.COLDESC, k.COLDESC) AS CUSTTYPE
	 , isnull(f.GROUPNO, g.GROUPNO) as GROUPNO
	 , isnull(f.GROUPNAME, g.GROUPNAME) as GROUPNAME
	 , isnull(f.ENTSERNOMAJOR, g.ENTSERNOMAJOR) AS ENTSERNOMAJOR
	 , isnull(f.ENTNAMEMAJOR, g.ENTNAMEMAJOR) AS ENTNAMEMAJOR
	 , a.VISITDATE
	 , a.RECORDDATE
	 , o.COLDESC AS VISITTYPE
FROM
	CUSTMGR_DIARY a
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE b
		ON a.EDITEMPNO = b.STAFF
	LEFT OUTER JOIN chb_pub.dbo.BRANCH c
		ON a.BRNO = c.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
		ON a.BRNO = d.BRNO
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.CRCNO = e.BRNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST f
		ON a.BRNO = f.BRNO AND a.SERNO = f.SERNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS g
		ON a.BRNO = g.BRNO AND a.SERNO = g.SERNO
	LEFT OUTER JOIN CUSTMGR_OPTION h
		ON f.ENTSIZE = h.COLVALUE AND h.DBCOLUMN = ''ENTSIZE''
	LEFT OUTER JOIN CUSTMGR_OPTION i
		ON g.ENTSIZE = i.COLVALUE AND i.DBCOLUMN = ''ENTSIZE''
	LEFT OUTER JOIN CUSTMGR_OPTION j
		ON f.CUSTTYPE = j.COLVALUE AND j.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_OPTION k
		ON g.CUSTTYPE = k.COLVALUE AND k.DBCOLUMN = ''CUSTTYPE''
	LEFT OUTER JOIN CUSTMGR_OPTION l
		ON a.EDITPOSTION = l.COLVALUE AND l.DBCOLUMN = ''POSITION''
	LEFT OUTER JOIN CUSTMGR_GROUP m
		ON f.ENTSERNOMAIN = m.ENTSERNOMAIN
	LEFT OUTER JOIN CUSTMGR_GROUP n
		ON g.ENTSERNOMAIN = n.ENTSERNOMAIN		
	LEFT OUTER JOIN CUSTMGR_OPTION o
		ON a.VISITTYPE = o.COLVALUE AND o.DBCOLUMN = ''VISITTYPE''
WHERE 1=1 '+@condition+' 	
ORDER BY
	d.CRCNO
  , d.BRNO
  , a.VISITDATE')" 
        onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition2" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>

