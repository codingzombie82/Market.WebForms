<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductPages.aspx.cs" Inherits="Market.WebForms.ProductPages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<h1>전체 상품 리스트</h1>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="2" RepeatLayout="Table">
    <ItemTemplate>
        <asp:HyperLink ID="lnkProductPage" runat="server"
            NavigateUrl='<%# "~/ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>        
            <asp:Image ID="imgProductPage" runat="server" 
                Width="100" Height="100"
                ImageUrl='<%# "~/ProductImages/thumbs/" + Eval("ProductImage")  %>'/>
            <br />
            <%# Eval("ModelName") %>
            <br />
            <%# String.Format("{0:C}", Eval("SellPrice")) %>
        </asp:HyperLink>
    </ItemTemplate>    
</asp:DataList>
</asp:Content>
