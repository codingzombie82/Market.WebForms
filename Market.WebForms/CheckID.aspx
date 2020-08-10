<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckID.aspx.cs" Inherits="Market.WebForms.CheckID" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

<script language="Javascript" type="text/javascript">
function CloseForm()
{
    // 부모창으로 값을 전송
    opener.document.getElementById('<%= Request["txtUserID"] %>').value =
        document.getElementById('<%= txtUserID.ClientID %>').value;
    // 현재 창 종료
    window.close(); 
}
</script>
<h3>아이디 중복 검사</h3>
<asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
<asp:Button ID="btnCheck" runat="server" Text="검사" OnClick="btnCheck_Click"></asp:Button><br />
<input type="button" value="닫기" onclick="CloseForm();" /><br />
<asp:Label ID="lblMsg" runat="server"></asp:Label>
<script language="Javascript" type="text/javascript">
// 부모창인 회원가입 페이지에 있는 txtUserID의 클라이언트ID를 통해서
// 값을 받아서 현재 페이지의 txtUserID 텍스트박스에 출력
<% 
if (!Page.IsPostBack) // 처음 로드할 때에만 부모창에 있는 값을 가져오기
{
%>
document.getElementById('<%= txtUserID.ClientID %>').value = 
    opener.document.getElementById('<%= Request["txtUserID"] %>').value;
<%
}
%>
</script>


        </div>
    </form>
</body>
</html>

