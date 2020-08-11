<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyView.aspx.cs" Inherits="Market.WebForms.Survey.SurveyView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

설문조사 결과<br />
<br />
<asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
(총
<asp:Label ID="lblVoteCount" runat="server" Text=""></asp:Label>명 투표)<br />
<br />
<asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label><br />
<br />

<asp:HyperLink ID="HyperLink1" runat="server"
	NavigateUrl="~/Survey/SurveyList.aspx">리스트</asp:HyperLink>

<a href='SurveyVote.aspx?SurveyID=<%=Request["SurveyID"] %>'>투표하기</a>

<br />
<br />


</asp:Content>
