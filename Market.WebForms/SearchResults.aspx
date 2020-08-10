<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="Market.WebForms.SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" width="100%">
	<tr>
		<td>
			<h1>상품 검색 결과</h1>			
		</td>
	</tr>
	<tr>
		<td align="center">

<asp:DataList id="ctlSearchResults" RepeatColumns="2" runat="server">
	<ItemTemplate>
		<table border="0" width="300">
			<tr>
				<td width="25">
					&nbsp;
				</td>
				<td width="100" valign="middle" align="right">
					<a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
						<img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="100" height="100" border="0">
					</a>
				</td>
				<td width="200" valign="middle">
					<a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'>
						<span class="ProductListHead">
							<%# DataBinder.Eval(Container.DataItem, "ModelName")%>
						</span>
						<br />
					</a>
					<b>판매가격 : </b>
					<span style="font-family:굴림체;"><%# DataBinder.Eval(Container.DataItem, "SellPrice", "{0}")%>원</span>
					<br />
					<a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'>
						<span color="#9D0000"><b>장바구니 담기</b></span></a>
				</td>
			</tr>
		</table>
	</ItemTemplate>
</asp:DataList>

<asp:Label id="lblErrorMsg" class="ErrorText" runat="server" />
			
		</td>
	</tr>
</table>
</asp:Content>
