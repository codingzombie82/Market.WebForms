<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SurveyList.aspx.cs" Inherits="Market.WebForms.Survey.SurveyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

설문 리스트<br />
<br />
<asp:HyperLink ID="HyperLink1" runat="server"
	NavigateUrl="~/Survey/SurveyWrite.aspx">[설문등록]</asp:HyperLink><br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SurveyID"
	DataSourceID="SqlDataSource1">
	<Columns>
		<asp:HyperLinkField DataNavigateUrlFields="SurveyID" 
			DataNavigateUrlFormatString="SurveyVote.aspx?SurveyID={0}" 
			HeaderText="투표" 
			Text="[투표]" />
		<asp:BoundField DataField="SurveyID" HeaderText="설문번호" 
			InsertVisible="False" 
			ReadOnly="True"
			SortExpression="SurveyID" />
		<asp:HyperLinkField DataNavigateUrlFields="SurveyID" 
			DataNavigateUrlFormatString="SurveyView.aspx?SurveyID={0}"
			DataTextField="Title" HeaderText="설문제목" />
		<asp:BoundField DataField="OptionCount" HeaderText="문항수" SortExpression="OptionCount" />
		<asp:BoundField DataField="SurveyCount" HeaderText="참가인원" SortExpression="SurveyCount" />
		<asp:BoundField DataField="CreatedDate" HeaderText="설문등록일" 
			SortExpression="CreatedDate" DataFormatString="{0:yyyy-MM-dd}"
			HtmlEncode="false"/>
	</Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
	SelectCommand="SELECT [SurveyID], [Title], [CreatedDate], [OptionCount], [SurveyCount] FROM [Surveys] ORDER BY [SurveyID] DESC">
</asp:SqlDataSource>


</asp:Content>
