<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Agreement.aspx.cs" Inherits="Market.WebForms.Agreement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p><span>회원 이용 약관</span></p>
    <p>
        <asp:TextBox ID="txtAgreement" runat="server" TextMode="MultiLine" Height="224px" Width="470px"></asp:TextBox>
    </p>
    <p>
        <asp:CheckBox ID="chkConfirm" runat="server" Text="위 약관에 동의합니다."></asp:CheckBox>
    </p>
    <p>
        <asp:Button ID="cmdRegister" runat="server" Text="회원가입" OnClick="cmdRegister_Click"></asp:Button>
    </p>

</asp:Content>
