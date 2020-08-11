<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainVote.ascx.cs" Inherits="Market.WebForms.Survey.MainVoteUserControl" %>
<asp:Panel ID="Panel1" runat="server">
    설문 진행<br />
    <br />
    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label><br />
    <br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
    </asp:RadioButtonList>
    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
    </asp:CheckBoxList><br />
    <asp:Button ID="btnVote" runat="server" Text="투표하기" ValidationGroup="Vote" OnClick="btnVote_Click"
        Width="75px" />
    <asp:Button ID="btnView" runat="server" Text="투표결과" ValidationGroup="Vote" OnClick="btnView_Click"
        Width="75px" />
</asp:Panel>
