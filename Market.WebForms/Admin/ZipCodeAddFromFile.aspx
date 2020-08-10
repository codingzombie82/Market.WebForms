<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZipCodeAddFromFile.aspx.cs" Inherits="Market.WebForms.Admin.ZipCodeAddFromFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            같은 경로에 있는 zipcode_20090929.csv 파일에 있는<br />
            4만 9천여건의 데이터를 Market DB의 Zip 테이블로 가져오기<br />
            <br />
            <asp:Button ID="btnAddToZipTable" runat="server" Text="데이터 가져오기" OnClick="btnAddToZipTable_Click" />

        </div>
    </form>
</body>
</html>
