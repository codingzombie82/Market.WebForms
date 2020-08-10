<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductCatalog.aspx.cs" Inherits="Market.WebForms.ProductCatalog" %>

<%@ Register Src="~/Controls/ProductCatalogUserControl.ascx" TagPrefix="uc1" TagName="ProductCatalogUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProductCatalogUserControl runat="server" id="ProductCatalogUserControl" />
</asp:Content>
