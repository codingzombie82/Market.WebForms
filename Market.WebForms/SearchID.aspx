<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchID.aspx.cs" Inherits="Market.WebForms.SearchID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            아이디 찾기<br />
            이름 :
            <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
            <br />
            주민등록 번호 :
            <asp:TextBox ID="txtSsn1" runat="server" Width="73px"></asp:TextBox>
            -<asp:TextBox ID="txtSsn2" runat="server" Width="87px"></asp:TextBox>
            <br />
            <asp:Button ID="btnSearchID" runat="server" OnClick="btnSearchID_Click" Text="찾기" />
            <br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
