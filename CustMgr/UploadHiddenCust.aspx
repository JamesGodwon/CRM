<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadHiddenCust.aspx.cs"
    Inherits="UploadHiddenCust" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>潛在客戶名單上傳</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
</head>
<body>
    <form id="form1" runat="server">
    <div>                 
            <table border="2" cellpadding="2" cellspacing="2" width="720">
                <td class="style2">
                    <img alt=""  src="彰銀圖.gif" style="vertical-align: text-align: center" 
                        width="50" />
                </td>
                <td colspan=3>
                    <span><strong>
                    <asp:Label
                ID="lab_Title" Text="潛在客戶名單上傳" runat="server"></asp:Label> </strong>
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
            <strong>
                <asp:HiddenField ID="hidn_EmpNo" runat="server" />
            </strong>
            </span>
    </div>
    <asp:Label ID="Label5" runat="server" Text="客戶種類統計"></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="dsGetCustNum" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="種類" HeaderText="種類" ReadOnly="True" 
                SortExpression="種類" />
            <asp:BoundField DataField="客戶數" HeaderText="客戶數" ReadOnly="True" 
                SortExpression="客戶數" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsGetCustNum" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        SelectCommand="SELECT '全部' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST UNION SELECT '已解散公司' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_4 WHERE (DISSOLVEDATE IS NOT NULL) UNION SELECT '有效戶' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_4 WHERE (DISSOLVEDATE IS NULL)">
    </asp:SqlDataSource>
    <asp:Label ID="Label6" runat="server" Text="有效戶統計"></asp:Label>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="dsGetCustNum0" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="種類" HeaderText="種類" ReadOnly="True" 
                SortExpression="種類" />
            <asp:BoundField DataField="客戶數" HeaderText="客戶數" ReadOnly="True" 
                SortExpression="客戶數" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsGetCustNum0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        SelectCommand="SELECT '授信戶' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_3 WHERE (CUSTTYPE = 1) AND (DISSOLVEDATE IS NULL) UNION SELECT '純存款戶A(台外幣存款月平均餘額&gt;=1千萬)' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_2 WHERE (CUSTTYPE = 2) AND (DISSOLVEDATE IS NULL) UNION SELECT '純存款戶B(台外幣存款月平均餘額&lt;1千萬)' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_2 WHERE (CUSTTYPE = 5) AND (DISSOLVEDATE IS NULL) UNION SELECT '催呆戶' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_1 WHERE (CUSTTYPE = 4) AND (DISSOLVEDATE IS NULL) UNION SELECT '非彰銀客戶' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST WHERE (CUSTTYPE = 3) AND (DISSOLVEDATE IS NULL) UNION SELECT '有效戶' AS 種類, COUNT(1) AS 客戶數 FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_4 WHERE (DISSOLVEDATE IS NULL)">
    </asp:SqlDataSource>
    <asp:Label ID="Label7" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="修改解散日期"></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" Text="統一編號"></asp:Label>
    <asp:TextBox ID="txt_UpdateSerno" runat="server"></asp:TextBox>
    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click1" 
        Text="確定修改" />
    <asp:Label ID="lab_State0" runat="server" 
        style="font-weight: 700; color: #0000FF"></asp:Label>
    <br />
    <asp:Label ID="Label9" runat="server" Text="解散日期"></asp:Label>
    <asp:TextBox ID="txt_DISSOLVEDATE" runat="server"></asp:TextBox>
    <asp:Label ID="Label10" runat="server" Text="西元年(YYYYMMDD)，空白表示清除解散日期"></asp:Label>
    <br />
    <asp:Label ID="Label12" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="刪除異常資料"></asp:Label>
    <br />
    <asp:Label ID="Label14" runat="server" Text="統一編號"></asp:Label>
    <asp:TextBox ID="txt_DelSerno" runat="server"></asp:TextBox>
    <asp:Button ID="btnDelError" runat="server" onclick="btnUpdate_Click" 
        Text="確定刪除" />
    <asp:Label ID="lab_State1" runat="server" 
        style="font-weight: 700; color: #0000FF"></asp:Label>
    <br />
    <asp:Label ID="Label11" runat="server" style="font-weight: 700; color: #0000FF" 
        Text="潛在客戶名單上傳"></asp:Label>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btn_Upload" runat="server" onclick="Button1_Click" Text="上傳" />
    <asp:SqlDataSource ID="dsHiddenCustModify" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="truncate table CUSTMGR_HIDDENCUST_PRE" 
        
        
        UpdateCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [CHANGEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @CHANGEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, CHANGEDATE = @CHANGEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="CHANGEDATE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btn_Change" runat="server" onclick="btn_Change_Click" 
        Text="開始更新" />
    <asp:SqlDataSource ID="dsModifyCustType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST] SET DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="SELECT '1' AS Expr1" 
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST
SET CUSTTYPE = @CUSTTYPE
WHERE SERNO=@SERNO">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CUSTTYPE" />
            <asp:Parameter Name="SERNO" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUpdateDISSOLVEDATE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST] SET DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="SELECT '1' AS Expr1" 
        
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST SET DISSOLVEDATE = @DISSOLVEDATE WHERE (SERNO = @SERNO)">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txt_DISSOLVEDATE" Name="DISSOLVEDATE" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_UpdateSerno" Name="SERNO" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHiddenCustModify0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="SELECT COUNT(1) AS num FROM CUSTMGR_HIDDENCUST_PRE" 
        
        
        
        UpdateCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [CHANGEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @CHANGEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, CHANGEDATE = @CHANGEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="CHANGEDATE" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsDelErrorData" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        
        DeleteCommand="DELETE FROM CUSTMGR_HIDDENCUST WHERE (SERNO = @SERNO)" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="SELECT '1' AS Expr1" 
        
        
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST SET DISSOLVEDATE = @DISSOLVEDATE WHERE (SERNO = @SERNO)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="txt_DelSerno" Name="SERNO" 
                PropertyName="Text" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txt_DISSOLVEDATE" Name="DISSOLVEDATE" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_UpdateSerno" Name="SERNO" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lab_State" runat="server" 
        style="font-weight: 700; color: #0000FF"></asp:Label>
    <asp:SqlDataSource ID="dsHiddenCustModifyAfter" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" 
        
        InsertCommand="INSERT INTO CUSTMGR_HIDDENCUST(SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, SETDATE, CHANGEDATE, DISSOLVEDATE) SELECT SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, SETDATE, CHANGEDATE, DISSOLVEDATE FROM CUSTMGR_HIDDENCUST_PRE WHERE (SERNO NOT IN (SELECT DISTINCT SERNO FROM CUSTMGR_HIDDENCUST AS CUSTMGR_HIDDENCUST_1))" SelectCommand="SELECT BATCHNUMBER, SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, CAPITAL/ 1000 AS CAPITALDISPLAY, SETDATE, CHANGEDATE, DISSOLVEDATE, BUILDDATE, MODIFYDATE, CUSTTYPE FROM CUSTMGR_HIDDENCUST_PRE" 
        
        
        
        
        UpdateCommand="UPDATE CUSTMGR_HIDDENCUST SET SERNO = c.SERNO, ENTNAME = c.ENTNAME, ENTADDRESS = c.ENTADDRESS, CONTRACTPEOPLE = c.CONTRACTPEOPLE, CAPITAL = c.CAPITAL, CHANGEDATE = c.CHANGEDATE, SETDATE = c.SETDATE, DISSOLVEDATE = c.DISSOLVEDATE, MODIFYDATE = CONVERT ([char] (8), GETDATE(), 112) FROM (SELECT a.SERNO, a.ENTNAME, a.ENTADDRESS, a.CONTRACTPEOPLE, a.CAPITAL, ISNULL(a.SETDATE, b.SETDATE) AS SETDATE, ISNULL(a.CHANGEDATE, b.CHANGEDATE) AS CHANGEDATE, ISNULL(a.DISSOLVEDATE, b.DISSOLVEDATE) AS DISSOLVEDATE FROM CUSTMGR_HIDDENCUST_PRE AS a INNER JOIN CUSTMGR_HIDDENCUST AS b ON a.SERNO = b.SERNO) AS c INNER JOIN CUSTMGR_HIDDENCUST ON c.SERNO = CUSTMGR_HIDDENCUST.SERNO">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHiddenCustChangeDISSOLVEDATE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        
        
        
        DeleteCommand="IF NOT EXISTS (SELECT SERNO FROM [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] WHERE SERNO = @SERNO) INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] ([SERNO] , [ENTNAME] , [ENTADDRESS] , [CONTRACTPEOPLE] , [CAPITAL] , [SETDATE] , [DISSOLVEDATE]) VALUES (@SERNO, @ENTNAME, @ENTADDRESS, @CONTRACTPEOPLE, @CAPITAL, @SETDATE, @DISSOLVEDATE) ELSE UPDATE [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE] SET SERNO = @SERNO, ENTNAME = @ENTNAME, ENTADDRESS = @ENTADDRESS, CONTRACTPEOPLE = @CONTRACTPEOPLE, CAPITAL = @CAPITAL, SETDATE = @SETDATE, DISSOLVEDATE = @DISSOLVEDATE, MODIFYDATE = CONVERT([char](8), getdate(), (112)) WHERE SERNO = @SERNO" InsertCommand="IF not exists(SELECT SERNO from [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
WHERE SERNO = @SERNO)
INSERT INTO [iom].[dbo].[CUSTMGR_HIDDENCUST_PRE]
           ([SERNO]
           ,[ENTNAME]
           ,[ENTADDRESS]
           ,[CONTRACTPEOPLE]
           ,[CAPITAL]
           ,[SETDATE]                      
           )
     VALUES
           (@SERNO
           ,@ENTNAME
           ,@ENTADDRESS
           ,@CONTRACTPEOPLE
           ,@CAPITAL
           ,@SETDATE
           )   " SelectCommand="SELECT 1 AS Expr1 FROM CUSTMGR_HIDDENCUST_PRE" 
        
        
        
        UpdateCommand="update CUSTMGR_HIDDENCUST set DISSOLVEDATE=@DISSOLVEDATE WHERE SERNO = @SERNO">
        <DeleteParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
            <asp:Parameter Name="DISSOLVEDATE" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SERNO" />
            <asp:Parameter Name="ENTNAME" />
            <asp:Parameter Name="ENTADDRESS" />
            <asp:Parameter Name="CONTRACTPEOPLE" />
            <asp:Parameter Name="CAPITAL" />
            <asp:Parameter Name="SETDATE" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="txt_DISSOLVEDATE" Name="DISSOLVEDATE" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_UpdateSerno" Name="SERNO" 
                PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
        CellPadding="3" CellSpacing="2" DataKeyNames="BATCHNUMBER" DataSourceID="dsHiddenCustModifyAfter"
        EnableModelValidation="True" PageSize="100" 
        AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="BATCHNUMBER" HeaderText="流水號" InsertVisible="False" ReadOnly="True"
                SortExpression="BATCHNUMBER" />
            <asp:BoundField DataField="SERNO" HeaderText="統一編號" SortExpression="SERNO" />
            <asp:TemplateField HeaderText="公司名稱" SortExpression="ENTNAME">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("ENTNAME") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ENTNAME") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ENTADDRESS" HeaderText="登記地址" 
                SortExpression="ENTADDRESS" />
            <asp:BoundField DataField="CONTRACTPEOPLE" HeaderText="代表人" SortExpression="CONTRACTPEOPLE" />
            <asp:BoundField DataField="CAPITALDISPLAY" DataFormatString="{0:0,0}" 
                HeaderText="資本額(千元)" SortExpression="CAPITALDISPLAY" />
            <asp:BoundField DataField="SETDATE" HeaderText="核准設立日期" SortExpression="SETDATE" />
            <asp:BoundField DataField="CHANGEDATE" HeaderText="核准變更日期" SortExpression="CHANGEDATE" />
            <asp:BoundField DataField="DISSOLVEDATE" HeaderText="核准解散日期" 
                SortExpression="DISSOLVEDATE" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Wrap="False" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    </form>
</body>
</html>

