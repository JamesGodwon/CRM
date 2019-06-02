<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HiddenCustQuery.aspx.cs"
    Inherits="HiddenCustQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>潛在客戶名單</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />
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
                    <asp:Label ID="lab_Title" Text="潛在客戶名單" runat="server"></asp:Label>
                </strong></span>
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
                    <asp:Label ID="Label25" runat="server" Text="請輸入查詢條件" Style="font-weight: 700"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="統一編號或公司名稱"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_SERNO" runat="server" Width="314px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="登記地址"></asp:Label>
                </td>
                <td>
                    <br />
                    <asp:Label ID="Label23" runat="server" Text="縣市"></asp:Label>
                    <asp:DropDownList ID="drListCity" runat="server" AutoPostBack="True" DataSourceID="dsCity"
                        DataTextField="CITYNAME" DataValueField="CITYNAME" OnSelectedIndexChanged="drListCity_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsCity" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
                        SelectCommand="SELECT '請選擇' AS CITYNAME, '-1' AS CITYNO UNION SELECT DISTINCT CITYNAME, CITYNO FROM CUSTMGR_CITY ORDER BY CITYNO">
                    </asp:SqlDataSource>
                    <asp:Label ID="Label24" runat="server" Text="鄉鎮市區"></asp:Label>
                    <asp:DropDownList ID="drListSection" runat="server" AutoPostBack="True" DataSourceID="dsSection"
                        DataTextField="SECTIONNAME" DataValueField="SECTIONNAME" OnSelectedIndexChanged="drListSection_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Label29" runat="server" Text="路巷號"></asp:Label>
                    <asp:TextBox ID="txt_EntAddress" runat="server" Width="314px"></asp:TextBox>
                    <asp:SqlDataSource ID="dsSection" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
                        SelectCommand="SELECT '請選擇' AS SECTIONNAME, '-1' AS SECTIONNO UNION SELECT SECTIONNAME, SECTIONNO FROM CUSTMGR_CITY WHERE (CITYNAME = @CITYNAME) ORDER BY SECTIONNO">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drListCity" Name="CITYNAME" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label27" runat="server" style="font-weight: 700; color: #0000FF" 
                        Text="多個查詢條件請用逗號(,)分隔"></asp:Label>
                    
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="代表人"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_ContractPeople" runat="server" Width="314px"></asp:TextBox>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="資本額"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="最低"></asp:Label>
                    <asp:TextBox ID="txt_CapitalStart" runat="server"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="最高"></asp:Label>
                    <asp:TextBox ID="txt_CapitalEnd" runat="server"></asp:TextBox>
                    <asp:Label ID="Label21" runat="server" Text="單位：千元"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="設立日期"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="開始日期"></asp:Label>
                    <asp:TextBox ID="txt_SetDateStart" runat="server"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="結束日期"></asp:Label>
                    <asp:TextBox ID="txt_SetDateEnd" runat="server"></asp:TextBox>
                    <asp:Label ID="Label14" runat="server" Text="西元年(YYYYMMDD) 例如：20110101"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="變更日期"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="開始日期"></asp:Label>
                    <asp:TextBox ID="txt_ChangeDateStart" runat="server"></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" Text="結束日期"></asp:Label>
                    <asp:TextBox ID="txt_ChangeDateEnd" runat="server"></asp:TextBox>
                    <asp:Label ID="Label16" runat="server" Text="西元年(YYYYMMDD) 例如：20110101"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:Label ID="Label28" runat="server" Text="上市別"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList ID="chkList_EntType" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="TSE">上市</asp:ListItem>
                        <asp:ListItem Value="OTC">上櫃</asp:ListItem>
                        <asp:ListItem Value="ROTC">興櫃</asp:ListItem>
                        <asp:ListItem Value="PUB">公發</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>                           
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn_Query" runat="server" Text="查詢" OnClick="btn_Query_Click" 
                        style="width: 40px" />&nbsp;
				<asp:Button ID="btn_ExportExcel" runat="server" onclick="btn_ExportExcel_Click" 
					Text="匯出Excel" />
                <asp:Button ID="btn_ExportExcel2" runat="server" onclick="btn_ExportExcel2_Click" 
					Text="匯出國內營運處專用Excel" />
                    
                    <asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
                    <b>
                        <asp:HyperLink ID="Link_UploadTime" runat="server" 
                        NavigateUrl="~/Program/CustMgr/UploadHiddenCust.aspx" Visible="False">潛在客戶名單上傳</asp:HyperLink>&nbsp;
                        <asp:HyperLink ID="Link_TEJQuery" runat="server" 
                        NavigateUrl="~/Program/CustMgr/TEJDataQuery.aspx" Visible="False">TEJ資料查詢</asp:HyperLink>
                        &nbsp;
                        <asp:HyperLink ID="Link_QueryBatch" runat="server" 
                        NavigateUrl="~/Program/CustMgr/HiddenCustQueryByMajor.aspx" 
                        Visible="False">潛在客戶名單整批查詢</asp:HyperLink>
                    </b>
                </td>
            </tr>
        </table>
        <strong>
            <asp:HiddenField ID="hidn_EmpNo" runat="server" />
        </strong></span>
    </div>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
        CellPadding="3" CellSpacing="2" DataKeyNames="系統流水號" DataSourceID="dsQueryHiddenCust"
        EnableModelValidation="True" EmptyDataText="查無資料" PageSize="200" 
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="系統流水號" HeaderText="系統流水號" InsertVisible="False" ReadOnly="True"
                SortExpression="系統流水號" Visible="False" />
            <asp:BoundField DataField="最新拜訪日期" HeaderText="最新拜訪日期" 
                SortExpression="最新拜訪日期" ReadOnly="True" />
            <asp:BoundField DataField="上市別 / 代號" HeaderText="上市別 / 代號" 
                SortExpression="上市別 / 代號" ReadOnly="True" />
            <asp:BoundField DataField="統一編號" HeaderText="統一編號" SortExpression="統一編號" />
            <asp:TemplateField HeaderText="公司名稱" SortExpression="公司名稱">
                <ItemTemplate>                   
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("系統流水號", "HiddenCustModify.aspx?BATCHNUMBER={0}") %>'
							Text='<%# Eval("公司名稱") %>'></asp:HyperLink>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("公司名稱") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="登記地址" HeaderText="登記地址" SortExpression="登記地址" />
            <asp:BoundField DataField="代表人" HeaderText="代表人" 
                SortExpression="代表人" />
            <asp:BoundField DataField="資本額(千元)" HeaderText="資本額(千元)" 
                SortExpression="資本額(千元)" ReadOnly="True" DataFormatString="{0:0,0}" />
            <asp:BoundField DataField="設立日期" HeaderText="設立日期" SortExpression="設立日期" />
            <asp:BoundField DataField="電話一/電話二/TEJ登記電話" HeaderText="電話一/電話二/TEJ登記電話" 
                ReadOnly="True" SortExpression="電話一/電話二/TEJ登記電話" />
            <asp:BoundField DataField="登記地址/TEJ資料地址" HeaderText="登記地址/TEJ資料地址" 
                ReadOnly="True" SortExpression="登記地址/TEJ資料地址" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsQueryHiddenCust" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
        SelectCommand="EXEC ('SELECT a.BATCHNUMBER as [系統流水號]
     , c.VISITDATE as [最新拜訪日期]
	 , CASE WHEN b.mkt=N''TSE'' THEN ''上市/'' + co_id
	   WHEN b.mkt=N''OTC'' THEN ''上櫃/'' + co_id
	   WHEN b.mkt=N''ROTC'' THEN ''興櫃/'' + co_id
	   WHEN b.mkt=N''PUB'' THEN ''公發/'' + co_id
	   ELSE mkt + ''/'' + co_id END as [上市別 / 代號]
	 , a.SERNO as [統一編號]
	 , a.ENTNAME as [公司名稱]
	 , a.ENTADDRESS as [登記地址]
	 , a.CONTRACTPEOPLE as [代表人]
	 , a.CAPITAL/1000 as [資本額(千元)]
	 , a.SETDATE as [設立日期]
	 , isnull(a.TELFIRST,'''')+''/''+isnull(a.TELSECOND,'''')+''/''+isnull(b.phone,'''') COLLATE Chinese_Taiwan_Stroke_BIN as [電話一/電話二/TEJ登記電話]
	 , a.ENTADDRESS  COLLATE Chinese_Taiwan_Stroke_BIN +''/''+isnull(b.chi_add,'''')  COLLATE Chinese_Taiwan_Stroke_BIN as [登記地址/TEJ資料地址]
FROM
	CUSTMGR_HIDDENCUST a
LEFT OUTER JOIN crmstd b
on a.SERNO = b.invoice COLLATE Chinese_Taiwan_Stroke_BIN
LEFT OUTER JOIN (SELECT max(VISITDATE) as VISITDATE , SERNO from CUSTMGR_DIARY group by SERNO)c
ON a.SERNO = c.SERNO
WHERE
	1 = 1 ' + @condition + ' order by a.SERNO ');" 
        OnSelecting="dsQueryHiddenCust_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:HiddenField ID="hidn_condition" runat="server" />
    <asp:SqlDataSource ID="dsQueryHiddenCust0" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
        SelectCommand="EXEC (' SELECT c.VISITDATE as [最新拜訪日期]
     , a.SERNO as [統一編號]      
	 , CASE WHEN b.mkt=N''TSE'' THEN ''上市/'' + co_id
	   WHEN b.mkt=N''OTC'' THEN ''上櫃/'' + co_id
	   WHEN b.mkt=N''ROTC'' THEN ''興櫃/'' + co_id
	   WHEN b.mkt=N''PUB'' THEN ''公發/'' + co_id
	   ELSE mkt + ''/'' + co_id END as [上市別 / 代號]
     , a.ENTNAME as [公司名稱] 	   	 	 
     , a.CONTRACTPEOPLE as [代表人]
     , isnull(a.CAPITAL,0) as [資本額]
     , a.SETDATE as [設立日期]
     , a.CHANGEDATE as [變更日期]
	 , a.ENTADDRESS as [登記地址]	 	 	 
	 , a.TELFIRST COLLATE Chinese_Taiwan_Stroke_BIN as [電話一]
	 , a.TELSECOND COLLATE Chinese_Taiwan_Stroke_BIN as [電話二]
	 , a.OTHERADDRESS as[聯絡地址]
	 , b.chief AS [董事長]
	 , b.president AS [總經理]
	 , b.spokes2 AS [財務經理]
	 , b.phone AS [電話]
	 , b.gop_na AS [集團名稱]
	 , b.chi_add AS [地址]
	 , b.btindnm AS [主要產品]
	 , b.yymm_tcri AS [TCRI財報年月] 
	 , b.sicsnm AS [產業名稱] 
	 , b.crmtcri AS [TCRI評等]
	 , b.ad_tcri AS [評等日]
	
FROM
	CUSTMGR_HIDDENCUST a
LEFT OUTER JOIN crmstd b
on a.SERNO = b.invoice COLLATE Chinese_Taiwan_Stroke_BIN
LEFT OUTER JOIN (SELECT max(VISITDATE) as VISITDATE , SERNO from CUSTMGR_DIARY group by SERNO)c
ON a.SERNO = c.SERNO
WHERE
	1 = 1 ' + @condition + ' order by a.SERNO ');	" 
        OnSelecting="dsQueryHiddenCust_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsQueryHiddenCust1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" SelectCommand="EXEC ('SELECT CASE  a.CUSTTYPE when 1 then ''授信戶''
	when 2 then ''純存款戶A''
	when 3 then ''非彰銀客戶''
	when 4 then ''催呆戶''
	when 5 then ''純存款戶B''
	 ELSE  CAST(a.CUSTTYPE as VARCHAR(1)) END as [客戶種類] 
	,c.VISITDATE as [最新拜訪日期]
     , a.SERNO as [統一編號]      
	 , CASE WHEN b.mkt=N''TSE'' THEN ''上市/'' + co_id
	   WHEN b.mkt=N''OTC'' THEN ''上櫃/'' + co_id
	   WHEN b.mkt=N''ROTC'' THEN ''興櫃/'' + co_id
	   WHEN b.mkt=N''PUB'' THEN ''公發/'' + co_id
	   ELSE mkt + ''/'' + co_id END as [上市別 / 代號]
     , a.ENTNAME as [公司名稱] 	   	 	 
     , a.CONTRACTPEOPLE as [代表人]
     , isnull(a.CAPITAL,0) as [資本額(千元)]
     , a.SETDATE as [設立日期]
     , a.CHANGEDATE as [變更日期]
	 , a.ENTADDRESS as [登記地址]	 	 	 
	 , a.TELFIRST COLLATE Chinese_Taiwan_Stroke_BIN as [電話一]
	 , a.TELSECOND COLLATE Chinese_Taiwan_Stroke_BIN as [電話二]
	 , a.OTHERADDRESS as[聯絡地址]
	 , b.chief AS [董事長]
	 , b.president AS [總經理]
	 , b.spokes2 AS [財務經理]
	 , b.phone AS [電話]
	 , b.gop_na AS [集團名稱]
	 , b.chi_add AS [地址]
	 , b.btindnm AS [主要產品]
	 , b.yymm_tcri AS [TCRI財報年月] 
	 , b.sicsnm AS [產業名稱] 
	 , b.crmtcri AS [TCRI評等]
	 , b.ad_tcri AS [評等日]
	 ,d.Risk_Amt AS [風險額度(千元)]
	 ,d.Lon_Amt AS [放款平均餘額(千元)]
	 ,d.Use_Rate AS [動撥率(%)]
	 ,d.Lon_CRC AS [區]
	 ,d.Lon_Branch_Nbr AS [代號]
	 ,d.Lon_Branch_Name AS [放款分行]
	 ,d.Twd_Lon_Amt AS [台幣平均放款餘額(千元)]
	 ,d.Fex_Lon_Amt AS [外幣平均放款餘額(千元)]
	 ,d.Dep_CRC AS [區 ]
	 ,d.Dep_Branch_Nbr AS [代號 ]
	 ,d.Dep_Branch_Name AS [存款分行]
                    ,cast(d.Twd_Dep_Amt as decimal)  + cast(d.Fex_Dep_Amt as decimal) AS [存款平均餘額(千元)]
	 ,d.Twd_Dep_Amt AS [台幣平均存款餘額(千元)]
	 ,d.Fex_Dep_Amt AS [外幣平均存款餘額(千元)]
	 ,d.Primary_Party_ID AS [母公司統編]
	 ,d.JCIC_Data_Month AS [聯徵時間]
	 ,d.Lon_Market_Share_Rate AS [放款市佔率(%)]
	 ,d.OTHER_Bal_Amt AS [他行庫總餘額(千元)]
	 ,d.Final_Rating AS [信用評等]
	
FROM
	CUSTMGR_HIDDENCUST a
LEFT OUTER JOIN crmstd b
on a.SERNO = b.invoice COLLATE Chinese_Taiwan_Stroke_BIN
LEFT OUTER JOIN (SELECT max(VISITDATE) as VISITDATE , SERNO from CUSTMGR_DIARY group by SERNO)c
ON a.SERNO = c.SERNO
LEFT OUTER JOIN CUST_EFFECTS_CORP d on a.SERNO = d.Party_Id
WHERE
	1 = 1 ' + @condition + ' order by a.SERNO ');" 
        onselecting="dsQueryHiddenCust_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
