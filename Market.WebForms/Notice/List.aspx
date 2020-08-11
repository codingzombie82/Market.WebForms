<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Market.WebForms.Notice.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

공지사항 리스트<br />
<br />

<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" DataKeyNames="Num" DataSourceID="sdsListNotice" PageSize="5">
    <Columns>
        <asp:BoundField DataField="Num" HeaderText="Num" InsertVisible="False" ReadOnly="True"
            SortExpression="Num" />
        
    <asp:TemplateField HeaderText="제목">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink2" runat="server"
                NavigateUrl='<%# "View.aspx?Num=" + Eval("Num") %>'>
                <%# Eval("Title") %>
            </asp:HyperLink>    
        </ItemTemplate>
    </asp:TemplateField>
        
        <asp:BoundField DataField="PostDate" HeaderText="PostDate" SortExpression="PostDate" />
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="sdsListNotice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [Num], [Title], [PostDate] FROM [Notice] ORDER BY [Num] DESC">
</asp:SqlDataSource>
<br />


검색 :
<asp:DropDownList ID="lstSearchField" runat="server">
    <asp:ListItem Value="Title">제목</asp:ListItem>
    <asp:ListItem Value="Content">내용</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="txtSearchQuery" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="검색" OnClick="btnSearch_Click" /><br />


</asp:Content>
