<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EventNames.aspx.cs" Inherits="Market.WebForms.EventNames" %>

<%@ Register Src="~/Controls/EventNamesUserControl.ascx" TagPrefix="uc1" TagName="EventNamesUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:EventNamesUserControl runat="server" ID="EventNamesUserControl" EventsName="New"/>
    <uc1:EventNamesUserControl runat="server" ID="EventNamesUserControl1"  EventsName="Hit"/>
</asp:Content>
