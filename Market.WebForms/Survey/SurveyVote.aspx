<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyVote.aspx.cs" Inherits="Market.WebForms.Survey.SurveyVote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


설문 진행<br /><br />

<asp:Label ID="lblTitle" runat="server" Text=""></asp:Label><br /><br />

<asp:RadioButtonList ID="RadioButtonList1" runat="server">
</asp:RadioButtonList>
<asp:CheckBoxList ID="CheckBoxList1" runat="server">
</asp:CheckBoxList><br />

<asp:Button ID="btnVote" runat="server" Text="투표하기" OnClick="btnVote_Click" />
<asp:Button ID="btnView" runat="server" Text="투표결과" OnClick="btnView_Click" />


</asp:Content>
