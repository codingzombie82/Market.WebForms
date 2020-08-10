<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckLogin.aspx.cs" Inherits="Market.WebForms.CheckLogin" %>

<%@ Register Src="~/Controls/LoginUserControl.ascx" TagPrefix="uc1" TagName="LoginUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="1" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <h3>회원 로그인</h3></td>
    </tr>
    <tr>
        <td>
<uc1:LoginUserControl runat="server" id="LoginUserControl" />
        </td>
    </tr>
</table>
<br />
<br />
<table border="1" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <strong>비회원 구매</strong></td>
    </tr>
    <tr>
        <td>
            <p>
                <asp:Button ID="cmdGuestLogin" runat="server" Text="비회원 주문" CausesValidation="False"
                    OnClick="cmdGuestLogin_Click"></asp:Button></p>
        </td>
    </tr>
</table>
</asp:Content>
