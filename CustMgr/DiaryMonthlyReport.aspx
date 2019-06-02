<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiaryMonthlyReport.aspx.cs"
    Inherits="DiaryMonthlyReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>經管客戶互動頻率統計月報</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <script language="JavaScript" type="text/javascript" src="./JS/print.js"></script>
     <style type="text/css" media="print">
         .print_disable
         {
             visibility: hidden;
         }
         
</style>
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
                ID="lab_Title" Text="統計查詢→經管客戶互動頻率統計月報" runat="server"></asp:Label> </strong>
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					<asp:Label ID="Label17" runat="server" Text="報表名稱："></asp:Label>
			    </td>
			<td>
	            <asp:DropDownList ID="drList_ReportType" runat="server">
                    <asp:ListItem Selected="True" Value="1">◎ 經管客戶互動頻率統計月報(依客戶)</asp:ListItem>
                    <asp:ListItem Value="2">◎ 經管客戶互動頻率統計月報(依管理員)</asp:ListItem>
                    <asp:ListItem Value="3">◎ 經管客戶互動頻率統計月報(依分行)</asp:ListItem>
                    <asp:ListItem Value="4">◎ 經管客戶互動頻率統計月報(依CRC)</asp:ListItem>
                </asp:DropDownList>
                </td>
			
		</tr>
		<tr>
			<td>
					<asp:Label ID="Label12" runat="server" Text="拜訪期間："></asp:Label>
			</td>
			<td>
	            <asp:Label ID="Label16" runat="server" Text="年度"></asp:Label>
					<asp:TextBox ID="txt_VisitYear" runat="server"></asp:TextBox>
                
					<asp:Label ID="Label15" runat="server" Text="月份"></asp:Label>
					<asp:DropDownList ID="txt_VisitDateStart" runat="server">
                        <asp:ListItem Selected="True">01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
					<asp:Label ID="Label13" runat="server" Text="~"></asp:Label>
					<asp:DropDownList ID="txt_VisitDateEnd" runat="server">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem Selected="True">12</asp:ListItem>
                </asp:DropDownList><br />
					<asp:Label ID="Label14" runat="server" 
                    Text="西元年(YYYYMM) 例如：201304~201306(須同一年度)"></asp:Label>
            </td>
			
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
		  <td colspan=2>
			  <asp:Button ID="btn_Query" runat="server" Text="查詢" 
                  onclick="btn_Query_Click"  />
	<asp:Label ID="lab_State" runat="server" style="color: #0000FF"></asp:Label>
		  </td>
		  </tr>      		
	</table>      
            &nbsp;
        &nbsp;&nbsp;
                   
      <br />      
      <div id="printlist">
    <asp:Label ID="lab_QueryTitle" runat="server" 
        style="font-weight: 700; color: #0000FF" Text=" 經管客戶互動頻率統計月報(依客戶)"></asp:Label>    <asp:Button ID="btn_ExcelDownload" runat="server" 
                onclick="btn_ExcelDownload_Click" Text="EXCEL下載"  class="print_disable"  />
            <asp:GridView ID="GridView1" runat="server" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2" EnableModelValidation="True" 
                EmptyDataText="查無資料">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" 
                    Wrap="False" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
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
    </div>
             <asp:SqlDataSource ID="dsDiaryLisByBrno" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="EXEC('SELECT w.區
	 , w.分行代號
	 , v.BRNAME AS [分行名稱]
	 , x.STAFF + ''_'' + x.NAME AS [管理員]
	 , j.totalcust AS [經管戶數]'
	 +@columnname+
	 ', w.[1月]+  w.[2月] + w.[3月] + w.[4月] + w.[5月] + w.[6月] + w.[7月] + w.[8月] + w.[9月] + w.[10月] + w.[11月] + w.[12月] as [拜訪次數累計]	
	 , w.[商機數累計]	 
	 , w.[已實現商機數累計]
	 , w.[商機實現收益] as [商機實現收益(千元)]
