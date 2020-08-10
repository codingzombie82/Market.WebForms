<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUserControl.ascx.cs" Inherits="Market.WebForms.Controls.LoginUserControl" %>
<h3>
    로그인</h3>
<asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin">
    <div align="center">
        <table style="width: 300px">
            <tr>
                <td>
                    아이디 :
                </td>
                <td>
                    <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="아아디를 입력하세요."
                        Display="None" ControlToValidate="txtUserID"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    비밀번호 :
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="비밀번호를 입력하세요."
                        Display="None" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnLogin" runat="server" Text="로그인" OnClick="btnLogin_Click"></asp:Button>
                    <asp:Button ID="btnRegister" runat="server" Text="회원가입" CausesValidation="False"
                        OnClick="btnRegister_Click"></asp:Button>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:CheckBox ID="chkRememberLogin" runat="server" Text="로그인 정보 저장"></asp:CheckBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False"></asp:ValidationSummary>
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
