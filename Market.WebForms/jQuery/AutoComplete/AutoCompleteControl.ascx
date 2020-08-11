<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AutoCompleteControl.ascx.cs" Inherits="jQuery_AutoComplete_AutoCompleteControl" %>
<link href="jquery.autocomplete.css" rel="stylesheet" type="text/css" />
<script src="../../js/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="jquery.autocomplete.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //var data = "ASP|JSP|PHP|Ajax|Silverlight|JAVA|CSS".split('|');
        var data = '<%= ModelNameList %>'.split('|');
        $('#txtSearch').autocomplete(data);
        // 검색 페이지로 전송
        $('#btnSearch').click(function () {
            location.href = "/Market/SearchResults.aspx?txtSearch=" + 
                $('#txtSearch').val(); 
        });
    });
</script>
상품검색 : <input type="text" id="txtSearch" />
<input type="button" id="btnSearch" value="검색" />