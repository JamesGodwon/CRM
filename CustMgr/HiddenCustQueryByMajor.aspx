<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HiddenCustQueryByMajor.aspx.cs"
    Inherits="HiddenCustQueryByMajor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>潛在客戶名單整批查詢</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <style type="text/css">


INPUT
{  
    FONT-SIZE:13px;
    COLOR:black;
    BACKGROUND-COLOR:white;
    }

    </style>
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
                ID="lab_Title" Text="潛在客戶名單整批查詢" runat="server"></asp:Label> </strong>
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
    <asp:HiddenField ID="hidn_BRNO" runat="server" />
        <asp:BulletedList ID="BulletedList1" runat="server" Style="font-weight: 700; color: #0000FF">
            <asp:ListItem>單次上傳查詢比數建議勿超過一千筆,否則查詢速度可能過慢</asp:ListItem>
            <asp:ListItem>資料格式:一行一個客戶統編</asp:ListItem>
        </asp:BulletedList>
        <asp:Label ID="Label7" runat="server" Style="font-weight: 700; color: #3366FF" Text="上傳查詢文字檔："></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btn_Updata" runat="server" OnClick="btn_Updata_Click" Text="匯出Excel" />
        <asp:Label ID="Lab_State" runat="server" Style="font-weight: 700; color: #FF3300"></asp:Label>
    <asp:SqlDataSource ID="dsQueryHiddenCust1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:chb_iom %>" 
        SelectCommand="SELECT e.BATCHNUMBER AS 流水號, CASE a.CUSTTYPE WHEN 1 THEN '授信戶' WHEN 2 THEN '純存款戶A' WHEN 3 THEN '非彰銀客戶' WHEN 4 THEN '催呆戶' WHEN 5 THEN '純存款戶B' ELSE CAST(a.CUSTTYPE AS VARCHAR(1)) END AS 客戶種類, c.VISITDATE AS 最新拜訪日期, e.SERNO AS 統一編號, CASE WHEN b.mkt = N'TSE' THEN '上市/' + co_id WHEN b.mkt = N'OTC' THEN '上櫃/' + co_id WHEN b.mkt = N'ROTC' THEN '興櫃/' + co_id WHEN b.mkt = N'PUB' THEN '公發/' + co_id ELSE mkt + '/' + co_id END AS [上市別 / 代號], a.ENTNAME AS 公司名稱, a.CONTRACTPEOPLE AS 代表人, ISNULL(a.CAPITAL, 0) AS [資本額(千元)], a.SETDATE AS 設立日期, a.CHANGEDATE AS 變更日期, a.ENTADDRESS AS 登記地址, a.TELFIRST AS 電話一, a.TELSECOND AS 電話二, a.OTHERADDRESS AS 聯絡地址, b.chief AS 董事長, b.president AS 總經理, b.spokes2 AS 財務經理, b.phone AS 電話, b.gop_na AS 集團名稱, b.chi_add AS 地址, b.btindnm AS 主要產品, b.yymm_tcri AS TCRI財報年月, b.sicsnm AS 產業名稱, b.crmtcri AS TCRI評等, b.ad_tcri AS 評等日, d.Risk_Amt AS [風險額度(千元)], d.Lon_Amt AS [放款平均餘額(千元)], d.Use_Rate AS [動撥率(%)], d.Lon_CRC AS 區, d.Lon_Branch_Nbr AS 代號, d.Lon_Branch_Name AS 放款分行, d.Twd_Lon_Amt AS [台幣平均放款餘額(千元)], d.Fex_Lon_Amt AS [外幣平均放款餘額(千元)], d.Dep_CRC AS [區 ], d.Dep_Branch_Nbr AS [代號 ], d.Dep_Branch_Name AS 存款分行, CAST(d.Twd_Dep_Amt AS decimal) + CAST(d.Fex_Dep_Amt AS decimal) AS [存款平均餘額(千元)], d.Twd_Dep_Amt AS [台幣平均存款餘額(千元)], d.Fex_Dep_Amt AS [外幣平均存款餘額(千元)], d.Primary_Party_ID AS 母公司統編, d.JCIC_Data_Month AS 聯徵時間, d.Lon_Market_Share_Rate AS [放款市佔率(%)], d.OTHER_Bal_Amt AS [他行庫總餘額(千元)], d.Final_Rating AS 信用評等 FROM CUSTMGR_HIDDENCUST_QUERY AS e LEFT OUTER JOIN CUSTMGR_HIDDENCUST_LOOK AS a ON a.SERNO = e.SERNO LEFT OUTER JOIN crmstd AS b ON a.SERNO = b.invoice LEFT OUTER JOIN (SELECT MAX(VISITDATE) AS VISITDATE, SERNO FROM CUSTMGR_DIARY GROUP BY SERNO) AS c ON a.SERNO = c.SERNO LEFT OUTER JOIN CUST_EFFECTS_CORP AS d ON a.SERNO = d.Party_Id WHERE (a.DISSOLVEDATE IS NULL OR a.DISSOLVEDATE = '') AND (a.CUSTTYPE &lt;&gt; 4)" 
        DeleteCommand="TRUNCATE TABLE CUSTMGR_HIDDENCUST_LOOK" 
        
        InsertCommand="INSERT INTO CUSTMGR_HIDDENCUST_LOOK(SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, SETDATE, CHANGEDATE, DISSOLVEDATE, BUILDDATE, MODIFYDATE, CUSTTYPE, TELFIRST, TELSECOND, OTHERADDRESS) SELECT SERNO, ENTNAME, ENTADDRESS, CONTRACTPEOPLE, CAPITAL, SETDATE, CHANGEDATE, DISSOLVEDATE, BUILDDATE, MODIFYDATE, CUSTTYPE, TELFIRST, TELSECOND, OTHERADDRESS FROM CUSTMGR_HIDDENCUST WHERE (SERNO IN (SELECT SERNO FROM CUSTMGR_HIDDENCUST_QUERY)) AND (CUSTTYPE &lt;&gt; 4)">
    </asp:SqlDataSource>
    </form>
</body>
</html>

