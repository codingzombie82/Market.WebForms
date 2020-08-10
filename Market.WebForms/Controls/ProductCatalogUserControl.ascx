<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductCatalogUserControl.ascx.cs" Inherits="Market.WebForms.Controls.ProductCatalogUserControl" %>
<%@ Register Src="~/Controls/EventNamesUserControl.ascx" TagPrefix="uc1" TagName="EventNamesUserControl" %>

<table width="575" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td width="575" height="40" bgcolor="#EEEEEE">
            <asp:Image ID="imgNew" runat="server" ImageUrl="~/images/title_productlist.gif" />
        </td>
    </tr>
    <tr>
        <td width="575">
            <table align="center" border="0" cellpadding="0" cellspacing="0" width="540">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="540">
                            <tr>
                                <td height="30">
                                    <asp:Image ID="imgPoint1" runat="server" ImageUrl="~/images/icon_point.gif" Width="9px"
                                        Height="9px" />
                                    닷넷코리아 가상쇼핑몰입니다. 원하시는 상품을 선택하세요.
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="center">
                        <table border="0" width="540" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="2" bgcolor="#44B4FF">
                                </td>
                            </tr>
                            <tr>
                                <td height="28" align="center" style="border-width: 1px; border-color: #C0C0C0; border-style: solid;">
                                    <table border="0" width="520" cellspacing="0" cellpadding="0" align="center">
                                        <tr>
                                            <td align="left">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ProductNew.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="5">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <uc1:EventNamesUserControl runat="server" ID="EventNamesUserControl1" EventsName="NEW" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="right">
                                                <a href="#top">
                                                    <img border="0" src="/images/btn_top.gif" width="32" height="30"></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%" height="10">
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="center">
                        <table border='0' width='540' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td height="2" bgcolor="#44B4FF">
                                </td>
                            </tr>
                            <tr>
                                <td height="28" align="center" style="border-width: 1px; border-color: #C0C0C0; border-style: solid;">
                                    <table border="0" width="520" cellspacing="0" cellpadding="0" align="center">
                                        <tr>
                                            <td align="left">
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/ProductHit.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="5">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <uc1:EventNamesUserControl runat="server" ID="EventNamesUserControl2" EventsName="HIT" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="right">
                                                <a href="#top">
                                                    <img border="0" src="/images/btn_top.gif" width="32" height="30"></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%" height="10">
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="center">
                        <table border='0' width='540' cellspacing='0' cellpadding='0'>
                            <tr>
                                <td height="2" bgcolor="#44B4FF">
                                </td>
                            </tr>
                            <tr>
                                <td height="28" align="center" style="border-width: 1px; border-color: #C0C0C0; border-style: solid;">
                                    <table border="0" width="520" cellspacing="0" cellpadding="0" align="center">
                                        <tr>
                                            <td align="left">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/images/ProductBest.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="5">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <uc1:EventNamesUserControl runat="server" ID="EventNamesUserControl3" EventsName="BEST" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="right">
                                                <a href="#top">
                                                    <img border="0" src="/images/btn_top.gif" width="32" height="30"></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%" height="10">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>