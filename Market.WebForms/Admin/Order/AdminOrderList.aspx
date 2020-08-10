<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminOrderList.aspx.cs" Inherits="Market.WebForms.Admin.Order.AdminOrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:GridView ID="ctlOrderList" runat="server">
        </asp:GridView> 
        <asp:LinkButton ID="btnExport" runat="server" onclick="btnExport_Click">
            엑셀다운1(GridView의 값을 Excel로)</asp:LinkButton>    
        <br />
        <asp:LinkButton ID="btnExportExcelWithDataSet" runat="server" 
            onclick="btnExportExcelWithDataSet_Click">
            엑셀다운2(DataSet을 Excel로)</asp:LinkButton>   
</asp:Content>
