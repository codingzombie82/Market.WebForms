<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainCounter.ascx.cs" Inherits="Market.WebForms.Counter.MainCounterUserControl" %>
<table border="1" width="180">
    <tr>
        <td style="width:40px;">
        전체: 
        </td>
        <td>
            <asp:Label ID="lblTotalVisit" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
        오늘: 
        </td>
        <td>
            <asp:Label ID="lblTodayVisit" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
        현재: 
        </td>
        <td>
            <asp:Label ID="lblCurrentVisit" runat="server"></asp:Label>
        </td>
    </tr>
</table>