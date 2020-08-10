<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Market.WebForms.Login" %>

<%@ Register Src="~/Controls/LoginUserControl.ascx" TagPrefix="uc1" TagName="LoginUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:LoginUserControl runat="server" ID="LoginUserControl" />
</asp:Content>
