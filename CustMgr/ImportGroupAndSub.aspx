<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportGroupAndSub.aspx.cs"
    Inherits="ImportGroupAndSub" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>匯入集團子企業資料</title>
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
                ID="lab_Title" Text="匯入集團及分子企業資料" runat="server"></asp:Label> </strong>
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
            </strong></span>
    </div>
    <asp:Label ID="labNote" runat="server" style="font-weight: 700; color: #3333CC"></asp:Label>
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="匯入" onclick="Button1_Click" />
    <asp:SqlDataSource ID="dsUpdateGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_GROUP] WHERE [ENTSERNOMAIN] = @ENTSERNOMAIN" 
        InsertCommand="INSERT INTO [CUSTMGR_GROUP] ([GROUPNO], [GROUPNAME], [ENTSERNOMAIN], [ENTNAMEMAIN], [CRCNO], [MGRBRNO], [GAOEMPID], [BUILDDATE], [MODIFYDATE], [EDITEMPID]) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @ENTNAMEMAIN, @CRCNO, @MGRBRNO, @GAOEMPID, @BUILDDATE, @MODIFYDATE, @EDITEMPID)" 
        SelectCommand="SELECT * FROM [CUSTMGR_GROUP]" 
        UpdateCommand="IF(EXISTS (SELECT 1 FROM [iom].[dbo].[CUSTMGR_GROUP] WHERE ENTSERNOMAIN = @ENTSERNOMAIN)) UPDATE [iom].[dbo].[CUSTMGR_GROUP] SET [GROUPNO] = @GROUPNO , [GROUPNAME] = @GROUPNAME , [ENTNAMEMAIN] = @ENTNAMEMAIN , [CRCNO] = @CRCNO , [MGRBRNO] = @MGRBRNO ,[GAOEMPID] = @GAOEMPID ,[MODIFYDATE] = CONVERT ([char](8),getdate(),(112) ), EDITEMPID=@EDITEMPID WHERE ENTSERNOMAIN=@ENTSERNOMAIN ELSE INSERT INTO [iom].[dbo].[CUSTMGR_GROUP] ([GROUPNO] , [GROUPNAME] , [ENTSERNOMAIN] , [ENTNAMEMAIN] , [CRCNO] , [MGRBRNO] , [GAOEMPID],[EDITEMPID]) VALUES (@GROUPNO, @GROUPNAME, @ENTSERNOMAIN, @ENTNAMEMAIN, @CRCNO, @MGRBRNO, @GAOEMPID,@EDITEMPID)">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GROUPNO" Type="String" />
            <asp:Parameter Name="GROUPNAME" Type="String" />
            <asp:Parameter Name="ENTSERNOMAIN" Type="String" />
            <asp:Parameter Name="ENTNAMEMAIN" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="GAOEMPID" Type="String" />
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:Parameter Name="EDITEMPID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ENTSERNOMAIN" />
            <asp:Parameter Name="GROUPNO" />
            <asp:Parameter Name="GROUPNAME" />
            <asp:Parameter Name="ENTNAMEMAIN" />
            <asp:Parameter Name="CRCNO" />
            <asp:Parameter Name="MGRBRNO" />
            <asp:Parameter Name="GAOEMPID" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsUpdateSubEnt" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        DeleteCommand="DELETE FROM [CUSTMGR_SUBENTERPRISE] WHERE [ENTSERNOSUB] = @ENTSERNOSUB" 
        InsertCommand="INSERT INTO [CUSTMGR_SUBENTERPRISE] ([GROUPNO], [ENTSERNOSUB], [ENTNAMESUB], [CRCNO], [MGRBRNO], [BUILDDATE], [MODIFYDATE], [EDITEMPID]) VALUES (@GROUPNO, @ENTSERNOSUB, @ENTNAMESUB, @CRCNO, @MGRBRNO, @BUILDDATE, @MODIFYDATE, @EDITEMPID)" 
        SelectCommand="SELECT * FROM [CUSTMGR_SUBENTERPRISE]" 
        UpdateCommand="IF(EXISTS (SELECT 1 FROM [iom].[dbo].[CUSTMGR_SUBENTERPRISE] WHERE ENTSERNOSUB = @ENTSERNOSUB)) UPDATE [iom].[dbo].[CUSTMGR_SUBENTERPRISE] SET [GROUPNO] = @GROUPNO ,[ENTNAMESUB] = @ENTNAMESUB ,[CRCNO] = @CRCNO ,[MGRBRNO] = @MGRBRNO ,[MODIFYDATE] = CONVERT([char](8),getdate(),(112)) , EDITEMPID=@EDITEMPID WHERE ENTSERNOSUB=@ENTSERNOSUB ELSE INSERT INTO [iom].[dbo].[CUSTMGR_SUBENTERPRISE] ([GROUPNO] ,[ENTSERNOSUB] ,[ENTNAMESUB] ,[CRCNO] ,[MGRBRNO],[EDITEMPID] ) VALUES (@GROUPNO ,@ENTSERNOSUB ,@ENTNAMESUB ,@CRCNO ,@MGRBRNO,@EDITEMPID )">
        <DeleteParameters>
            <asp:Parameter Name="ENTSERNOSUB" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GROUPNO" Type="String" />
            <asp:Parameter Name="ENTSERNOSUB" Type="String" />
            <asp:Parameter Name="ENTNAMESUB" Type="String" />
            <asp:Parameter Name="CRCNO" Type="String" />
            <asp:Parameter Name="MGRBRNO" Type="String" />
            <asp:Parameter Name="BUILDDATE" Type="String" />
            <asp:Parameter Name="MODIFYDATE" Type="String" />
            <asp:Parameter Name="EDITEMPID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ENTSERNOSUB" />
            <asp:Parameter Name="GROUPNO" />
            <asp:Parameter Name="ENTNAMESUB" />
            <asp:Parameter Name="CRCNO" />
            <asp:Parameter Name="MGRBRNO" />
            <asp:ControlParameter ControlID="hidn_EmpNo" Name="EDITEMPID" 
                PropertyName="Value" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lab_Status" runat="server" 
        style="font-weight: 700; color: #FF0000"></asp:Label>
    </form>
</body>
</html>

