<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetZipCode.aspx.cs" Inherits="Market.WebForms.GetZipCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<script language="Javascript" type="text/javascript">
    function SetZipCode(Zip, Address) {
        //[1] 부모창에서 Zip이란 이름으로 우편번호를 받아서 출력할 텍스트박스의 이름을 전송함...
        opener.document.getElementById('<%= Request["Zip"] %>').value = Zip;
        
        //[2] 만약, 부모창의 개체 이름이 ctl00_ContentPlaceHolder1_Register1_txtAddress라면 아래와 같이 선언해도 됨.
        //opener.document.getElementById('ctl00_ContentPlaceHolder1_Register1_txtAddress').value = Address;
        opener.document.getElementById('<%= Request["Address"] %>').value = Address;
          
        window.close();// 닫기
    }
</script>

<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
동(면) 이름 :
<asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="검색" OnClick="btnSearch_Click" />
<br />
<asp:DataList ID="ctlZipColdeList" runat="server">
    <ItemTemplate>
        <input type="button" value="선택" onclick='SetZipCode("<%# Eval("ZipCode") %>", "<%# Eval("Si") %> <%# Eval("Gu") %> <%# Eval("Dong") %> <%# Eval("PostEtc") %>");' />
        <a href="#" onclick='SetZipCode("<%# Eval("ZipCode") %>", "<%# Eval("Si") %> <%# Eval("Gu") %> <%# Eval("Dong") %> <%# Eval("PostEtc") %>");'>        
        <%# Eval("ZipCode") %> 
        <%# Eval("Si") %>
        <%# Eval("Gu") %>
        <%# Eval("Dong") %>
        <%# Eval("PostEtc") %>
        </a>
    </ItemTemplate>
</asp:DataList>
<br />
<input type="button" value="닫기" onclick="window.close();" />
</asp:Panel>
    </form>
</body>
</html>
