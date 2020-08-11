<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryWithTreeView.aspx.cs" Inherits="Market.WebForms.CategoryWithTreeView" %>

<%@ Register Src="~/Controls/CategoryWithTreeViewUserControl.ascx" TagPrefix="uc1" TagName="CategoryWithTreeViewUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:CategoryWithTreeViewUserControl runat="server" id="CategoryWithTreeViewUserControl" />
        </div>
    </form>
</body>
</html>
