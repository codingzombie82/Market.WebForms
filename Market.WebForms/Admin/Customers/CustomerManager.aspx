<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerManager.aspx.cs" Inherits="Market.WebForms.Admin.Customers.CustomerManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    회원관리<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
        CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True"/>
            <asp:BoundField DataField="JoinDate" HeaderText="등록일" 
                SortExpression="JoinDate" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:HyperLinkField 
                HeaderText="아이디"
                DataNavigateUrlFields="CustomerID"
                DataNavigateUrlFormatString="CustomerView.aspx?CustomerID={0}"
                DataTextField="UserID" />
            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
            <asp:BoundField DataField="Ssn1" HeaderText="Ssn1" SortExpression="Ssn1" />
            <asp:TemplateField HeaderText="휴대폰">
                <ItemTemplate>
                    <%# Eval("Mobile1") %>
                    -
                    <%# DataBinder.Eval(Container.DataItem, "Mobile2") %>
                    -
                    <%# Eval("Mobile3") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Mileage" HeaderText="Mileage" SortExpression="Mileage" />
        </Columns>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        DeleteCommand="DELETE FROM Customers FROM Customers INNER JOIN MemberShip ON Customers.CustomerID = MemberShip.CustomerID
Where CustomerID = @CustomerID
"
        
        SelectCommand="SELECT Customers.CustomerID, MemberShip.JoinDate, MemberShip.UserID, Customers.CustomerName, Customers.Ssn1, Customers.Mobile1, Customers.Mobile2, Customers.Mobile3, MemberShip.Mileage FROM Customers INNER JOIN MemberShip ON Customers.CustomerID = MemberShip.CustomerID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="CustomerID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
