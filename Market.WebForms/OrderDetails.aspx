<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="Market.WebForms.OrderDetailsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <strong>주문 상세 내역</strong></p>
<p>
    <asp:Label ID="MyError" runat="Server" EnableViewState="false" CssClass="ErrorText"></asp:Label></p>
<p>
    <asp:Panel ID="DetailsPanel" runat="server">
        <strong>주문 번호 :&nbsp;
            <asp:Label ID="lblOrderNumber" runat="server" EnableViewState="false"></asp:Label><br />
            주문 날짜 : </strong>
        <asp:Label ID="lblOrderDate" runat="server" EnableViewState="false"></asp:Label><br />
        <b>배송 날짜 :&nbsp;</b>
        <asp:Label ID="lblShipDate" runat="server" EnableViewState="false"></asp:Label>
        <asp:DataGrid ID="GridControl1" runat="server" Font-Names="굴림" BackColor="White"
            BorderWidth="1px" BorderStyle="None" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt"
            ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead"
            Font-Size="9pt" Font-Name="Verdana" CellPadding="3" BorderColor="#CCCCCC" Width="500px">
            <FooterStyle ForeColor="#000066" CssClass="cartlistfooter" BackColor="White"></FooterStyle>
            <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
            <AlternatingItemStyle CssClass="CartListItemAlt"></AlternatingItemStyle>
            <ItemStyle ForeColor="#000066" CssClass="CartListItem"></ItemStyle>
            <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="CartListHead" BackColor="#006699">
            </HeaderStyle>
            <Columns>
                <asp:BoundColumn DataField="ModelName" HeaderText="상품명"></asp:BoundColumn>
                <asp:BoundColumn DataField="ModelNumber" HeaderText="모델번호"></asp:BoundColumn>
                <asp:BoundColumn DataField="Quantity" HeaderText="수량"></asp:BoundColumn>
                <asp:BoundColumn DataField="SellPrice" HeaderText="가격" DataFormatString="{0:###,###}">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ExtendedAmount" HeaderText="소계" DataFormatString="{0:###,###}">
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="#000066" BackColor="White" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid><br />
        <b>총합 : </b>
        <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
    </asp:Panel>
</p>
</asp:Content>
