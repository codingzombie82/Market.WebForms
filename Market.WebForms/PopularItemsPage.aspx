<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PopularItemsPage.aspx.cs" Inherits="Market.WebForms.PopularItemsPage" %>

<%@ Register Src="~/Controls/PopularItems.ascx" TagPrefix="uc1" TagName="PopularItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:PopularItems runat="server" id="PopularItems" />
</asp:Content>
