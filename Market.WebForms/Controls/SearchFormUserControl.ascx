<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchFormUserControl.ascx.cs" Inherits="Market.WebForms.Controls.SearchFormUserControl" %>
<img src="/images/search.gif" alt="상품검색" border="0" style="vertical-align: bottom;" />
검색:
<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="검색" CausesValidation="False" OnClick="btnSearch_Click">
</asp:Button>
