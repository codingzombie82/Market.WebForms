<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="Market.WebForms.Company" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:Xml ID="xmlCompany" runat="server" DocumentSource="~/Company.xml" TransformSource="~/Company.xsl"></asp:Xml>    
    </div>


</asp:Content>
