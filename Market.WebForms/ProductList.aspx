<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Market.WebForms.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" width="100%">
    <tr>
        <td>
            <h1>
                카테고리에 따른 상품 리스트</h1>
            <asp:DataList ID="ctlProductsList" RepeatColumns="2" runat="server">
                <ItemTemplate>
                    <table border="0" width="300">
                        <tr>
                            <td width="100" valign="middle" align="right">
                                <a href='ProductDetails.aspx?ProductID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                    <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                                        width="100" height="100" border="0">
                                </a>
                            </td>
                            <td widtach="200" valign="middle">
                                <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                    <span class="ProductListHead">
                                        <%# Eval("ModelName") %>
                                    </span>
                                    <br />
                                </a><span class="ProductListItem"><b>판매가격 : </b>
                                    <%# DataBinder.Eval(Container.DataItem, "SellPrice", "{0}") %>원 </span>
                                <br />
                                <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                    <span class="ProductListItem"><span color="#9D0000"><b>장바구니 담기<b></span></span>
                                </a>
                                &nbsp;
                                <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>&State=Quick'>
                                    <span class="ProductListItem"><span color="#9D0000"><b>즉시 구매<b></span></span>
                                </a>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
</asp:Content>
