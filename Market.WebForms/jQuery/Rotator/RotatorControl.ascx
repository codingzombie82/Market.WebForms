<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RotatorControl.ascx.cs" Inherits="Market.WebForms.jQuery.Rotator.RotatorControl" %>
<style type="text/css">
    .divHeight { height:145px; }
</style>
<script src="../../js/jquery-1.3.2-vsdoc2.js" type="text/javascript"></script>
<script src="jquery.rotator.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#rotator1').rotator({ ms: 3000 });
    });
</script>
<div id="rotator1" 
    style="height: 130px; width:100px; overflow: hidden; border:1px solid red;">
    <asp:Literal ID="ltrNewProducts" runat="server"></asp:Literal>    
</div>
