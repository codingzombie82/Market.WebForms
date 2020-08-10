<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReviewList.aspx.cs" Inherits="Market.WebForms.ReviewList" %>

<%@ Register Src="~/Controls/ReviewListUserControl.ascx" TagPrefix="uc1" TagName="ReviewListUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ReviewListUserControl runat="server" id="ReviewListUserControl" />
</asp:Content>
