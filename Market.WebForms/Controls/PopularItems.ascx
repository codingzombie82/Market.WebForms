<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopularItems.ascx.cs" Inherits="Market.WebForms.Controls.PopularItems" %>
<table width="100%" cellpadding="5" cellspacing="1" border="0">
	<asp:Repeater ID="productList" runat="server">
		<HeaderTemplate>
			<tr>
				<td class="MostPopularHead" style="background-color:Silver">
					<b>이번주에 가장 인기있는 상품</b>
				</td>
			</tr>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td bgcolor="#d3d3d3">
					&nbsp;
					<asp:HyperLink class="MostPopularItemText" NavigateUrl='<%# "ProductDetails.aspx?ProductID=" + DataBinder.Eval(Container.DataItem, "ProductID")%>' Text='<%#DataBinder.Eval(Container.DataItem, "ModelName")%>' runat="server" ID="Hyperlink1"/>
					<br />
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</table>