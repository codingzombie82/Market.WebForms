<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="Market.WebForms.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<script language="Javascript" type="text/javascript">
// 우편번호 검색 페이지 오픈
function OpenGetZipCode(Zip, Address)
{
  window.open('./GetZipCode.aspx?Zip=' + Zip + '&Address=' + Address,'','width=400,height=300,scrollbars=yes');
  return false; // 서버컨트롤이 포스트백이 일어나지 않도록
}

//[!] 폼을 동기화 하기 : 이전 자료를 임시 보관하는 기능 포함
//[1] 이름과 체크박스만 처리
var name = ""; // 이름
var dname = ""; // 수취인 이름
//[2] 배송지 정보에 복사된 정보 임시 보관
function InitValue()
{
    name = document.getElementById( // 서버 컨트롤의 ClientID로 가져오기
        '<%= txtCustomerName.ClientID %>').value; 
    dname = document.getElementById( // 실제로 렌더링된 클라이언트아이디로 가져오기
        "ctl00_ContentPlaceHolder1_CheckOut1_txtDeliveryCustomerName").value;
} 
//[3] 폼을 동기화 시키기
function CopyForm()
{
    if (document.getElementById('<%= chkDelivery.ClientID %>').checked) // 체크되었다면, 폼을 동기화
    {
        InitValue(); // 이전에 작성된 자료를 임시 보관
        document.getElementById(
            '<%= txtDeliveryCustomerName.ClientID %>').value = name; 
    }
    else // 그렇지 않으면, 배송지 정보 클리어
    {
        document.getElementById(
            '<%= txtDeliveryCustomerName.ClientID %>').value = dname; //  
    }    
}
</script>

<h3>
    주문서작성 및 결제방법선택</h3>
