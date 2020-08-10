<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="Market.WebForms.CategoryList" %>

<%@ Register Src="~/Controls/CategoryListUserControl.ascx" TagPrefix="uc1" TagName="CategoryListUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:CategoryListUserControl runat="server" ID="CategoryListUserControl" />
</asp:Content>
