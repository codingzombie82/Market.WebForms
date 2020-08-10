<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="Market.WebForms.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <p>
        <strong>주문 정보</strong>
    </p>
    <p>

        <asp:Label ID="MyError" runat="Server" />
        <strong></strong>
    </p>
    <p>
        <asp:Panel ID="CustomerPanel" runat="server">
            <asp:DataGrid ID="MyList" runat="server" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt"
                ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead"
                Font-Size="9pt" Font-Name="Verdana" CellPadding="3" BorderColor="#CCCCCC" Width="500px"
                BorderStyle="None" BorderWidth="1px" BackColor="White" Font-Names="굴림">
                <footerstyle forecolor="#000066" cssclass="cartlistfooter" backcolor="White"></footerstyle>
                <selecteditemstyle font-bold="True" forecolor="White" backcolor="#669999"></selecteditemstyle>
                <alternatingitemstyle cssclass="CartListItemAlt"></alternatingitemstyle>
                <itemstyle forecolor="#000066" cssclass="CartListItem"></itemstyle>
                <headerstyle font-bold="True" forecolor="White" cssclass="CartListHead" backcolor="#006699">
            </headerstyle>
                <columns>
                <asp:BoundColumn DataField="OrderID" HeaderText="주문 번호"></asp:BoundColumn>
                <asp:BoundColumn DataField="OrderDate" HeaderText="주문 날짜" DataFormatString="{0:d}">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="TotalPrice" HeaderText="주문 금액" DataFormatString="{0:###,###}">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ShipDate" HeaderText="배송일" DataFormatString="{0:d}">
                </asp:BoundColumn>
                <asp:HyperLinkColumn Text="주문 상세 내역 보기" DataNavigateUrlField="OrderID" DataNavigateUrlFormatString="OrderDetails.aspx?OrderID={0}"
                    HeaderText="주문 상세 내역 보기"></asp:HyperLinkColumn>
            </columns>
                <pagerstyle horizontalalign="Left" forecolor="#000066" backcolor="White" mode="NumericPages">
            </pagerstyle>
            </asp:DataGrid>
        </asp:Panel>
        <br />
        <asp:Panel ID="NonCustomerPanel" runat="server">
        주문번호 :
        <asp:TextBox ID="txtOrderID" runat="server" ValidationGroup="OrderListForm"></asp:TextBox>(주문시
        부여받은 주문번호를 입력하시오.)
<br />
        주문비밀번호 :
        <asp:TextBox ID="txtPassword" runat="server" ValidationGroup="OrderListForm"></asp:TextBox>(주문시입력한
        주문비밀번호를 입력하시오.)
<br />
        <asp:Button ID="cmdOrderList" runat="server" Text="주문정보 확인" OnClick="cmdOrder_Click"
            ValidationGroup="OrderListForm"></asp:Button>
    </asp:Panel>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;<asp:RequiredFieldValidator ID="valOrderID" runat="server" ControlToValidate="txtOrderID"
            Display="None" ErrorMessage="주문번호를 입력하시오." ValidationGroup="OrderListForm"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword"
            Display="None" ErrorMessage="주문 비밀번호를 입력하시오." ValidationGroup="OrderListForm">
        </asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="valSummary" runat="server" ShowMessageBox="True" ShowSummary="False"
            ValidationGroup="OrderListForm" />
    </p>
</asp:Content>
