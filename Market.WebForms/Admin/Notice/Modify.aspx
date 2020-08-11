<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Market.WebForms.Admin.Notice.Modify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

공지사항 수정<br />
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="Num" DataSourceID="sdsModifyNotice" DefaultMode="Edit" OnItemUpdated="FormView1_ItemUpdated">
    <EditItemTemplate>
        Num:
        <asp:Label ID="NumLabel1" runat="server" Text='<%# Eval("Num") %>'></asp:Label><br />
        Title:
        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox><br />
        Content:
        <asp:TextBox ID="ContentTextBox" runat="server" Height="67px" Text='<%# Bind("Content") %>'
            TextMode="MultiLine" Width="224px"></asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="업데이트"></asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="취소"></asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        Title:
        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>'>
        </asp:TextBox><br />
        Content:
        <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>'>
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
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="편집"></asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="삭제"></asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="새로 만들기"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="sdsModifyNotice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM [Notice] WHERE [Num] = @Num" InsertCommand="INSERT INTO [Notice] ([Title], [Content]) VALUES (@Title, @Content)"
    SelectCommand="SELECT [Num], [Title], [Content] FROM [Notice] WHERE ([Num] = @Num)"
    UpdateCommand="UPDATE [Notice] SET [Title] = @Title, [Content] = @Content WHERE [Num] = @Num">
    <SelectParameters>
        <asp:QueryStringParameter Name="Num" QueryStringField="Num" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="Num" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Content" Type="String" />
        <asp:Parameter Name="Num" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Content" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<br />

<asp:HyperLink ID="HyperLink1" runat="server">
취소
</asp:HyperLink>

</asp:Content>
