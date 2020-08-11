<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="QA.aspx.cs" Inherits="Market.WebForms.Admin.QA.QA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      실행할 SQL문을 입력 후 실행 버튼을 클릭하시오.<br />
        <br />
        <asp:TextBox ID="txtQuery" runat="server" TextMode="MultiLine" Height="439px" 
            Width="653px"></asp:TextBox>
        <br />
        <asp:Button ID="btnExecute" runat="server" Text="실행" 
            onclick="btnExecute_Click" />
</asp:Content>
