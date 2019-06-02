<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiaryQuery.aspx.cs" Inherits="DiaryQuery"
    MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>日誌管理</title>
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
                        <asp:Label ID="lab_Title" Text="日誌管理" runat="server"></asp:Label></strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<asp:Button ID="btn_ExportExcel" runat="server" OnClick="btn_ExportExcel_Click"
                    Text="匯出Excel" />&nbsp;
                    <input id="btnPrint" type="button" value="列印"
                        onclick="printScreen(printlist)" /></td>
                <tr>
                    <td bgcolor="khaki">&nbsp;<span><asp:Label ID="Label2" runat="server" Text="單位" Style="font-size: medium"></asp:Label>
                    </span>
                    </td>
                    <td>&nbsp;<span><asp:Label ID="lab_BRNO" runat="server" Style="color: #3333FF"></asp:Label>
                    </span>&nbsp; <span>
                        <asp:Label ID="lab_BRNAME" runat="server" Style="color: #3333FF"></asp:Label>
                    </span>
                    </td>
                    <td bgcolor="khaki">
                        <span>
                            <asp:Label ID="Label1" runat="server" Text="使用者" Style="font-size: medium"></asp:Label>
                        </span>&nbsp;
                    </td>
                    <td>&nbsp;&nbsp; <span>
                        <asp:Label ID="lab_EmpNo" runat="server" CssClass="style1"></asp:Label>
                        <asp:Label ID="lab_EmpName" runat="server" CssClass="style1"></asp:Label>
                    </span>
                    </td>
                </tr>
            </table>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="請輸入查詢條件" Style="font-weight: 700"></asp:Label>
                    </td>
                    <%--<td>&nbsp;DEBUG MSG<br />
                        <asp:TextBox ID="dmsg1" runat="server" Height="35px" Width="139px" ReadOnly="True"></asp:TextBox>
                        &nbsp;
                    <br />
                        <asp:TextBox ID="dmsg2" runat="server" Height="35px" ReadOnly="True" Style="margin-top: 0px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="dmsg3" runat="server" Height="35px" ReadOnly="True" Style="margin-top: 0px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="dmsg4" runat="server" Height="35px" ReadOnly="True" Style="margin-top: 0px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="dmsg5" runat="server" Height="35px" ReadOnly="True" Style="margin-top: 0px"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="dmsg6" runat="server" Height="35px" ReadOnly="True" Style="margin-top: 0px"></asp:TextBox>
                        <br />
                        <br />
                    </td>--%>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="拜訪日期"></asp:Label>
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
                            <asp:ListItem Selected="True" Value="5">其他全部</asp:ListItem>
                        </asp:RadioButtonList>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lab_CrcDisplay" runat="server" Text="CRC代號" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drList_Crc" runat="server" DataSourceID="dsCRC" DataTextField="BRNAME"
                            DataValueField="BRNO" Width="200px" Visible="False" AutoPostBack="True"
                            OnSelectedIndexChanged="drList_Crc_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsCRC" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub %>"
                            SelectCommand="SELECT '請選擇' AS BRNAME, '-1' AS BRNO UNION SELECT BRNO + '_' + BRNAME AS BRNAME, BRNO FROM chb_pub.dbo.BRANCH WHERE (BRNO IN (SELECT DISTINCT CRCNO FROM chb_pub.dbo.crc_rel_br)) ORDER BY BRNO"></asp:SqlDataSource>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="分行代號"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drList_Brno" runat="server" DataSourceID="dsBrno" DataTextField="BRNAME"
                            DataValueField="BRNO" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="drList_Brno_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dsBrno" runat="server" ConnectionString="<%$ ConnectionStrings:chb_pub %>"
                            SelectCommand="EXEC('SELECT ''請選擇'' AS BRNAME
	 , -1 AS BRNO UNION
SELECT BRNO + ''_'' + BRNAME AS BRNAME
	 , BRNO
FROM
	chb_pub.dbo.BRANCH 