FROM
	(SELECT y.CRCNO AS [區]
		  , a.BRNO AS [分行代號]
		  , a.MGREMPNO AS [管理員員編]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''01'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [1月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''02'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [2月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''03'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [3月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''04'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [4月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''05'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [5月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''06'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [6月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''07'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [7月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''08'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [8月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''09'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [9月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''10'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [10月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''11'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [11月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''12'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [12月]		  
		  , min(isnull(z.商機數累計, 0))+ min(isnull(zz.商機數累計, 0)) AS [商機數累計]		   
		  , min(isnull(z.已實現商機數累計, 0))+min(isnull(zz.已實現商機數累計, 0)) AS [已實現商機數累計]
		  , min(isnull(z.商機實現收益, 0))+min(isnull(zz.商機實現收益, 0)) AS [商機實現收益]
	 FROM
		 (SELECT sum(1) AS VISITTIMES
			   , substring(VISITDATE, 1, 6) AS YEARMONTH
			   , BRNO
			   , SERNO			   
			   , MGREMPNO
			   , EDITEMPNO
			   , PREPAREINCOME
		  FROM
			  CUSTMGR_DIARY
			WHERE
			  (substring(VISITDATE, 1, 6) BETWEEN '+@year+ @monthstart+'  AND '+@year+ @monthend+') 
			   ' + @condition + '
		  GROUP BY
			  substring(VISITDATE, 1, 6)
			, BRNO
			, SERNO
			, MGREMPNO
			, EDITEMPNO
			, PREPAREINCOME) a
		 LEFT OUTER JOIN (SELECT d.BRNO
							   , ac.MGREMPNO
							   , sum(1) AS [商機數累計]
							   , sum(isnull(EXRESULT, 0)) AS [已實現商機數累計]
							   , sum(isnull(ab.INCOME,0)) as [商機實現收益]		
						  FROM
							  (SELECT OPPNO
									, BRNO
									, SERNO
									, OPPTYPE
									, EDITEMPNO
									, EXRESULT
							   FROM
								   CUSTMGR_OPPORTUNITIES
							   WHERE
								 OPPNO in
	(select OPPNO FROM CUSTMGR_DIARY a INNER join  CUSTMGR_DIARYOPPMAPPING b
	on a.DIARYNO = b.DIARYNO 
	WHERE (substring(a.VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'   AND '+@year+ @monthend+') 
								    ' + @condition + ')
								    ) d
								 left OUTER JOIN
								    CUSTMGR_OPPORTUNITIESMEMO ab ON
								d.OPPNO = ab.OPPNO AND d.OPPTYPE = 							  								
							    (SELECT min(OPPTYPE) from CUSTMGR_OPPORTUNITIES
							     where CUSTMGR_OPPORTUNITIES.OPPNO = d.OPPNO)
							     left OUTER JOIN
									CUSTMGR_CUSTLIST ac ON
									d.BRNO = ac.BRNO and d.SERNO=ac.SERNO
						  GROUP BY
							  d.BRNO
							, ac.MGREMPNO) z
			 ON a.BRNO = z.BRNO AND a.MGREMPNO = z.MGREMPNO 
    LEFT OUTER JOIN (SELECT BRNO
							   , EDITEMPNO
							   , sum(1) AS [商機數累計]
							   , sum(isnull(EXRESULT, 0)) AS [已實現商機數累計]
							   , sum(isnull(ab.INCOME,0)) as [商機實現收益]		
						  FROM
							  (SELECT OPPNO
									, BRNO
									, SERNO
									, OPPTYPE
									, EDITEMPNO
									, EXRESULT
							   FROM
								   CUSTMGR_OPPORTUNITIES
							   WHERE
								 OPPNO in
	(select OPPNO FROM CUSTMGR_DIARY a INNER join  CUSTMGR_DIARYOPPMAPPING b
	on a.DIARYNO = b.DIARYNO 
	WHERE (substring(a.VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'   AND '+@year+ @monthend+') 
								    ' + @condition + ')
								    ) d
								 left OUTER JOIN
								    CUSTMGR_OPPORTUNITIESMEMO ab ON
								d.OPPNO = ab.OPPNO AND d.OPPTYPE = 							  								
							    (SELECT min(OPPTYPE) from CUSTMGR_OPPORTUNITIES
							     where CUSTMGR_OPPORTUNITIES.OPPNO = d.OPPNO)
						  GROUP BY
							  BRNO
							, EDITEMPNO) zz
			 ON a.BRNO = zz.BRNO AND a.EDITEMPNO = zz.EDITEMPNO AND a.MGREMPNO &lt;&gt; zz.EDITEMPNO  	 
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br y
			 ON a.BRNO = y.BRNO


	 GROUP BY
		 a.BRNO
	   , a.MGREMPNO
	   , y.CRCNO) w
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE x
		ON w.管理員員編 = x.STAFF
	LEFT OUTER JOIN chb_pub.dbo.BRANCH v
		ON w.分行代號 = v.BRNO
	LEFT OUTER JOIN (SELECT count(DISTINCT SERNO) AS totalcust
						  , BRNO
						  , MGREMPNO
					 FROM
						 CUSTMGR_CUSTLIST
					 where
					 1 = 1
					  ' + @condition + '
					 GROUP BY
						 BRNO
					   , MGREMPNO) j
		ON w.管理員員編 = j.MGREMPNO AND w.分行代號 = j.BRNO
ORDER BY
	w.區
  , w.分行代號') " onselecting="dsDiaryLisByBrno_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition0" Name="condition" 
                         PropertyName="Value" />
                     <asp:Parameter Name="columnname" />
                     <asp:ControlParameter ControlID="txt_VisitYear" Name="year" 
                         PropertyName="Text" />
                     <asp:ControlParameter ControlID="txt_VisitDateStart" Name="monthstart" 
                         PropertyName="SelectedValue" />
                     <asp:ControlParameter ControlID="txt_VisitDateEnd" Name="monthend" 
                         PropertyName="SelectedValue" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <asp:HiddenField ID="hidn_BrnoList" runat="server" />
             <asp:SqlDataSource ID="dsDiaryLisByCustSerNo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="exec('SELECT w.區
	 , w.分行代號
	 , v.BRNAME AS [分行名稱]
	 , j.totalcust AS [經管戶數]'
	 +@columnname+
	 ', w.[1月]+  w.[2月] + w.[3月] + w.[4月] + w.[5月] + w.[6月] + w.[7月] + w.[8月] + w.[9月] + w.[10月] + w.[11月] + w.[12月] as [拜訪次數累計]	
	 , w.[商機數累計]
	 , w.[已實現商機數累計]
	 , w.[商機實現收益] as [商機實現收益(千元)]
FROM
	(SELECT y.CRCNO AS [區]
		  , a.BRNO AS [分行代號]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''01'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [1月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''02'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [2月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''03'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [3月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''04'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [4月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''05'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [5月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''06'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [6月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''07'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [7月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''08'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [8月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''09'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [9月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''10'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [10月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''11'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [11月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''12'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [12月]		  
		  , min(isnull(z.商機數累計, 0)) AS [商機數累計]
		  , min(isnull(z.已實現商機數累計, 0)) AS [已實現商機數累計]
		  , min(isnull(z.商機實現收益,0)) as [商機實現收益]	
	 FROM
		 (SELECT sum(1) AS VISITTIMES
			   , substring(VISITDATE, 1, 6) AS YEARMONTH
			   , BRNO
			   , PREPAREINCOME
		  FROM
			  CUSTMGR_DIARY
			where
					 (substring(VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'  AND '+@year+@monthend+ ') 
					  ' + @condition + '  
		  GROUP BY
			  substring(VISITDATE, 1, 6)
			, BRNO
			, PREPAREINCOME) a
		 LEFT OUTER JOIN (SELECT BRNO
							   , sum(1) AS [商機數累計]
							   , sum(isnull(EXRESULT, 0)) AS [已實現商機數累計]
							   , sum(isnull(ab.INCOME,0)) as [商機實現收益]							     

						  FROM
							  (SELECT OPPNO
									, BRNO
									, SERNO
									, OPPTYPE
									, EDITEMPNO
									, EXRESULT
							   FROM
								   CUSTMGR_OPPORTUNITIES
							     WHERE
								   OPPNO in
	(select OPPNO FROM CUSTMGR_DIARY a INNER join  CUSTMGR_DIARYOPPMAPPING b
	on a.DIARYNO = b.DIARYNO 
	WHERE (substring(a.VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'   AND '+@year+ @monthend+') 
								    ' + @condition + ')
							   ) d
							    left OUTER JOIN
								    CUSTMGR_OPPORTUNITIESMEMO ab ON
								d.OPPNO = ab.OPPNO AND d.OPPTYPE = 							  								
							    (SELECT min(OPPTYPE) from CUSTMGR_OPPORTUNITIES
							     where CUSTMGR_OPPORTUNITIES.OPPNO = d.OPPNO)
						  GROUP BY
							  BRNO) z
			 ON a.BRNO = z.BRNO
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br y
			 ON a.BRNO = y.BRNO
	 GROUP BY
		 a.BRNO
	   , y.CRCNO) w
	LEFT OUTER JOIN chb_pub.dbo.BRANCH v
		ON w.分行代號 = v.BRNO
	LEFT OUTER JOIN (SELECT count(DISTINCT SERNO) AS totalcust
						  , BRNO
					 FROM
						 CUSTMGR_CUSTLIST
           where
					1 = 1
					  ' + @condition + '
					 GROUP BY
						 BRNO) j
		ON w.分行代號 = j.BRNO
ORDER BY
	w.區
  , w.分行代號')">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition1" Name="condition" 
                         PropertyName="Value" />
                     <asp:Parameter Name="columnname" />
                     <asp:ControlParameter ControlID="txt_VisitYear" Name="year" 
                         PropertyName="Text" />
                     <asp:ControlParameter ControlID="txt_VisitDateStart" Name="monthstart" 
                         PropertyName="SelectedValue" />
                     <asp:ControlParameter ControlID="txt_VisitDateEnd" Name="monthend" 
                         PropertyName="SelectedValue" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <asp:SqlDataSource ID="dsDiaryLisMain" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" SelectCommand="EXEC('SELECT w.區
	 , w.分行代號
	 , v.BRNAME AS [分行名稱]
	 , x.STAFF + ''_'' + x.NAME AS [管理員]
	 , w.客戶統編
	 , isnull(q.ACCOUNTNAME, r.ACCOUNTNAME) AS [客戶名稱]'
	 +@columnname+
	 ', w.[1月]+  w.[2月] + w.[3月] + w.[4月] + w.[5月] + w.[6月] + w.[7月] + w.[8月] + w.[9月] + w.[10月] + w.[11月] + w.[12月] as [拜訪次數累計]	
	 , w.[商機數累計]
	 , w.[已實現商機數累計]
	 , w.[商機實現收益] as [商機實現收益(千元)]
FROM
	(SELECT y.CRCNO AS [區]
		  , a.BRNO AS [分行代號]
		  , a.SERNO AS [客戶統編]
		  , a.MGREMPNO
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''01'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [1月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''02'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [2月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''03'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [3月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''04'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [4月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''05'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [5月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''06'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [6月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''07'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [7月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''08'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [8月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''09'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [9月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''10'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [10月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''11'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [11月]
		  , max(CASE
				WHEN YEARMONTH = '''+@year+''' + ''12'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [12月]		 
		  , isnull(z.商機數累計, 0) AS [商機數累計]
		  , isnull(z.已實現商機數累計, 0) AS [已實現商機數累計]		  
		  , isnull(z.商機實現收益, 0) AS [商機實現收益]
	 FROM
		 (SELECT sum(1) AS VISITTIMES
			   , substring(VISITDATE, 1, 6) AS YEARMONTH
			   , BRNO
			   , SERNO
			   , MGREMPNO
			   , PREPAREINCOME
		  FROM
			  CUSTMGR_DIARY a			 
		  WHERE
			  (substring(VISITDATE, 1, 6) BETWEEN '+@year+ @monthstart+'  AND '+@year+ @monthend+') 
			   ' + @condition + '
		  GROUP BY
			  substring(VISITDATE, 1, 6)
			, BRNO
			, SERNO
			, MGREMPNO
			, PREPAREINCOME) a
		 LEFT OUTER JOIN (SELECT BRNO
							   , SERNO
							   , sum(1) AS [商機數累計]
							   , sum(isnull(EXRESULT, 0)) AS [已實現商機數累計]
							   , sum(isnull(ab.INCOME,0)) as [商機實現收益]
						  FROM
							  (SELECT OPPNO
									, BRNO
									, SERNO
									, OPPTYPE
									, EDITEMPNO
									, EXRESULT
							   FROM
								   CUSTMGR_OPPORTUNITIES
							   WHERE
								   OPPNO in
	(select OPPNO FROM CUSTMGR_DIARY a INNER join  CUSTMGR_DIARYOPPMAPPING b
	on a.DIARYNO = b.DIARYNO 
	WHERE (substring(a.VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'   AND '+@year+ @monthend+') 
								    ' + @condition + ')
								   ) d
							    left OUTER JOIN
								    CUSTMGR_OPPORTUNITIESMEMO ab ON
								d.OPPNO = ab.OPPNO AND d.OPPTYPE = 							  								
							    (SELECT min(OPPTYPE) from CUSTMGR_OPPORTUNITIES
							     where CUSTMGR_OPPORTUNITIES.OPPNO = d.OPPNO)
						  GROUP BY
							  BRNO
							, SERNO) z
			 ON a.BRNO = z.BRNO AND a.SERNO = z.SERNO
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br y
			 ON a.BRNO = y.BRNO

	 GROUP BY
		 a.BRNO
	   , a.SERNO
	   , z.商機數累計
	   , z.已實現商機數累計
	   , z.商機實現收益
	   , y.CRCNO
	   , a.MGREMPNO) w
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE x
		ON w.MGREMPNO = x.STAFF
	LEFT OUTER JOIN chb_pub.dbo.BRANCH v
		ON w.分行代號 = v.BRNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST q
		ON w.客戶統編 = q.SERNO AND w.分行代號 = q.BRNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS r
		ON w.客戶統編 = r.SERNO AND w.分行代號 = r.BRNO
ORDER BY
	w.[區]
  , w.[分行代號]')    " onselecting="dsDiaryLisMain_Selecting">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                         PropertyName="Value" />
                     <asp:ControlParameter ControlID="txt_VisitYear" Name="year" 
                         PropertyName="Text" />
                     <asp:ControlParameter ControlID="txt_VisitDateStart" Name="monthstart" 
                         PropertyName="SelectedValue" />
                     <asp:ControlParameter ControlID="txt_VisitDateEnd" Name="monthend" 
                         PropertyName="SelectedValue" />
                     <asp:Parameter Name="columnname" />
                 </SelectParameters>
            </asp:SqlDataSource>
             <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>    
				  
	<asp:HiddenField ID="hidn_condition" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition0" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition1" runat="server" />
				  
	<asp:HiddenField ID="hidn_condition2" runat="server" />
	<asp:HiddenField ID="hidn_conditionBrno" runat="server" />
				  
	<asp:HiddenField ID="hidn_BRNO" runat="server" />
             <asp:SqlDataSource ID="dsDiaryLisReport" runat="server" 
                ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="exec('SELECT w.區
	 , j.totalcust AS [經管戶數]'
	 +@columnname+
	 ', w.[1月]+  w.[2月] + w.[3月] + w.[4月] + w.[5月] + w.[6月] + w.[7月] + w.[8月] + w.[9月] + w.[10月] + w.[11月] + w.[12月] as [拜訪次數累計]	
	 , w.[商機數累計]
	 , w.[已實現商機數累計]
	 , w.[商機實現收益] as [商機實現收益(千元)]
FROM
	(SELECT y.CRCNO AS [區]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''01'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [1月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''02'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [2月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''03'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [3月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''04'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [4月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''05'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [5月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''06'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [6月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''07'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [7月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''08'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [8月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''09'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [9月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''10'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [10月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''11'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [11月]
		  , sum(CASE
				WHEN YEARMONTH = '''+@year+''' + ''12'' THEN
					VISITTIMES
				ELSE
					0
			END) AS [12月]		  
		  , min(isnull(z.商機數累計, 0)) AS [商機數累計]
		  , min(isnull(z.已實現商機數累計, 0)) AS [已實現商機數累計]
		  , min(isnull(z.商機實現收益,0)) as [商機實現收益]
	 FROM
		 (SELECT sum(1) AS VISITTIMES
			   , substring(VISITDATE, 1, 6) AS YEARMONTH
			   , BRNO
			   , PREPAREINCOME
		  FROM
			  CUSTMGR_DIARY
			WHERE
			  (substring(VISITDATE, 1, 6) BETWEEN '+@year+ @monthstart+'  AND '+@year+ @monthend+') 
			   ' + @condition + '
		  GROUP BY
			  substring(VISITDATE, 1, 6)
			, BRNO
			, PREPAREINCOME) a
		 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br y
			 ON a.BRNO = y.BRNO
		 LEFT OUTER JOIN (SELECT CRCNO
							   , sum(1) AS [商機數累計]
							   , sum(isnull(EXRESULT, 0)) AS [已實現商機數累計]
							   , sum(isnull(INCOME,0)) as [商機實現收益]		
						  FROM
							  (SELECT r.CRCNO
									, EXRESULT
									, INCOME
							   FROM
								   CUSTMGR_OPPORTUNITIES q
								   LEFT OUTER JOIN chb_pub.dbo.crc_rel_br r
									   ON q.BRNO = r.BRNO
								    left OUTER JOIN
								    CUSTMGR_OPPORTUNITIESMEMO ab ON
								q.OPPNO = ab.OPPNO AND q.OPPTYPE = 							  								
							    (SELECT min(OPPTYPE) from CUSTMGR_OPPORTUNITIES
							     where CUSTMGR_OPPORTUNITIES.OPPNO = q.OPPNO)
							     WHERE
								   q.OPPNO in
	(select OPPNO FROM CUSTMGR_DIARY a INNER join  CUSTMGR_DIARYOPPMAPPING b
	on a.DIARYNO = b.DIARYNO 
	WHERE (substring(a.VISITDATE, 1, 6) BETWEEN '+@year+@monthstart+'   AND '+@year+ @monthend+') 
								    ' + @condition + ')
								    ) d
						  GROUP BY
							  CRCNO) z
			 ON y.CRCNO = z.CRCNO OR (y.CRCNO IS NULL AND z.CRCNO IS NULL)
	 GROUP BY
		 y.CRCNO) w
	LEFT OUTER JOIN (SELECT count(DISTINCT SERNO) AS totalcust
						  , CRCNO
					 FROM
					 (
						SELECT SERNO,crc_rel_br.BRNO,CRCNO
						from CUSTMGR_CUSTLIST
						 LEFT OUTER JOIN chb_pub.dbo.crc_rel_br
							 ON CUSTMGR_CUSTLIST.BRNO = chb_pub.dbo.crc_rel_br.BRNO OR (CUSTMGR_CUSTLIST.BRNO IS NOT NULL AND crc_rel_br.BRNO IS NULL)
					 )r		
					WHERE
			   1 = 1
			   ' + @condition + '
					 GROUP BY
						 CRCNO) j
		ON w.區 = j.CRCNO OR (w.區 IS NULL AND j.CRCNO IS NULL)
ORDER BY
	w.區 ')">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="hidn_condition2" Name="condition" 
                         PropertyName="Value" />
                     <asp:Parameter Name="columnname" />
                     <asp:ControlParameter ControlID="txt_VisitYear" Name="year" 
                         PropertyName="Text" />
                     <asp:ControlParameter ControlID="txt_VisitDateStart" Name="monthstart" 
                         PropertyName="SelectedValue" />
                     <asp:ControlParameter ControlID="txt_VisitDateEnd" Name="monthend" 
                         PropertyName="SelectedValue" />
                 </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>

