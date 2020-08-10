<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Market.WebForms.ProductDetailsPage" %>

<%@ Register Src="~/Controls/ReviewListUserControl.ascx" TagPrefix="uc1" TagName="ReviewListUserControl" %>
<%@ Register Src="~/Controls/AlsoBoughtUserControl.ascx" TagPrefix="uc1" TagName="AlsoBoughtUserControl" %>
<%@ Register Src="~/Controls/RelatedProductUserControl.ascx" TagPrefix="uc1" TagName="RelatedProductUserControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script language="javascript" type="text/javascript">
        function ShowImage() {
            window.open("ShowImages.aspx?ProductImage=" + <%= "'" + ProductImage + "'" %>, "show", "width=400,height=450");
        }
    </script>

    <table border="0" style="width: 100%">
        <tr>
            <td>
                <h1>상품 상세 보기</h1>
            </td>
        </tr>
    </table>
    <br />
    <table border="0" cellpadding="5" style="width: 100%">
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan="7">
                <asp:ImageButton ID="imgProductImage" runat="server" Height="200px" Width="200px"
                    OnClick="btnViewImage_Click" />
                <br />
                <asp:Button ID="btnViewImage" runat="server" Text="큰 이미지 보기" Width="198px"
                    OnClientClick="ShowImage();return false;"
                    OnClick="btnViewImage_Click" />
            </td>
            <td>모델번호 :
            </td>
            <td>
                <asp:Label ID="lblModelNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>제조회사 :
            </td>
            <td>
                <asp:Label ID="lblCompany" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>상품명 :
            </td>
            <td>
                <asp:Label ID="lblModelName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>판매가격 :
            </td>
            <td>
                <asp:Label ID="lblSellPrice" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>재고수량 :
            </td>
            <td>
                <asp:Label ID="lblProductCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>구매수량 :
            </td>
            <td>
                <asp:TextBox ID="txtQuantity" runat="server" Width="51px">1</asp:TextBox>개
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddToCart" runat="server" Text="장바구니 담기" OnClick="btnAddToCart_Click"
                    ValidationGroup="ProductDetails" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc1:RelatedProductUserControl runat="server" ID="RelatedProductUserControl" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc1:AlsoBoughtUserControl runat="server" ID="AlsoBoughtUserControl" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 120px">
                <br />
                <h3>상품 상세 설명</h3>
                <hr />
                <asp:Label ID="lblDescription" runat="server" Width="100%"></asp:Label>
                <hr />
            </td>
        </tr>
    </table>
    <br />

    <uc1:ReviewListUserControl runat="server" ID="ReviewListUserControl" />

    <br />
    <br />
    <asp:RequiredFieldValidator ID="valQuantity" runat="server" ControlToValidate="txtQuantity"
        Display="None" ErrorMessage="구매수량을 입력하세요." ValidationGroup="ProductDetails" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:RangeValidator ID="valQuantiyRange" runat="server" ControlToValidate="txtQuantity"
        Display="None" ErrorMessage="구매수량은 1개부터 1000개까지 입니다." MaximumValue="1000" MinimumValue="1"
        Type="Integer" ValidationGroup="ProductDetails" SetFocusOnError="True"></asp:RangeValidator>
    <br />
    <asp:ValidationSummary ID="valSummary" runat="server" ShowMessageBox="True" ShowSummary="False"
        ValidationGroup="ProductDetails" />
</asp:Content>
