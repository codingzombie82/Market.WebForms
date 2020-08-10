<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelatedProductUserControl.ascx.cs" Inherits="Market.WebForms.Controls.RelatedProductUserControl" %>
<div>
    <b>이전 / 다음 상품 진열</b><br />    
    <table border="1" width="100%">
        <tr>
            <td>              
                <asp:DataList ID="ctlPrev" runat="server" 
                    RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table">
                    <ItemTemplate>
                        <asp:HyperLink ID="prevLink" runat="server"
                            NavigateUrl='<%# "~/ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>
                            <asp:Image ID="prevImg" runat="server" 
                            ImageUrl='<%# "~/ProductImages/thumbs/" + Eval("ProductImage") %>' />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>                
                <asp:DataList ID="ctlNext" runat="server"
                    RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table">
                    <ItemTemplate>
                        <asp:HyperLink ID="nextLink" runat="server"
                            NavigateUrl='<%# "~/ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>
                            <asp:Image ID="nextImg" runat="server" 
                            ImageUrl='<%# "~/ProductImages/thumbs/" + Eval("ProductImage") %>' />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    
</div>