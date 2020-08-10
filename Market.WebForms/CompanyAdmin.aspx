<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyAdmin.aspx.cs" Inherits="Market.WebForms.CompanyAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
        사업자명:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        사업자번호:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
        사업장소재지<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
        사업장소재지상세<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox><br />
        대표자 성명<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><br />
        업태<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox><br />
        업종(종목)<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><br />
        운영자 성명<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox><br />
        연락처<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox><br />
        팩스<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox><br />
        이메일주소<asp:TextBox ID="TextBox11" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnSaveXml" runat="server" OnClick="btnSaveXml_Click" Text="회사정보 저장" />
    </div>
</asp:Content>
