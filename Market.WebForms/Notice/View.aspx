<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Market.WebForms.Notice.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
공지사항 상세 보기<br />
<br />

<asp:FormView ID="ctlViewNotice" runat="server" DataKeyNames="Num" DataSourceID="sdsViewNotice">
    <EditItemTemplate>
        Num:
        <asp:Label ID="NumLabel1" runat="server" Text='<%# Eval("Num") %>'></asp:Label><br />
        Title:
        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'>
        </asp:TextBox><br />
        Content:
        <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>'>
        </asp:TextBox><br />
        PostDate:
        <asp:TextBox ID="PostDateTextBox" runat="server" Text='<%# Bind("PostDate") %>'>
        </asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="업데이트">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="취소">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        Title:
        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'>
        </asp:TextBox><br />
        Content:
        <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>'>
        </asp:TextBox><br />
        PostDate:
        <asp:TextBox ID="PostDateTextBox" runat="server" Text='<%# Bind("PostDate") %>'>
        </asp:TextBox><br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="삽입">
        </asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="취소">
        </asp:LinkButton>
    </InsertItemTemplate>
    <ItemTemplate>
        Num:
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("Num") %>'></asp:Label><br />
        Title:
        <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>'></asp:Label><br />
        Content:
        <asp:Label ID="ContentLabel" runat="server" Text='<%# Bind("Content") %>'></asp:Label><br />
        PostDate:
        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Bind("PostDate") %>'></asp:Label><br />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="sdsViewNotice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [Num], [Title], [Content], [PostDate] FROM [Notice] WHERE ([Num] = @Num)">
    <SelectParameters>
        <asp:QueryStringParameter Name="Num" QueryStringField="Num" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
&nbsp;<br />
<asp:HyperLink ID="lnkList" runat="server"
    NavigateUrl="~/Notice/List.aspx">리스트</asp:HyperLink>


</asp:Content>
