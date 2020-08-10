<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventNamesUserControl.ascx.cs" Inherits="Market.WebForms.Controls.EventNamesUserControl" %>

<table border='0' width='100%' cellpadding="10" style='border-right: #c0c0c0 1px solid;
    border-top: #c0c0c0 1px solid; border-left: #c0c0c0 1px solid; border-bottom: #c0c0c0 1px solid'>
    <tr>
        <td>
            <asp:DataList ID="ctlProductCatalog" runat="server" RepeatColumns="3" CellPadding="10"
                CellSpacing="10" RepeatDirection="Horizontal" Width="100%">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/ProductImages/thumbs/" + Eval("ProductImage") %>'
                            Width="100px" Height="100px" BorderWidth="0px" />
                        <br />
                        <%#DataBinder.Eval(Container.DataItem, "ModelName")%>
                        <br />
                        <%#Eval("SellPrice")%>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>