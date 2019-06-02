<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImpBoard.aspx.cs"
    Inherits="ImpBoard" MaintainScrollPositionOnPostback="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>重大訊息</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .Initread {
        white-space: nowrap;
    text-overflow: ellipsis;
    height: 50px;
    display: block;
    overflow: hidden
    }
</style>         

</head>

<body>
    <form id="form1" runat="server">
    <div>                 
            


                    <span><strong>
                    <asp:Label
                ID="lab_Title" Text="TCRI重大訊息公告(最近一週資料)" runat="server" 
                style="color: #0000FF; font-size: x-large"></asp:Label> </strong>
                    </span>                 
            


            <br />


            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/Program/CustMgr/ImpQuery.aspx" 
                style="font-weight: 700; color: #3366FF">進階查詢</asp:HyperLink>
            <br />
            <br />


            <asp:Label ID="Label15" runat="server" Font-Size="Medium" Text="TCRI評等異動" 
                style="font-weight: 700; color: #990000"></asp:Label>
            <br />
            <asp:GridView ID="GridView3" runat="server" 
                AutoGenerateColumns="False" DataSourceID="SqlTCRIChange" BorderColor="#DEBA84" 
                EnableModelValidation="True"  EmptyDataText="查無TCRI評等異動資料" 
                onrowcommand="GridView3_RowCommand" 
                onrowdatabound="GridView3_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="市場別" HeaderText="市場別" SortExpression="市場別" 
                         >

                  

                    </asp:BoundField>
                    <asp:BoundField DataField="公司" HeaderText="公司" ReadOnly="True" 
                        SortExpression="公司" >

                    </asp:BoundField>
                    <asp:BoundField DataField="統一編號" HeaderText="統一編號" SortExpression="統一編號" 
                        >

                    </asp:BoundField>
                    <asp:BoundField DataField="評等日期" HeaderText="評等日期" SortExpression="評等日期" 
                        >

                    </asp:BoundField>
                    <asp:TemplateField HeaderText="升降" SortExpression="升降">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("升降") %>' Visible="False"></asp:Label>
                            <asp:Image ID="Image1" runat="server" 
                                ImageUrl="~/Program/CustMgr/img/uparrow.png" 
                                Visible='<%# VisableUp(Eval("升降").ToString()) %>' />
                            <asp:Image ID="Image2" runat="server" 
                                ImageUrl="~/Program/CustMgr/img/downarrow.png" 
                                Visible='<%# VisableDown(Eval("升降").ToString()) %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("升降") %>'></asp:TextBox>
                        </EditItemTemplate>
                        
                    
                        
                    </asp:TemplateField>
                    <asp:BoundField DataField="最新TCRI" HeaderText="最新TCRI" 
                        SortExpression="最新TCRI"  >

             

                    </asp:BoundField>
                    <asp:BoundField DataField="前一次TCRI" HeaderText="前一次TCRI" 
                        SortExpression="前一次TCRI"  >
          
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="調等說明摘要" SortExpression="調等說明摘要" Visible="False">
                        <ItemTemplate>
                           <asp:Label ID="Label_content" runat="server" Text='<%# Eval("調等說明摘要") %>'></asp:Label>
                            <br />
                        </ItemTemplate>                       
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="readall" Text="顯示全文" 
                         Visible="False" >

                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" CommandName="cancelall" Text="取消全文" 
                         Visible="False" >

                    </asp:ButtonField>
                </Columns>
                <HeaderStyle BackColor="#A55129" ForeColor="White" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlTCRIChange" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TEJ %>" SelectCommand="EXEC('select CASE WHEN crm1.mkt=N''TSE'' THEN ''上市'' 
		WHEN crm1.mkt=N''OTC'' THEN ''上櫃'' 
		WHEN crm1.mkt=N''ROTC'' THEN ''興櫃''
		WHEN crm1.mkt=N''PUB'' THEN ''公發''
	    WHEN crm1.mkt=N''UNPUB'' THEN ''未公發'' 
		ELSE crm1.mkt  END as [市場別]  
	,replace(crm1.co_id+crm1.name8,'' '' ,'''') as [公司] 
	,crm1.invoice as [統一編號] 
	,crm1.ad_tcri as [評等日期] 
	,crm2.tt1 as [升降] 
	,crm1.crmtcri as [最新TCRI] 
	,crm3.tcri as [前一次TCRI] 
	,replace(crm4.content,''&amp;lt;br/&amp;gt;'',''&lt;br/&gt;'') as [調等說明摘要] 
	from crmstd crm1 inner join crmtab crm2 on crm1.co_id = crm2.co_id and crm1.ad_tcri = crm2.rmk_d and crm2.tt1!=''-  ''
	and  crm2.tt1!=''N  '' inner join (select distinct tab1.co_id,tcri from crmtab tab1 inner join
	(select crmtab.co_id,MAX (rmk_d) as rmk_d  from crmtab  INNER join crmstd on crmtab.co_id = crmstd.co_id
	and crmtab.rmk_d &lt; crmstd.ad_tcri group by crmtab.co_id) tab2 on tab1.co_id = tab2.co_id and tab1.rmk_d = tab2.rmk_d) crm3
	on crm1.co_id = crm3.co_id join (SELECT crm2.co_id,crm2.yymmdd,STUFF((SELECT '''' +rmk + ''&lt;br/&gt;''  FROM crqtrmk  crm1 WHERE crm1.co_id = 
	crm2.co_id and crm1.yymmdd = crm2.yymmdd and crm1.xno = crm2.xno FOR XML PATH('''')), 1, 0, '''') 
	content FROM crqtrmk crm2 where crm2.xno=''A''  GROUP BY crm2.co_id,crm2.yymmdd,crm2.xno ) crm4 on crm1.co_id = crm4.co_id and crm1.ad_tcri = crm4.yymmdd
	where 1=1 '+@condition+' order by 評等日期 desc  ')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition" Name="condition" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />


            <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="危機大事紀" 
                style="font-weight: 700; color: #990000"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlCompanyEvent" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TEJ %>" 
                
                SelectCommand="EXEC('select replace(crm3.co_id + crm3.name8,'' '','''') as [公司] 
	,convert(varchar(10), cast(crm1.yymmdd as datetime), 111) as [事件日期] 
	,crm3.invoice as [公司統編] 
	,crm3.crmtcri+''('' +left(crm3.yymm_tcri,4)+''/''+RIGHT(crm3.yymm_tcri,2) +'')'' as [TCRI(評等年月)] 
	,crm1.rmk as [大綱] 
	,replace(crm2.content,''&amp;lt;br/&amp;gt;'',''&lt;br/&gt;'') as [說明] 
from crmprmk crm1 inner join (SELECT crm2.co_id,crm2.yymmdd,crm2.xno,STUFF((SELECT '''' +rmk + ''&lt;br/&gt;''  FROM crmprmk  crm1 WHERE crm1.co_id = crm2.co_id and crm1.yymmdd = crm2.yymmdd and crm1.xno = crm2.xno  and seq!='''' FOR XML PATH('''')), 1, 0, '''') content FROM crmprmk crm2 GROUP BY crm2.co_id,crm2.yymmdd,crm2.xno ) crm2  on crm1.co_id = crm2.co_id and crm1.yymmdd = crm2.yymmdd and crm1.xno = crm2.xno inner join crmstd crm3 on crm1.co_id = crm3.co_id and crm1.seq = ''''  where 1=1    '+@condition+'  order by 事件日期 desc ') 
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition2" Name="condition" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            


            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlCompanyEvent" EnableModelValidation="True" BorderColor="#DEBA84" 
                        Width="925px" EmptyDataText="查無危機公司大事紀資料">
                <Columns>
                    <asp:BoundField DataField="公司" HeaderText="公司" ReadOnly="True" 
                        SortExpression="公司" ItemStyle-Width="10%">
                    </asp:BoundField>
                    <asp:BoundField DataField="事件日期" HeaderText="事件日期" ReadOnly="True" 
                        SortExpression="事件日期" ItemStyle-Width="7%" >
                    </asp:BoundField>
                    <asp:BoundField DataField="公司統編" HeaderText="公司統編" 
                        SortExpression="公司統編" ItemStyle-Width="8%" >
                    </asp:BoundField>
                    <asp:BoundField DataField="TCRI(評等年月)" HeaderText="TCRI(評等年月)" ReadOnly="True" 
                        SortExpression="TCRI(評等年月)" ItemStyle-Width="10%" >
                    </asp:BoundField>
                    <asp:BoundField DataField="大綱" HeaderText="大綱" SortExpression="大綱" 
                        ItemStyle-Width="14%" >
                    </asp:BoundField>
                    <asp:BoundField DataField="說明" HeaderText="說明" ReadOnly="True" 
                        SortExpression="說明" ItemStyle-Width="51%" HtmlEncode="False"   >
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#A55129" ForeColor="White" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:GridView>
            


            <br />
            </span>
            
            <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="經營層更換" 
                style="font-weight: 700; color: #990000"></asp:Label>
            
            <br />
            
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" DataSourceID="SqlManagerChange" 
                EnableModelValidation="True" Width="794px" EmptyDataText="查無經營層更換資料 ">
                <Columns>
                    <asp:BoundField DataField="市場別" HeaderText="市場別" SortExpression="市場別" 
                        ItemStyle-Width="10%" ReadOnly="True">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="公司" HeaderText="公司" ReadOnly="True" 
                        SortExpression="公司" ItemStyle-Width="14%" >
<ItemStyle Width="14%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="統一編號" HeaderText="統一編號" 
                        SortExpression="統一編號" ItemStyle-Width="10%" >
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="現任董事長" SortExpression="現任董事長">
                        <ItemTemplate>
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Program/CustMgr/img/new.png" 
                                Visible='<%# VisableNew(Eval("現任董事長").ToString()) %>' />
                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("現任董事長") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("現任董事長") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="11%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="前任董事長" HeaderText="前任董事長" SortExpression="前任董事長" 
                        ItemStyle-Width="11%" >
<ItemStyle Width="11%"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="現任總經理" SortExpression="現任總經理">
                        <ItemTemplate>
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Program/CustMgr/img/new.png" 
                                Visible='<%# VisableNew(Eval("現任總經理").ToString()) %>' />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("現任總經理") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("現任總經理") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="11%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="前任總經理" HeaderText="前任總經理" SortExpression="前任總經理" 
                        ItemStyle-Width="11%" >
<ItemStyle Width="11%"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="現任財務長" SortExpression="現任財務長">
                        <ItemTemplate>
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Program/CustMgr/img/new.png" 
                                Visible='<%# VisableNew(Eval("現任財務長").ToString()) %>' />
                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("現任財務長") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("現任財務長") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemStyle Width="11%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="前任財務長" HeaderText="前任財務長" SortExpression="前任財務長" 
                        ItemStyle-Width="11%" >
<ItemStyle Width="11%"></ItemStyle>
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#A55129" ForeColor="White" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlManagerChange" runat="server" 
                ConnectionString="<%$ ConnectionStrings:TEJ %>" 
                
                
                
                SelectCommand=" EXEC('select CASE WHEN crm2.mkt=N''TSE'' THEN ''上市''
		WHEN crm2.mkt=N''OTC'' THEN ''上櫃'' 
		WHEN crm2.mkt=N''ROTC'' THEN ''興櫃'' 
		WHEN crm2.mkt=N''PUB'' THEN ''公發'' 
	    WHEN crm2.mkt=N''UNPUB'' THEN ''未公發'' 
		ELSE crm2.mkt  END as [市場別] 
		,replace( crm2.co_id + name8,''  '','' '') as [公司] 
		,crm2.invoice as [統一編號] 
		,crm1.pman1 as [現任董事長] 
		,crm1.pman2 as [前任董事長] 
		,crm1.qman1 as [現任總經理] 
		,crm1.qman2 as [前任總經理] 
		,crm1.fman1 as [現任財務長]
		,crm1.fman2 as [前任財務長] 
		from crmceo crm1 inner join crmstd crm2  on crm1.co_id = crm2.co_id 
		where (crm1.pman1 &lt;&gt; crm1.pman2 or crm1.qman1 &lt;&gt; crm1.qman2 or  fman1 &lt;&gt; fman2)
		 and 1=1    '+@condition+' ') 
		">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hidn_condition3" Name="condition" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:HiddenField ID="hidn_condition" runat="server" />
            <asp:HiddenField ID="hidn_condition2" runat="server" />
             <asp:HiddenField ID="hidn_condition3" runat="server" />
    </div>
    </form>
</body>
</html>

