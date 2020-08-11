<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Market.WebForms.Admin.Notice.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

공지사항 삭제<br />
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="Num" DataSourceID="sdsDeleteNotice"
    OnItemDeleted="FormView1_ItemDeleted">
    <EditItemTemplate>
        Num:
        <asp:Label ID="NumLabel1" runat="server" Text='<%# Eval("Num") %>'></asp:Label><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="업데이트">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="취소">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="삽입">
        </asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="취소">
        </asp:LinkButton>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:Label ID="NumLabel" runat="server" Text='<%# Eval("Num") %>'></asp:Label>번
        글을 삭제하시겠습니까?<br />
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="삭제"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="sdsDeleteNotice" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM [Notice] WHERE [Num] = @Num" SelectCommand="SELECT [Num] FROM [Notice] Where Num = @Num">
    <SelectParameters>
        <asp:QueryStringParameter Name="Num" QueryStringField="Num" />
    </SelectParameters>
    <DeleteParameters>
        <asp:QueryStringParameter Name="Num" QueryStringField="Num" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>


</asp:Content>
