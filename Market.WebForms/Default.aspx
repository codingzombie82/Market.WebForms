<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Market.WebForms.Default" %>

<%@ Register Src="~/Controls/ProductCatalogUserControl.ascx" TagPrefix="uc1" TagName="ProductCatalogUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ProductCatalogUserControl runat="server" ID="ProductCatalogUserControl" />
</asp:Content>
