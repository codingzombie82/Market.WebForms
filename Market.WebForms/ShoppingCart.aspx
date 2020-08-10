<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Market.WebForms.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" style="width: 100%">
    <tr>
        <td>
            <h1>
                장바구니(쇼핑카트)</h1>
        </td>
    </tr>
</table>
<br />
<br />
<div align="center">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table cellspacing="0" cellpadding="5" width="100%" border="0">
                <tr valign="top">
                    <td align="center" width="100%">
                        <asp:GridView ID="ctlShoppingCartList" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="Quantity" Width="100%" OnRowDataBound="ctlShoppingCartList_RowDataBound"
                            ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="선택">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Select" runat="server" AutoPostBack="true" OnCheckedChanged="SelectedTotal" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="제품번호">
                                    <ItemTemplate>
                                        <asp:Label ID="ProductID" runat="server" Text='<%# Eval("ProductID") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle Height="30px" HorizontalAlign="Center" Width="60px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ModelName" HeaderText="상품명">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ModelNumber" HeaderText="모델번호">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="수량" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:TextBox ID="Quantity" runat="server" Columns="4" MaxLength="3" Text='<%# Eval("Quantity") %>'
                                            Width="30px" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SellPrice" HeaderText="가격" ItemStyle-Width="50px" DataFormatString="{0:###,###}">
                                    <ItemStyle Font-Names="굴림" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ExtendedAmount" HeaderText="합계" ItemStyle-Width="50px"
                                    DataFormatString="{0:###,###}">
                                    <ItemStyle Font-Names="굴림" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="삭제" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="Remove" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <table width="100%">
                            <tr>
                                <td style="width: auto;">
                                    선택된 자료 합계:
                                </td>
                                <td style="width: 50px;">
                                    <asp:Label ID="lblQuantitySelectedTotal" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 50px;">
                                    <asp:Label ID="lblPriceSelectedTotal" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 50px;">
                                    <asp:Label ID="lblExtendedSelectedAmountTotal" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 30px;">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <span>합계: </span>
                        <asp:Label ID="lblTotal" runat="server" EnableViewState="false" Font-Names="굴림"></asp:Label>원<br />
                        <br />
                        <asp:Button ID="btnUpdateShoppingCart" runat="server" Text="장바구니 수정" OnClick="btnUpdateShoppingCart_Click">
                        </asp:Button>&nbsp;
                        <asp:Button ID="btnCheckOut" runat="server" Text="주문하기" OnClick="btnCheckOut_Click">
                        </asp:Button><br />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div align="center">
                <img height="137" src="/images/cart_noitem.gif" width="109"></div>
        </asp:View>
    </asp:MultiView><br />
    <asp:Label ID="lblErrorMessage" runat="Server" EnableViewState="false"></asp:Label>
</div>
<br />
<br />
</asp:Content>