WHERE 
	(BRNAME LIKE ''%分行'' or BRNO=''2200'')
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
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="(新/舊)客戶"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbtn_NewCust" runat="server" RepeatDirection="Horizontal"
                            AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="-1">全部</asp:ListItem>
                            <asp:ListItem Value="0">舊戶</asp:ListItem>
                            <asp:ListItem Value="1">新戶</asp:ListItem>
                        </asp:RadioButtonList>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_Query" runat="server" Text="查詢" OnClick="btn_Query_Click" />
                        <asp:Label ID="lab_State" runat="server" Style="color: #0000FF"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Program/CustMgr/DiaryAdd.aspx">新增</asp:HyperLink>
            &nbsp;<div id="printlist">
                &nbsp;<asp:Label ID="lab_QueryDate" runat="server"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                    DataSourceID="dsQueryDiary" EnableModelValidation="True" EmptyDataText="查無日誌資料"
                    OnRowDataBound="GridView1_RowDataBound" AllowSorting="True" OnLoad="LabelStateFinished" OnPreRender="LabelStateFinished" OnRowCreated="LabelStateFinished">
                    <Columns>
                        <asp:BoundField DataField="CRCNO" HeaderText="CRC" />
                        <asp:BoundField DataField="BRNO" HeaderText="分行代號" />
                        <asp:BoundField DataField="BRNAME" HeaderText="分行名稱" />
                        <asp:TemplateField HeaderText="客戶名稱" SortExpression="ACCOUNTNAME">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("DIARYNO", "DiaryModify.aspx?DIARYNO={0}") %>'
                                    Text='<%# Eval("ACCOUNTNAME") %>'></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ACCOUNTNAME") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CUSTTYPE" HeaderText="客戶類型"
                            SortExpression="CUSTTYPE" ReadOnly="True" />
                        <asp:BoundField DataField="GROUPNAME" HeaderText="集團名稱" ReadOnly="True" SortExpression="GROUPNAME" />
                        <asp:BoundField DataField="MGRNAME" HeaderText="管理員" SortExpression="MGRNAME" />
                        <asp:BoundField DataField="EDITNAME" HeaderText="登錄員" SortExpression="EDITNAME" />
                        <asp:BoundField DataField="VISITDATE" HeaderText="拜訪日期" SortExpression="VISITDATE" />
                        <asp:BoundField DataField="RECORDDATE" HeaderText="登錄日期" />
                        <asp:BoundField DataField="OPPNUM" HeaderText="商機數" ReadOnly="True" />
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
            <asp:SqlDataSource ID="dsQueryDiary" runat="server" ConnectionString="<%$ ConnectionStrings:chb_iom %>"
                SelectCommand="EXEC('
SELECT n.CRCNO
	 , m.BRNO
     , m.BRNAME
	 , a.SERNO
	 , isnull(b.ACCOUNTNAME, c.ACCOUNTNAME) AS ACCOUNTNAME
	 , isnull(d.COLDESC, e.COLDESC) AS CUSTTYPE
	 , isnull(b.GROUPNAME, c.GROUPNAME) AS GROUPNAME
	 , h.NAME as MGRNAME
	 , i.NAME as EDITNAME
	 , a.VISITDATE
	 , a.RECORDDATE
	 , a.DIARYNO
	 , isnull(l.OPPNUM,0) as OPPNUM
	 , k.ENDPROJECT
FROM
	CUSTMGR_DIARY a
	LEFT OUTER JOIN CUSTMGR_CUSTLIST b
		ON a.BRNO = b.BRNO AND a.SERNO = b.SERNO
	LEFT OUTER JOIN CUSTMGR_CUSTLIST_PASS c
		ON a.BRNO = c.BRNO AND a.SERNO = c.SERNO
	LEFT OUTER JOIN CUSTMGR_OPTION d
		ON b.CUSTTYPE = d.COLVALUE 
	LEFT OUTER JOIN CUSTMGR_OPTION e
		ON c.CUSTTYPE = e.COLVALUE 
	LEFT OUTER JOIN CUSTMGR_GROUP f
		ON b.ENTSERNOMAIN = f.ENTSERNOMAIN
	LEFT OUTER JOIN CUSTMGR_GROUP g
		ON c.ENTSERNOMAIN = g.ENTSERNOMAIN
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE h
		ON a.MGREMPNO = h.STAFF
	LEFT OUTER JOIN chb_pub.dbo.EMPLOYEE i
		ON a.EDITEMPNO = i.STAFF				
	LEFT OUTER JOIN (SELECT DIARYNO,count(1)as OPPNUM FROM CUSTMGR_DIARYOPPORTUNITIES GROUP BY DIARYNO) l on a.DIARYNO = l.DIARYNO 	
	LEFT OUTER JOIN CUSTMGR_DIARYOPPMAPPING j
		ON a.DIARYNO = j.DIARYNO	
	LEFT OUTER JOIN CUSTMGR_OPPORTUNITIES k
		ON j.OPPNO = k.OPPNO and k.OPPTYPE = (SELECT max(OPPTYPE)
											  FROM
												  CUSTMGR_OPPORTUNITIES
											  WHERE
												  CUSTMGR_OPPORTUNITIES.OPPNO = k.OPPNO
											  GROUP BY
												  OPPNO)
    LEFT OUTER JOIN chb_pub.dbo.BRANCH m
		ON a.BRNO = m.BRNO
	LEFT OUTER JOIN chb_pub.dbo.crc_rel_br n
		ON a.BRNO = n.BRNO  												  		
WHERE 1=1  ' +@condition+ ' ')"
                OnSelecting="dsQueryDiary_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition" Name="condition" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong></span>
        </div>
        <asp:HiddenField ID="hidn_BRNO" runat="server" />
        <asp:HiddenField ID="hidn_conditionBrno" runat="server" />
        <asp:HiddenField ID="hidn_condition" runat="server" />
    </form>
</body>
</html>
