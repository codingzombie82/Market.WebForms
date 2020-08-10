<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowImages.aspx.cs" Inherits="Market.WebForms.ShowImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0">
                <tr>
                    <td align="center">
                        <a href="javascript:window.close()">
                            <asp:Image ID="imgProductImage" runat="server" BorderWidth="0" Width="400px" Height="400px"></asp:Image></a>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="button" value="닫기" onclick="window.close();" style="border: 1px solid silver">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
