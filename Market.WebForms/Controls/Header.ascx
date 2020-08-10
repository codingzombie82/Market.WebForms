<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Market.WebForms.Controls.Header" %>
<%@ Register Src="~/Controls/SearchFormUserControl.ascx" TagPrefix="uc1" TagName="SearchFormUserControl" %>

<table border="0" width="100%" height="60" cellpadding="0" cellspacing="0">
    <tr>
        <td rowspan="2" align="left"><a href="/">
            <img src="/images/title_logo.gif" border="0"></a></td>
        <td background="/images/bg_main_right_top.gif" width="425" height="23" align="right">


            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    <font color="#bbbbbb">ㅣ</span>&nbsp;
                    <asp:HyperLink ID="hypRegister2" runat="server" NavigateUrl="~/UserInformation.aspx">MY PAGE</asp:HyperLink><font color="#bbbbbb">ㅣ</span>
                        <asp:LoginName runat="server"></asp:LoginName>
                </LoggedInTemplate>
                <AnonymousTemplate>
                    <asp:LoginStatus ID="LoginStatus2" runat="server" />
                    <font color="#bbbbbb">ㅣ</span>&nbsp;
                    <asp:HyperLink ID="hypRegister" runat="server" NavigateUrl="~/Register.aspx">회원가입</asp:HyperLink><font color="#bbbbbb">ㅣ</span>
                </AnonymousTemplate>
            </asp:LoginView>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ShoppingCart.aspx">장바구니</asp:HyperLink><font color="#bbbbbb">ㅣ</span>
                <span style="color:#bbbbbb;"> | </span><a href="/OrderList.aspx">주문현황조회</a>
                <span style="color:#bbbbbb;"> | </span><a href="/Reply/List.aspx">고객센터</a>
                <span style="color:#bbbbbb;"> | </span><a href="/Common/Sitemap.aspx">사이트맵</a>&nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" height="40">
            <uc1:SearchFormUserControl runat="server" ID="SearchFormUserControl" />
        </td>
    </tr>
</table>
