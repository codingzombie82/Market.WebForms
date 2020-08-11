<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Category.ascx.cs" Inherits="Market.WebForms.CategoryUserControl" %>
<%@ Register Src="~/Controls/CategoryList.ascx" TagPrefix="uc1" TagName="CategoryList" %>
<%@ Register Src="~/Controls/PopularItems.ascx" TagPrefix="uc1" TagName="PopularItems" %>
<%@ Register Src="~/Survey/MainVote.ascx" TagPrefix="uc1" TagName="MainVote" %>
<%@ Register Src="~/Banner/MainBanner.ascx" TagPrefix="uc1" TagName="MainBanner" %>
<%@ Register Src="~/Counter/MainCounter.ascx" TagPrefix="uc1" TagName="MainCounter" %>






<table cellspacing="0" cellpadding="0" width="185" bgcolor="#ffffff" border="0">
    <tr>
        <td width="185" height="50">
            <table cellspacing="0" cellpadding="0" width="185" border="0">
                <tr>
                    <td align="center" width="185">
                        <img src="/images/title_category.gif">
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="left" width="185" height="50">
                        <uc1:CategoryList runat="server" ID="CategoryList" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="185" height="3">
        </td>
    </tr>
    <tr>
        <td width="185">
            <uc1:PopularItems runat="server" ID="PopularItems" />
        </td>
    </tr>
    <tr>
        <td width="185" height="3">
        </td>
    </tr>
    <tr>
        <td width="185">
            <table cellspacing="0" cellpadding="0" width="185" border="0">
                <tr>
                    <td align="center" width="185">
                        <img src="/images/title_poll.gif">
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="center" width="185" height="50">
                        <!--설문조사-->
                        <uc1:MainVote runat="server" ID="MainVote" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="185">
            <table cellspacing="0" cellpadding="0" width="185" border="0">
                <tr>
                    <td align="center" width="185">
                        <img src="/images/title_banner.gif">
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="center" width="185" height="50">
                        <!--배너-->
                        <uc1:MainBanner runat="server" ID="MainBanner" />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="185">
            <table cellspacing="0" cellpadding="0" width="185" border="0">
                <tr>
                    <td align="center" width="185">
                        <img src="/images/title_statistic.gif">
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="left" width="185" height="50">
                        <!--접속통계-->
                        <uc1:MainCounter runat="server" ID="MainCounter" />
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="185">
            <table width="185" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="185" align="center" valign="middle" height="50">
                        <!--달력-->
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
                            BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                            Font-Size="8pt" ForeColor="#003399" Height="123px" Width="180px">
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                                Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        </asp:Calendar>
                        <!--달력 끝-->
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>