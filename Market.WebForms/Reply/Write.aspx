<%@ Page Title="답변형 게시판 글쓰기" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Write.aspx.cs" Inherits="Market.WebForms.Reply.Write" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
  <div>
    <h3>
      글 쓰기</h3>
    이름:
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
    이메일:
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
    홈페이지:
    <asp:TextBox ID="txtHomepage" runat="server"></asp:TextBox><br />
    제목:
    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox><br />
    내용:
    <asp:TextBox ID="txtContent" runat="server" Columns="20" Rows="5" TextMode="MultiLine">
    </asp:TextBox><br />
    인코딩:
    <asp:RadioButtonList ID="lstEncoding" runat="server" RepeatDirection="Horizontal"
      RepeatLayout="Flow">
      <asp:ListItem Selected="True">Text</asp:ListItem>
      <asp:ListItem>HTML</asp:ListItem>
      <asp:ListItem>Mixed</asp:ListItem>
    </asp:RadioButtonList><br />
    비밀번호:
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
    <br />
    <asp:Button ID="btnWrite" runat="server" Text="저장" OnClick="btnWrite_Click" />
    <asp:Button ID="btnList" runat="server" Text="리스트" OnClick="btnList_Click" />
  </div>

</div>
</asp:Content>
