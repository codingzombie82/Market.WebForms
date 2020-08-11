<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Market.WebForms.Admin.Notice.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
공지사항 검색 결과<br />
<br />
&nbsp;
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" DataKeyNames="Num" DataSourceID="SqlDataSource1"
    PageSize="5">
    <Columns>
        <asp:BoundField DataField="Num" HeaderText="Num" InsertVisible="False" ReadOnly="True"
            SortExpression="Num" />
        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content" />
        <asp:BoundField DataField="PostDate" HeaderText="PostDate" SortExpression="PostDate" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SearchNotice" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:QueryStringParameter Name="SearchField" QueryStringField="SearchField" Type="String" />
        <asp:QueryStringParameter Name="SearchQuery" QueryStringField="SearchQuery" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<br />
<asp:HyperLink ID="HyperLink1" runat="server"
    NavigateUrl="~/Admin/Notice/List.aspx">검색 종료</asp:HyperLink>

</asp:Content>