<asp:Label ID="lblMessage" runat="server">
주문하는 상품과 결제 금액이 정확한지를 확인해 주십시오.<br /> 
구매자의 정보와 배송지의 정보를 정확하게 작성해 주십시오.
</asp:Label>
<hr />
<table cellspacing="0" cellpadding="0" width="550" border="0">
    <tr valign="top">
        <td style="height: 179px">
            <strong>주문 상세 내역(Products+ShoppingCart 테이블에서 가져옴)</strong>&nbsp;<br />
            <asp:DataGrid ID="ctlCheckOutList" Width="100%" BorderColor="#CCCCCC" CellPadding="3"
                Font-Size="8pt" AutoGenerateColumns="False" runat="server" BorderStyle="None"
                BorderWidth="1px" BackColor="White" Font-Names="Verdana">
                <FooterStyle ForeColor="#000066" CssClass="cartlistfooter" BackColor="White"></FooterStyle>
                <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#669999"></SelectedItemStyle>
                <AlternatingItemStyle CssClass="CartListItemAlt"></AlternatingItemStyle>
                <ItemStyle ForeColor="#000066" CssClass="CartListItem"></ItemStyle>
                <HeaderStyle Font-Bold="True" ForeColor="White" CssClass="CartListHead" BackColor="#006699">
                </HeaderStyle>
                <Columns>
                    <asp:BoundColumn DataField="ModelName" HeaderText="상품명"></asp:BoundColumn>
                    <asp:BoundColumn DataField="ModelNumber" HeaderText="모델번호"></asp:BoundColumn>
                    <asp:BoundColumn DataField="Quantity" HeaderText="수량"></asp:BoundColumn>
                    <asp:BoundColumn DataField="SellPrice" HeaderText="가격" DataFormatString="{0:###,###}">
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ExtendedAmount" HeaderText="소계" DataFormatString="{0:###,###}">
                    </asp:BoundColumn>
                </Columns>
                <PagerStyle HorizontalAlign="Left" ForeColor="#000066" BackColor="White" Mode="NumericPages">
                </PagerStyle>
            </asp:DataGrid>
            <br />
            <b>총합: </b>
            <asp:Label ID="lblTotal" runat="server" />원
            <asp:Label ID="lblDelivery" runat="server" Font-Italic="True" ForeColor="Silver"
                Text="(배송비 2500원 포함된 가격임)" Visible="False"></asp:Label>&nbsp;
        </td>
    </tr>
</table>
<hr />
<table id="Table1" cellspacing="0" cellpadding="0" width="550" border="0">
    <tr valign="top">
        <td>
            <p>
                <strong>주문자 정보 입력(Customers 테이블 사용)</strong></p>
            <p>
                성명 :
                <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox><br />
                전화번호 :
                <asp:TextBox ID="txtPhone1" runat="server" Width="56px"></asp:TextBox>-
                <asp:TextBox ID="txtPhone2" runat="server" Width="48px"></asp:TextBox>-
                <asp:TextBox ID="txtMobile3" runat="server" Width="48px"></asp:TextBox>&nbsp;<br />
                휴대폰 :
                <asp:TextBox ID="txtMobile1" runat="server" Width="48px"></asp:TextBox>-
                <asp:TextBox ID="txtMobile2" runat="server" Width="48px"></asp:TextBox>-
                <asp:TextBox ID="txtPhone3" runat="server" Width="56px"></asp:TextBox><br />
                우편번호 :
                <asp:TextBox ID="txtZip" runat="server" Width="80px"></asp:TextBox>

                <script language="Javascript" type="text/javascript">
                function GetCheckOutZipCode()
                {
                    window.open("GetZipCode.aspx?Zip=<%= txtZip.ClientID %>","GetCheckOutZipCode","width=470,height=300,scrollbars=yes");
                }
                </script>

                <input type="button" value="우편번호 검색" onclick="OpenGetZipCode('<%= txtZip.ClientID %>','<%= txtAddress.ClientID %>');" />
                <br />
                주소 :
                <asp:TextBox ID="txtAddress" runat="server" Width="320px"></asp:TextBox><br />
                상세주소 :
                <asp:TextBox ID="txtAddressDetail" runat="server" Width="288px"></asp:TextBox><br />
                주민등록번호 :
                <asp:TextBox ID="txtSsn1" runat="server" Width="72px"></asp:TextBox>-
                <asp:TextBox ID="txtSsn2" runat="server" Width="72px"></asp:TextBox><br />
                이메일 :
                <asp:TextBox ID="txtEmailAddress" runat="server"></asp:TextBox><br />
                <asp:Panel ID="MemberDivisionPanel" runat="server">
                    회원으로&nbsp;주문하시면 마일리지가 적립됩니다.
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Register.aspx">회원가입</asp:HyperLink><br />
                    주문비밀번호 :
                    <asp:TextBox ID="txtOrdersPassword" runat="server"></asp:TextBox>(비회원 주문시 주문
                    확인시 필요)</asp:Panel>
            </p>
        </td>
    </tr>
</table>
<hr />
<asp:CheckBox ID="chkDelivery" runat="server" AutoPostBack="True"
    OnCheckedChanged="chkDelivery_CheckedChanged">
</asp:CheckBox>배송지 주소가 위 내용과 동일하면 클릭해주세요.
<hr />
<table id="Table2" cellspacing="0" cellpadding="0" width="550" border="0">
    <tr valign="top">
        <td width="100%">
            <strong>배송지 정보 입력(Delivery 테이블 사용)</strong>
            <br />
            성명 :
            <asp:TextBox ID="txtDeliveryCustomerName" runat="server"></asp:TextBox><br />
            전화번호 :
            <asp:TextBox ID="txtDeliveryTelePhone1" runat="server" Width="56px"></asp:TextBox>-
            <asp:TextBox ID="txtDeliveryTelePhone2" runat="server" Width="48px"></asp:TextBox>-
            <asp:TextBox ID="txtDeliveryTelePhone3" runat="server" Width="56px"></asp:TextBox>&nbsp;<br />
            휴대폰 :
            <asp:TextBox ID="txtDeliveryMobilePhone1" runat="server" Width="48px"></asp:TextBox>-
            <asp:TextBox ID="txtDeliveryMobilePhone2" runat="server" Width="48px"></asp:TextBox>-
            <asp:TextBox ID="txtDeliveryMobilePhone3" runat="server" Width="48px"></asp:TextBox><br />
            우편번호 :
            <asp:TextBox ID="txtDeliveryZipCode" runat="server" Width="80px"></asp:TextBox>
            <input type="button" value="우편번호 검색" onclick="OpenGetZipCode('<%= txtDeliveryZipCode.ClientID %>','<%= txtDeliveryAddress.ClientID %>');" />
            <br />
            주소 :
            <asp:TextBox ID="txtDeliveryAddress" runat="server" Width="320px"></asp:TextBox><br />
            상세주소 :
            <asp:TextBox ID="txtDeliveryAddressDetail" runat="server" Width="288px"></asp:TextBox>
        </td>
    </tr>
</table>
<hr />
<table id="Table3" cellspacing="0" cellpadding="0" width="550" border="0">
    <tr valign="top">
        <td width="100%">
            <strong>기타 정보 입력(Message 테이블 사용)</strong><br />
            남길 메모 :
            <asp:TextBox ID="txtMessage" runat="server" Width="392px"></asp:TextBox>
        </td>
    </tr>
</table>
<hr />
<table id="Table4" cellspacing="0" cellpadding="0" width="550" border="0">
    <tr valign="top">
        <td width="100%">
            <strong>결제 방법 선택(Orders 테이블 사용)</strong><br />
            <asp:RadioButtonList ID="lstPayment" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="온라인입금 결제" Selected="True">온라인입금 결제</asp:ListItem>
                <asp:ListItem Value="신용카드 결제">신용카드 결제</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<hr />
<asp:Button ID="cmdCheckOut" runat="server" Text="결제하기" OnClick="cmdCheckOut_Click">
</asp:Button>
</asp:Content>
