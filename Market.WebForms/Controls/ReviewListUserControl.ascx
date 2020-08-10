<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReviewListUserControl.ascx.cs" Inherits="Market.WebForms.Controls.ReviewListUserControl" %>
<table border="0" width="100%">
	<tr>
		<td>
			<h3>상품 평가</h3>	
		</td>
	</tr>
	<tr>
		<td>
		
<asp:DataList id="DataList1" runat="server">
	<ItemTemplate>
	<table border="0" width="575">
	  <colgroup>
	    <col width="70" align="right" />
	    <col width="90%" />
	  </colgroup>
	  <tr>
	    <td>이름 :</td><td><%#DataBinder.Eval(Container.DataItem, "CustomerName")%></td>
	  </tr>
	  <tr>
	    <td>점수 :</td><td><img src='images/ReviewRating<%#DataBinder.Eval(Container.DataItem, "Rating")%>.gif'></td>
	  </tr>
	  <tr>
	    <td>내용 :</td><td><%#DataBinder.Eval(Container.DataItem, "Comments")%></td>
	  </tr>
	  <tr>
	    <td>작성일 :</td><td><%# Eval("AddDate") %></td>
	  </tr>
	</table>
	<br />
	</ItemTemplate>
</asp:DataList>		
		
		</td>
	</tr>
</table>

<table border="0" width="100%">
	<tr>
		<td>
			이름 :
		</td>
		<td>
			<asp:TextBox id="txtCustomerName" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>		
		<td>
			이메일 :
		</td>
		<td>
			<asp:TextBox id="txtCustomerEmail" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
			점수 :
		</td>
		<td>
			<asp:RadioButtonList id="lstRating" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="1">&lt;img src=&quot;images/ReviewRating1.gif&quot;&gt;</asp:ListItem>
				<asp:ListItem Value="2">&lt;img src=&quot;images/ReviewRating2.gif&quot;&gt;</asp:ListItem>
				<asp:ListItem Value="3">&lt;img src=&quot;images/ReviewRating3.gif&quot;&gt;</asp:ListItem>
				<asp:ListItem Value="4">&lt;img src=&quot;images/ReviewRating4.gif&quot;&gt;</asp:ListItem>
				<asp:ListItem Value="5">&lt;img src=&quot;images/ReviewRating5.gif&quot;&gt;</asp:ListItem>
			</asp:RadioButtonList>			
		</td>
	</tr>
	<tr>
		<td>
			코멘트 :
		</td>
		<td>
			<asp:TextBox id="txtComments" runat="server" TextMode="MultiLine" Width="480"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<asp:Button id="btnWrite" runat="server" Text="의견 쓰기" onclick="btnWrite_Click"></asp:Button>
		</td>
	</tr>
</table>