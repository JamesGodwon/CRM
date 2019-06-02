<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustListReport.aspx.cs"
    Inherits="CustListReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>客戶名單統計查詢</title>
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
                ID="lab_Title" Text="統計查詢→客戶名單" runat="server"></asp:Label> </strong>
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
		 
				<asp:RadioButtonList ID="rbtn_Useful" runat="server" 
					RepeatDirection="Horizontal" AutoPostBack="True" 
					>
					<asp:ListItem Selected="True" Value="1">有效戶名單</asp:ListItem>
					<asp:ListItem Value="2">已轉入無效戶名單</asp:ListItem>
					<asp:ListItem Value="3">全部名單</asp:ListItem>
				</asp:RadioButtonList>
				</td>
			</tr>
		<tr>
			<td>
	<asp:Label ID="Label8" runat="server" Text="工業區"></asp:Label>
			</td>
			<td>
	<asp:TextBox ID="txt_ZoneName" runat="server" Width="314px" 
					></asp:TextBox>
			</td>
			
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
	<asp:Label ID="Label7" runat="server" Text="管理員"></asp:Label>
			</td>
			<td>
		 
				<asp:DropDownList ID="drList_MgrId" runat="server" DataSourceID="dsMgrEmpNo" 
					DataTextField="NAME" DataValueField="STAFF" Width="200px">
				</asp:DropDownList>
				<asp:SqlDataSource ID="dsMgrEmpNo" runat="server" 
					ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
					
					
					
					SelectCommand="SELECT '請選擇' AS NAME, '-1' AS STAFF UNION SELECT a.MGREMPNO + '_' + b.NAME AS NAME, b.STAFF FROM CUSTMGR_EDITMGR AS a INNER JOIN chb_pub.dbo.EMPLOYEE AS b ON a.MGREMPNO = b.STAFF WHERE (a.BRNO = @brno) ORDER BY STAFF">
					<SelectParameters>
						<asp:ControlParameter ControlID="drList_Brno" Name="brno" 
							PropertyName="SelectedValue" />
					</SelectParameters>
				</asp:SqlDataSource>
		 
				<asp:Label ID="Label10" runat="server" style="font-weight: 700; color: #0000FF" 
					Text="查詢分行代號該分行的管理員"></asp:Label>
		 
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
                DataSourceID="dsCustLisMain" EnableModelValidation="True" 
                EmptyDataText="查無客戶名單資料" ondatabound="GridView1_DataBound">
                <Columns>
                    <asp:BoundField DataField="CRCNO" HeaderText="CRC" SortExpression="CRCNO" />
                    <asp:TemplateField HeaderText="分行代號" SortExpression="BRNO">
                        <ItemTemplate>
                            <asp:Label ID="lab_Brno" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BRNO") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
                    <asp:BoundField DataField="TOTALMGRSUM" HeaderText="管理員人數" ReadOnly="True" 
                        SortExpression="TOTALMGRSUM" />
                    <asp:BoundField DataField="TOTALCUST" HeaderText="經管客戶數" ReadOnly="True" 
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
                DataSourceID="dsCustLisByBrno" EnableModelValidation="True" 
                EmptyDataText="查無分行明細資料">
                <Columns>
                    <asp:BoundField DataField="CRCNO" HeaderText="CRC" SortExpression="CRCNO" />
                    <asp:TemplateField HeaderText="分行代號" SortExpression="BRNO">
                        <ItemTemplate>
                            <asp:Label ID="lab_Brno1" runat="server" Text='<%# Bind("BRNO") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("BRNO") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
                    <asp:BoundField DataField="NAME" HeaderText="管理員姓名" ReadOnly="True" 
                        SortExpression="NAME" />
                    <asp:BoundField DataField="TOTALCUST" HeaderText="經管客戶數" ReadOnly="True" 
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
        CellPadding="3" CellSpacing="2" DataKeyNames="BRNO,SERNO" 
        DataSourceID="dsCustLisByCustSerNo" EmptyDataText="查無客戶明細資料" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="CRCNO" HeaderText="CRC" SortExpression="CRCNO" />
            <asp:BoundField DataField="BRNO" HeaderText="分行代號" ReadOnly="True" 
                SortExpression="BRNO" />
            <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
            <asp:BoundField DataField="NAME" HeaderText="管理員" SortExpression="NAME" />
            <asp:BoundField DataField="SERNO" HeaderText="統一編號" ReadOnly="True" 
                SortExpression="SERNO" />
            <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" 
                SortExpression="ACCOUNTNAME" />
            <asp:BoundField DataField="COLDESC" HeaderText="客戶類型" 
                SortExpression="COLDESC" />
            <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                SortExpression="GROUPNAME" />
            <asp:BoundField DataField="ZONENAME" HeaderText="所屬工業區" 
                SortExpression="ZONENAME" />
            <asp:BoundField DataField="CONTRACTTEL" HeaderText="聯絡電話" 
                SortExpression="CONTRACTTEL" />
            <asp:BoundField DataField="CONTRACTADDRESS" HeaderText="聯絡地址" 
                SortExpression="CONTRACTADDRESS" />
            <asp:BoundField DataField="USEFUL" HeaderText="管理名單" SortExpression="USEFUL" />
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
                CellPadding="3" CellSpacing="2" DataKeyNames="BRNO,SERNO" 
                DataSourceID="dsCustLisReport" EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="CRCNO" HeaderText="CRC" SortExpression="CRCNO" />
                    <asp:BoundField DataField="BRNO" HeaderText="分行代號" ReadOnly="True" 
                        SortExpression="BRNO" />
                    <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" SortExpression="BRNAME" />
                    <asp:BoundField DataField="SERNO" HeaderText="統一編號" ReadOnly="True" 
                        SortExpression="SERNO" />
                    <asp:BoundField DataField="ACCOUNTNAME" HeaderText="客戶名稱" 
                        SortExpression="ACCOUNTNAME" />
                    <asp:BoundField DataField="COLDESC" HeaderText="客戶類型" 
                        SortExpression="COLDESC" />
                    <asp:BoundField DataField="GROUPNO" HeaderText="集團代號" 
                        SortExpression="GROUPNO" />
                    <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" 
                        SortExpression="GROUPNAME" />
                    <asp:BoundField DataField="ENTSERNOMAJOR" HeaderText="總公司統編" 
                        SortExpression="ENTSERNOMAJOR" />
                    <asp:BoundField DataField="ENTNAMEMAJOR" HeaderText="總公司名稱" 
                        SortExpression="ENTNAMEMAJOR" />
                    <asp:BoundField DataField="ZONENAME" HeaderText="所在工業區" 
                        SortExpression="ZONENAME" />
                    <asp:BoundField DataField="USEFUL" HeaderText="管理名單" SortExpression="USEFUL" />
                    <asp:BoundField DataField="CONTRACTTEL" HeaderText="聯絡電話" 
                        SortExpression="CONTRACTTEL" />
                    <asp:BoundField DataField="CONTRACTPEOPLE" HeaderText="聯絡人" 
                        SortExpression="CONTRACTPEOPLE" />
                    <asp:BoundField DataField="CONTRACTADDRESS" HeaderText="聯絡地址" 
                        SortExpression="CONTRACTADDRESS" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                    Wrap="False" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            </div>
             <asp:SqlDataSource ID="dsCustLisByBrno" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT d.CRCNO
	 , f.BRNO
	 , f.MGREMPNO
	 , c.BRNAME
	 , g.NAME
	 , f.TOTALCUST
