<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PasswordReminder.aspx.cs" Inherits="Market.WebForms.PasswordReminder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <p>
      <span>비밀번호 찾기</span></p>
    <p>
      <span>이름&nbsp;:
        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox><br />
        주민등록번호 :
        <asp:TextBox ID="txtSsn1" runat="server"></asp:TextBox>-
        <asp:TextBox ID="txtSsn2" runat="server"></asp:TextBox></span></p>
    <p>
      <span>
        <asp:Button ID="cmdFind" runat="server" Text="가입시 이메일로 패스워드 받기" OnClick="cmdFind_Click">
        </asp:Button></p>
    <span>
      <p>
        <asp:Label ID="lblDisplay" runat="server"></asp:Label></p>
      <p>
        &nbsp;</p>
    </span>
</asp:Content>
