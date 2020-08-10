<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigator.ascx.cs" Inherits="Market.WebForms.Controls.Navigator" %>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" Orientation="Horizontal"
                StaticSubMenuIndent="10px" Width="100%" Height="30px">
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
                <DynamicMenuStyle BackColor="#FFFBD6" />
                <StaticSelectedStyle BackColor="#FFCC66" />
                <DynamicSelectedStyle BackColor="#FFCC66" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#990000" ForeColor="White" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/Default.aspx" Text="HOME" Value="HOME">
                        <asp:MenuItem NavigateUrl="~/CategoryAdd.aspx" Text="카테고리 등록" Value="카테고리 등록"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ProductAdd.aspx" Text="상품 등록" Value="상품 등록"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/ProductPages.aspx" Text="전체 상품 리스트" Value="전체 상품 리스트"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Admin/Notice/Write.aspx" Text="공지사항 등록" Value="공지사항 등록"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Survey/SurveyWrite.aspx" Text="설문 등록" Value="설문 등록"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Notice/List.aspx" Text="공지사항" Value="새 항목"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/PublicSchedule/schedulelist.aspx" Text="사이트일정" Value="새 항목">
                    </asp:MenuItem>
                    <asp:MenuItem Text="회사소개" Value="새 항목" NavigateUrl="~/Common/Introduce.aspx">
                        <asp:MenuItem NavigateUrl="~/Common/Privacy.aspx" Text="개인정보보호정책" Value="개인정보보호정책">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="장바구니" Value="새 항목" NavigateUrl="~/ShoppingCart.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="배송확인" Value="새 항목" NavigateUrl="~/OrderList.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="고객상담실" Value="새 항목" NavigateUrl="~/Reply/List.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </td>
    </tr>
</table>