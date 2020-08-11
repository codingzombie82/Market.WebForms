<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Market.WebForms.Reply.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <h3>글 보기</h3>
            제목:
    <asp:Label ID="lblTitle" runat="server"></asp:Label><br />
            번호:<asp:Label ID="lblNum" runat="server"></asp:Label><br />
            이름:<asp:Label ID="lblName" runat="server"></asp:Label><br />
            이메일:<asp:Label ID="lblEmail" runat="server"></asp:Label><br />
            홈페이지:<asp:Label ID="lblHomepage" runat="server"></asp:Label><br />
            작성일:<asp:Label ID="lblPostDate" runat="server"></asp:Label><br />
            조회수:<asp:Label ID="lblReadCount" runat="server"></asp:Label><br />
            IP주소:<asp:Label ID="lblPostIP" runat="server"></asp:Label><br />
            <asp:Label ID="lblContent" runat="server" Height="64px" Width="262px"></asp:Label><br />
            <asp:Button ID="btnReply" runat="server" OnClick="btnReply_Click" Text="답변" />
            <asp:Button ID="btnModify" runat="server" OnClick="btnModify_Click" Text="수정" />
            <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="삭제" />
            <asp:Button ID="btnList" runat="server" OnClick="btnList_Click" Text="리스트" />
        </div>

    </div>
</asp:Content>
