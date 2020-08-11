<%@ Page Title="답변형 게시판 리스트" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Market.WebForms.Reply.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h3>글 목록</h3>

            <asp:GridView ID="ctlReplyList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                PageSize="5" OnPageIndexChanging="ctlReplyList_PageIndexChanging">
                <Columns>

                    <asp:TemplateField HeaderText="제목"
                        ItemStyle-Width="300px"
                        HeaderStyle-HorizontalAlign="center">
                        <ItemTemplate>
                            <%# FuncStep( Eval("Step") ) %>

                            <a href='View.aspx?Num=<%#Eval("Num") %>'>
                                <%# Eval("Title") %>
                            </a>

                            <%# GetNewImg( Eval("PostDate") ) %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="작성자">
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "Name") %>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <%# Eval("Name") %>
                        </AlternatingItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PostDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="작성일"
                        HtmlEncode="False" />
                    <asp:BoundField DataField="ReadCount" HeaderText="조회수" />
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <PagerSettings Mode="NumericFirstLast" />
            </asp:GridView>

            <br />
            검색 :
    <asp:DropDownList ID="lstSearchField" runat="server">
        <asp:ListItem Value="Name">이름</asp:ListItem>
        <asp:ListItem Selected="True" Value="Title">제목</asp:ListItem>
        <asp:ListItem Value="Content">내용</asp:ListItem>
    </asp:DropDownList>
            <asp:TextBox ID="txtSearchQuery" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="검색" OnClick="btnSearch_Click" /><br />
            <br />
            <asp:Button ID="btnWrite" runat="server" Text="글쓰기" OnClick="btnWrite_Click" />
        </div>

    </div>
</asp:Content>