FROM
	(SELECT a.BRNO
		  , a.MGREMPNO
		  , sum(1) TOTALCUST
	 FROM
		 CUSTMGR_CUSTLIST a
	 WHERE
		 1 = 1 ' + @condition + '
	 GROUP BY
		 a.BRNO
	   , a.MGREMPNO) f
	LEFT OUTER JOIN chb_pub.dbo.BRANCH c
		ON f.BRNO = c.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
		ON f.BRNO = d.BRNO
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.CRCNO = e.BRNO
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE g
		ON f.MGREMPNO = g.STAFF
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
             <asp:SqlDataSource ID="dsCustLisByCustSerNo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT e.BRNAME AS CRCNAME
	 , d.CRCNO
	 , a.BRNO
	 , c.BRNAME
	 , b.NAME
	 , a.SERNO
	 , a.ACCOUNTNAME
	 , f.COLDESC
	 , a.GROUPNAME
	 , a.ZONENAME
	 , a.CONTRACTTEL
	 , a.CONTRACTADDRESS
	 , a.USEFUL

FROM
	CUSTMGR_CUSTLIST a
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE b
		ON a.MGREMPNO = b.STAFF
	LEFT OUTER JOIN chb_pub.dbo.BRANCH c
		ON a.BRNO = c.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
		ON a.BRNO = d.BRNO
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.CRCNO = e.BRNO
	LEFT OUTER JOIN CUSTMGR_OPTION f
		ON a.CUSTTYPE = f.COLVALUE AND f.DBCOLUMN = ''CUSTTYPE''	
