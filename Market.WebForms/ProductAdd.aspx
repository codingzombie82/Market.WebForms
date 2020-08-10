<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductAdd.aspx.cs" Inherits="Market.WebForms.ProductAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" width="100%">
    <tr>
        <td>
            <h1>카테고리에 따른 상품 등록</h1>
            <table style="width: 100%">
                <tr>
                    <td style="width: 100px" align="right">분류코드 :</td>
                    <td style="width: 670px">
                        <asp:DropDownList ID="lstCategoryID" runat="server">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">모델번호 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtModelNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">모델이름 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtModelName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">제조회사 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">원가 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtOriginPrice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">판매가 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtSellPrice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">이벤트 :</td>
                    <td style="width: 670px">
                        <asp:DropDownList ID="lstEventName" runat="server">
                            <asp:ListItem Value="NEW" Selected="True">신상품</asp:ListItem>
                            <asp:ListItem Value="HIT">히트상품</asp:ListItem>
                            <asp:ListItem Value="BEST">기획상품</asp:ListItem>
                            <asp:ListItem Value="NONE">없음</asp:ListItem>
                        </asp:DropDownList>
                        신상품(NEW),히트상품(HIT),기획상품(BEST),없음(NONE)</td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">이미지명 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtProductImage" runat="server"></asp:TextBox>(~/ProductImages/이미지명)<br />
                        &nbsp;&nbsp; ~/ProductImages/Note-01.gif : 200픽셀&nbsp;<br />
                        &nbsp;&nbsp;~/ProductImages/thumbs/Note-01.gif : 100픽셀
                        <br />
                        &nbsp;&nbsp; ~/ProductImages/bigs/Note-01.gif : 400픽셀</td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">요약설명 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtExplain" runat="server" Width="200"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">상세설명 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Columns="40"
                            Rows="5"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">인코딩 :</td>
                    <td style="width: 670px">
                        <asp:DropDownList ID="lstEncoding" runat="server">
                            <asp:ListItem Value="Text" Selected="True">Text</asp:ListItem>
                            <asp:ListItem Value="HTML">HTML</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">재고수량 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtProductCount" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">마일리지 :</td>
                    <td style="width: 670px">
                        <asp:TextBox ID="txtMileage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 100px" align="right">품절여부 :</td>
                    <td style="width: 670px">
                        <asp:CheckBox ID="chkAbsence" runat="server" Text="품절체크"></asp:CheckBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnAdd" runat="server" Text="상품 등록" OnClick="btnAdd_Click"></asp:Button>
                        <br />
                        <asp:Label ID="lblProductID" runat="server"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId"
    InsertCommand="INSERT INTO [Products] ([CategoryId], [ModelNumber], [ModelName], [Company], [OriginPrice], [SellPrice], [EventName], [ProductImage], [Explain], [Description], [Encoding], [ProductCount], [Mileage], [Absence]) VALUES (@CategoryId, @ModelNumber, @ModelName, @Company, @OriginPrice, @SellPrice, @EventName, @ProductImage, @Explain, @Description, @Encoding, @ProductCount, @Mileage, @Absence)"
    SelectCommand="SELECT [ProductId], [CategoryId], [ModelNumber], [ModelName], [Company], [OriginPrice], [SellPrice], [EventName], [ProductImage], [Explain], [Description], [Encoding], [ProductCount], [Mileage], [Absence] FROM [Products]"
    UpdateCommand="UPDATE [Products] SET [CategoryId] = @CategoryId, [ModelNumber] = @ModelNumber, [ModelName] = @ModelName, [Company] = @Company, [OriginPrice] = @OriginPrice, [SellPrice] = @SellPrice, [EventName] = @EventName, [ProductImage] = @ProductImage, [Explain] = @Explain, [Description] = @Description, [Encoding] = @Encoding, [ProductCount] = @ProductCount, [Mileage] = @Mileage, [Absence] = @Absence WHERE [ProductId] = @ProductId">
    <DeleteParameters>
        <asp:Parameter Name="ProductId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="CategoryId" Type="Int32" />
        <asp:Parameter Name="ModelNumber" Type="String" />
        <asp:Parameter Name="ModelName" Type="String" />
        <asp:Parameter Name="Company" Type="String" />
        <asp:Parameter Name="OriginPrice" Type="Int32" />
        <asp:Parameter Name="SellPrice" Type="Int32" />
        <asp:Parameter Name="EventName" Type="String" />
        <asp:Parameter Name="ProductImage" Type="String" />
        <asp:Parameter Name="Explain" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Encoding" Type="String" />
        <asp:Parameter Name="ProductCount" Type="Int32" />
        <asp:Parameter Name="Mileage" Type="Int32" />
        <asp:Parameter Name="Absence" Type="Int32" />
        <asp:Parameter Name="ProductId" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="lstCategoryID" Name="CategoryId"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter ControlID="txtModelNumber" Name="ModelNumber"
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtModelName" Name="ModelName"
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtCompany" Name="Company" PropertyName="Text"
            Type="String" />
        <asp:ControlParameter ControlID="txtOriginPrice" Name="OriginPrice"
            PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="txtSellPrice" Name="SellPrice"
            PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="lstEventName" Name="EventName"
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtProductImage" Name="ProductImage"
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="txtExplain" Name="Explain" PropertyName="Text"
            Type="String" />
        <asp:ControlParameter ControlID="txtDescription" Name="Description"
            PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="lstEncoding" Name="Encoding"
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtProductCount" Name="ProductCount"
            PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="txtMileage" Name="Mileage" PropertyName="Text"
            Type="Int32" />
        <asp:ControlParameter ControlID="chkAbsence" Name="Absence"
            PropertyName="Checked" Type="Int32" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>
