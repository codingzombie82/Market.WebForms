<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="Market.WebForms.Reply.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>답변형 게시판 삭제</title>
    <script language="javascript" type="text/javascript">
    function CheckForm(){
      if (confirm("정말로 삭제하시겠습니까?"))
        return true;
      else
        return false;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <asp:Label ID="lblNum" runat="server" ForeColor="red"></asp:Label>번 글을 삭제하시겠습니까?<br />
  <br />
  암호 :
  <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
  <asp:Button ID="btnDelete" runat="server" 
  Text="삭제"  OnClientClick="return CheckForm();" OnClick="btnDelete_Click"/><br />
  <br />
  <asp:Label ID="lblError" runat="server" ForeColor="red"></asp:Label>

</asp:Content>
