<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchForm.aspx.cs" Inherits="Market.WebForms.SearchForm" %>

<%@ Register Src="~/Controls/SearchFormUserControl.ascx" TagPrefix="uc1" TagName="SearchFormUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:SearchFormUserControl runat="server" ID="SearchFormUserControl" />
</asp:Content>
