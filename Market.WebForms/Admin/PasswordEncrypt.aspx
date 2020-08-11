<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordEncrypt.aspx.cs" Inherits="Market.WebForms.Admin.PasswordEncrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
<p>패스워드 암호화 테스트</p>

암호화시킬 문자열:
<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
<asp:Button ID="btnCreate" runat="server" Text="암호화 문자열 생성" 
        onclick="btnCreate_Click" />
<br />
<asp:Label ID="lblPassword" runat="server"></asp:Label> 
        </div>
    </form>
</body>
</html>
