<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrivilegeDesc.aspx.cs"
    Inherits="PrivilegeDesc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>權限說明</title>
    <link href="Site.css" rel="stylesheet" type="text/css" />        
    <style type="text/css">
        .style3
        {
            height: 16.5pt;
            width: 410pt;
            color: #0000FF;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style4
        {
            height: 16.5pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style5
        {
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style6
        {
            height: 16.5pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #E6B8B7;
        }
        .style7
        {
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: center;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            background: #E6B8B7;
        }
        .style8
        {
            height: 16.5pt;
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style9
        {
            width: 266pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: normal;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style10
        {
            width: 266pt;
            color: black;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: normal;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right: .5pt solid windowtext;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
            border-bottom: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
        }
        .style11
        {
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 新細明體, serif;
            text-align: general;
            vertical-align: bottom;
            white-space: nowrap;
            border: .5pt solid windowtext;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
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
                ID="lab_Title" Text="權限說明" runat="server"></asp:Label> </strong>
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
    <asp:Label ID="Label3" runat="server" style="font-weight: 700; color: #0000FF; font-size: medium;" 
        Text="您沒有權限使用此功能，相關權限說明請參照如下："></asp:Label>
    <br />
    <br />
    </form>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:
 collapse;width:410pt" width="546">
        <colgroup>
            <col style="mso-width-source:userset;mso-width-alt:6144;width:144pt" 
                width="192" />
            <col style="mso-width-source:userset;mso-width-alt:11328;width:266pt" 
                width="354" />
        </colgroup>
        <tr height="22">
            <td class="style3" colspan="2" height="22" style="mso-ignore: colspan;" 
                width="546">
                <strong>區營運處</strong></td>
        </tr>
        <tr height="22">
            <td class="style4" colspan="2" height="22" style="mso-ignore: colspan">
                處長、企業金融及個人金融組、一般支援組 ，職務代號如下表：</td>
        </tr>
        <tr height="22">
            <td class="style4" height="22">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr height="22">
            <td class="style6" height="22">
                職務代號</td>
            <td class="style7">
                職務名稱</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                510000</td>
            <td class="style9" width="354">
                區營運處處長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                511000</td>
            <td class="style10" width="354">
                企業金融組組長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                511001</td>
            <td class="style10" width="354">
                企業金融資深商品專員</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                511002</td>
            <td class="style10" width="354">
                電子金融專員</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                512000</td>
            <td class="style10" width="354">
                個人金融組組長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                512001</td>
            <td class="style10" width="354">
                個人金融商品專員</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                513000</td>
            <td class="style10" width="354">
                一般支援組組長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                513001</td>
            <td class="style10" width="354">
                作業組織管理員</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                513002</td>
            <td class="style10" width="354">
                預算及控管管理員</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                513003</td>
            <td class="style10" width="354">
                促銷管理員</td>
        </tr>
        <tr height="22">
            <td class="style4" height="22">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr height="22">
            <td class="style4" height="22">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr height="22">
            <td class="style4" colspan="2" height="22" style="mso-ignore: colspan">
                <span class="style1"><strong>總行單位</strong></span><br />
                國內營運處、國際營運處(*)、稽核處</td>
        </tr>
        <tr height="22">
            <td class="style4" height="22">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr height="22">
            <td class="style4" colspan="2" height="22" style="mso-ignore: colspan">
                國際營運處控管有權限之職務</td>
        </tr>
        <tr height="22">
            <td class="style6" height="22">
                職務代號</td>
            <td class="style7">
                職務名稱</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                190000</td>
            <td class="style11">
                國際營運處處長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                190001</td>
            <td class="style11">
                國際營運處副處長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                250003</td>
            <td class="style11">
                國際營運處副處長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                251300</td>
            <td class="style11">
                外匯管理科科長</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                251301</td>
            <td class="style11">
                外匯管理科襄理</td>
        </tr>
        <tr height="22">
            <td class="style8" height="22">
                251303</td>
            <td class="style11">
                外匯業務專員</td>
        </tr>
    </table>
</body>
</html>

