<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.ascx.cs" Inherits="Market.WebForms.Controls.CategoryListUserControl" %>
<asp:DataList ID="ctlCategoryList" runat="server" CellPadding="5" CellSpacing="3" Width="100%" SelectedItemStyle-BackColor="Yellow" EnableViewState="false" RepeatColumns="2" RepeatDirection="Horizontal">
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "~/ProductsList.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&Selection=" + Container.ItemIndex %>' runat="server" />
    </ItemTemplate>
    <SelectedItemTemplate>
        <asp:HyperLink ID="HyperLink2" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "~/ProductsList.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&Selection=" + Container.ItemIndex %>' runat="server" />
    </SelectedItemTemplate>
    <SelectedItemStyle BackColor="DimGray" />
</asp:DataList>