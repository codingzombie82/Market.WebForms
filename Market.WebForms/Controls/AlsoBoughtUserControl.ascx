<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlsoBoughtUserControl.ascx.cs" Inherits="Market.WebForms.Controls.AlsoBoughtUserControl" %>
<table width="100%" cellpadding="5" cellspacing="0" border="0">
	<tr>
		<td>
			<asp:Repeater ID="alsoBoughtList" runat="server">
				<HeaderTemplate>
					<tr>
						<td class="MostPopularHead">
							연관상품(이미 이 제품을 구입한 고객)
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
		</td>
	</tr>
</table>