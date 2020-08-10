<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AlsoBought.aspx.cs" Inherits="Market.WebForms.AlsoBought" %>

<%@ Register Src="~/Controls/AlsoBoughtUserControl.ascx" TagPrefix="uc1" TagName="AlsoBoughtUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AlsoBoughtUserControl runat="server" id="AlsoBoughtUserControl" />
</asp:Content>