WHERE
	1 = 1 ' + @condition + '
ORDER BY
	d.CRCNO
  , d.BRNO')" 
        onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition1" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="dsCustLisMain" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" SelectCommand="EXEC ('SELECT CRCNO
	 , CRCNAME
	 , BRNO
	 , BRNAME
	 , TOTALMGR
	 , sum(1) AS TOTALCUST
	 , count(DISTINCT MGREMPNO) as TOTALMGRSUM
FROM
	(SELECT e.BRNAME AS CRCNAME
		  , a.BRNO
		  , a.ZONENAME
		  , a.SERNO
		  , a.ACCOUNTNAME
		  , a.ENTSERNOMAIN
		  , d.CRCNO
		  , c.BRNAME
		  , b.TOTALMGR
		  , a.MGREMPNO
	 FROM
		 CUSTMGR_CUSTLIST a
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
	 WHERE
		 1 = 1 ' + @condition + ' ) f
GROUP BY
	CRCNO
  , CRCNAME
  , BRNO
  , BRNAME
  , TOTALMGR
ORDER BY
	CRCNO,BRNO ')" onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>    
				  
	<asp:HiddenField ID="hidn_condition" runat="server" />
	<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
				  
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition0" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition1" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition2" runat="server" />
             <asp:SqlDataSource ID="dsCustLisReport" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC ('SELECT e.BRNAME AS CRCNAME
	 , d.CRCNO
	 , a.BRNO
	 , c.BRNAME
	 , a.SERNO
	 , a.ACCOUNTNAME
	 , f.COLDESC
	 , a.GROUPNO
	 , a.GROUPNAME
	 , a.ENTSERNOMAJOR
	 , a.ENTNAMEMAJOR
	 , a.ZONENAME
	 , a.USEFUL
	 , a.CONTRACTTEL
	 , a.CONTRACTPEOPLE
	 , a.CONTRACTADDRESS

FROM
	CUSTMGR_CUSTLIST a
	LEFT OUTER JOIN chb_pub.dbo.BRANCH c
		ON a.BRNO = c.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br d
		ON a.BRNO = d.BRNO
	LEFT OUTER JOIN chb_pub.dbo.BRANCH e
		ON d.CRCNO = e.BRNO
	LEFT OUTER JOIN CUSTMGR_OPTION f
		ON a.CUSTTYPE = f.COLVALUE AND f.DBCOLUMN = ''CUSTTYPE''	
WHERE
	1 = 1 ' + @condition + '
ORDER BY
	d.CRCNO
  , d.BRNO')" 
        onselecting="dsCustLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition2" Name="condition" 
                         PropertyName="Value" />
                 </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>

