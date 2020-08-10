using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class CheckOut : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 체크박스 컨트롤에 자바스크립트 이벤트 적용
            this.chkDelivery.Attributes["onclick"] = "return CopyForm();";

            // 현재 사용자의 쇼핑카트 아이디 가져오기 : 회원 또는 비회원
            ShoppingCartDB cart = new ShoppingCartDB();
            String cartId = cart.GetShoppingCartId();

            // 현재 접속자의 장바구니 내용 읽어오기 : ASP.NET1.X 버전과 호환 테스트 위해 데이터그리드 사용하였음
            ctlCheckOutList.DataSource = cart.GetItems(cartId);
            ctlCheckOutList.DataBind();

            // 총합 출력하기 : 만약에 3만원 이상 구매시 배송료(2500원) 미포함
            //lblTotal.Text = 
            //  String.Format("{0:###,###}", cart.GetTotal(cartId));
            int intTotal = cart.GetTotal(cartId);
            if (intTotal >= 30000)
            {
                lblTotal.Text = String.Format("{0:###,###}", intTotal);
            }
            else
            {
                this.lblDelivery.Visible = true;
                lblTotal.Text = String.Format("{0:###,###}", intTotal + 2500);
            }

            // 회원/비회원에 따른 폼 모양 정의
            if (Page.User.Identity.IsAuthenticated)
            {
                // 고객 정보 읽어오기
                string customerId = Page.User.Identity.Name.ToString();
                CustomersDB customerDB = new CustomersDB();
                CustomerDetails customerDetails = customerDB.GetCustomerDetails(customerId);

                // 고객 정보 바인딩
                // 주문자 정보 입력
                this.txtCustomerName.Text = customerDetails.CustomerName;
                this.txtPhone1.Text = customerDetails.Phone1;
                this.txtPhone2.Text = customerDetails.Phone2;
                this.txtPhone3.Text = customerDetails.Phone3;
                this.txtMobile1.Text = customerDetails.Mobile1;
                this.txtMobile2.Text = customerDetails.Mobile2;
                this.txtMobile3.Text = customerDetails.Mobile3;
                this.txtZip.Text = customerDetails.Zip;
                this.txtAddress.Text = customerDetails.Address;
                this.txtAddressDetail.Text = customerDetails.AddressDetail;
                this.txtSsn1.Text = customerDetails.Ssn1;
                this.txtSsn2.Text = customerDetails.Ssn2;
                this.txtEmailAddress.Text = customerDetails.EmailAddress;
                this.MemberDivisionPanel.Visible = false;
                // 배송지 정보 입력
                this.txtDeliveryCustomerName.Text = customerDetails.CustomerName;
                this.txtDeliveryTelePhone1.Text = customerDetails.Phone1;
                this.txtDeliveryTelePhone2.Text = customerDetails.Phone2;
                this.txtDeliveryTelePhone3.Text = customerDetails.Phone3;
                this.txtDeliveryMobilePhone1.Text = customerDetails.Mobile1;
                this.txtDeliveryMobilePhone2.Text = customerDetails.Mobile2;
                this.txtDeliveryMobilePhone3.Text = customerDetails.Mobile3;
                this.txtDeliveryZipCode.Text = customerDetails.Zip;
                this.txtDeliveryAddress.Text = customerDetails.Address;
                this.txtDeliveryAddressDetail.Text = customerDetails.AddressDetail;
            }
            else
            {
                this.MemberDivisionPanel.Visible = true;
            }
        }

        protected void cmdCheckOut_Click(object sender, System.EventArgs e)
        {
            // 쇼핑카트 클래스 인스턴스 생성
            ShoppingCartDB cart = new ShoppingCartDB();

            // 쇼핑카트 아아디 가져오기 : 회원
            string cartId = cart.GetShoppingCartId();

            // 주문번호 : 회원이든 비회원이든 주문번호는 생성(비회원이면, 주문정보 확인시 사용)
            int orderId = 0;

            // 회원/비회원에 따른 폼 모양 정의
            if (Page.User.Identity.IsAuthenticated)
            {
                // 고객코드 가져오기
                string customerId = Page.User.Identity.Name;

                // 주문 정보 클래스 사용
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.CustomerID = customerId;
                // 배송비 포함 여부 : 3만원 이상
                orderDetails.TotalPrice = (cart.GetTotal(cartId) >= 30000) ? cart.GetTotal(cartId) : cart.GetTotal(cartId) + 2500;
                orderDetails.OrderStatus = "신규주문";
                orderDetails.Payment = this.lstPayment.SelectedValue;
                // 배송비 포함 여부 : 3만원 이상
                orderDetails.PaymentPrice = (cart.GetTotal(cartId) >= 30000) ? cart.GetTotal(cartId) : cart.GetTotal(cartId) + 2500;
                orderDetails.PaymentInfo = "미입금";
                orderDetails.DeliveryInfo = 1;//일단 회원...
                orderDetails.DeliveryStatus = "미배송";
                orderDetails.OrderIP = Request.UserHostAddress;
                orderDetails.Password = "";
                orderDetails.CartID = cartId;
                orderDetails.Message = this.txtMessage.Text;
                //
                orderDetails.CustomerName = this.txtCustomerName.Text;
                orderDetails.TelePhone =
                    String.Format("{0}-{1}-{2}"
                    , this.txtDeliveryTelePhone1.Text
                    , this.txtDeliveryTelePhone2.Text
                    , this.txtDeliveryTelePhone3.Text);
                orderDetails.MobilePhone =
                    String.Format("{0}-{1}-{2}"
                    , this.txtDeliveryMobilePhone1.Text
                    , this.txtDeliveryMobilePhone2.Text
                    , this.txtDeliveryMobilePhone3.Text);
                orderDetails.ZipCode = this.txtDeliveryZipCode.Text;
                orderDetails.Address = this.txtDeliveryAddress.Text;
                orderDetails.AddressDetail = this.txtDeliveryAddressDetail.Text;

                // 고객이면서 장바구니에 구매 상품이 담겨져 있다면,
                if ((cartId != null) && (customerId != null))
                {
                    // 주문 클래스 인스턴스 생성
                    OrdersDB ordersDatabase = new OrdersDB();
                    // 주문 실행
                    orderId = ordersDatabase.PlaceOrder(orderDetails);
                    // 주문 완료 표시
                    lblMessage.Text = "당신이 주문하신 주문번호는 : " + orderId + "입니다.";
                    cmdCheckOut.Visible = false;// 구매 버튼 숨기기
                }
            }
            else // 비회원 주문 처리
            {
                // 고객 클래스 인스턴스 생성
                CustomersDB accountSystem = new CustomersDB();
                CustomerDetails customerDetails = new CustomerDetails();

                customerDetails.CustomerName = this.txtCustomerName.Text;
                customerDetails.Phone1 = this.txtPhone1.Text;
                customerDetails.Phone2 = this.txtPhone2.Text;
                customerDetails.Phone3 = this.txtPhone2.Text;
                customerDetails.Mobile1 = this.txtMobile1.Text;
                customerDetails.Mobile2 = this.txtMobile2.Text;
                customerDetails.Mobile3 = this.txtMobile3.Text;
                customerDetails.Zip = this.txtZip.Text;
                customerDetails.Address = this.txtAddress.Text;
                customerDetails.AddressDetail = this.txtAddressDetail.Text;
                customerDetails.Ssn1 = this.txtSsn1.Text;
                customerDetails.Ssn2 = this.txtSsn2.Text;
                customerDetails.EmailAddress = this.txtEmailAddress.Text;
                customerDetails.MemberDivision = 0;//비회원

                // 고객 정보 저장 및 고객 코드 반환
                string customerId = accountSystem.AddNonCustomer(customerDetails);

                // 주문 정보 클래스 사용
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.CustomerID = customerId;
                orderDetails.TotalPrice = (cart.GetTotal(cartId) >= 30000) ? cart.GetTotal(cartId) : (cart.GetTotal(cartId) + 2500);
                orderDetails.OrderStatus = "신규주문";
                orderDetails.Payment = this.lstPayment.SelectedValue;
                orderDetails.PaymentPrice = (cart.GetTotal(cartId) >= 30000) ? cart.GetTotal(cartId) : (cart.GetTotal(cartId) + 2500);
                orderDetails.PaymentInfo = "미입금";
                orderDetails.DeliveryInfo = 0;// 비회원...
                orderDetails.DeliveryStatus = "미배송";
                orderDetails.OrderIP = Request.UserHostAddress;
                orderDetails.Password = this.txtOrdersPassword.Text;
                orderDetails.CartID = cartId;
                orderDetails.Message = this.txtMessage.Text;
                //
                orderDetails.CustomerName = this.txtCustomerName.Text;
                orderDetails.TelePhone =
                    String.Format("{0}-{1}-{2}"
                    , this.txtDeliveryTelePhone1.Text
                    , this.txtDeliveryTelePhone2.Text
                    , this.txtDeliveryTelePhone3.Text);
                orderDetails.MobilePhone =
                    String.Format("{0}-{1}-{2}"
                    , this.txtDeliveryMobilePhone1.Text
                    , this.txtDeliveryMobilePhone2.Text
                    , this.txtDeliveryMobilePhone3.Text);
                orderDetails.ZipCode = this.txtDeliveryZipCode.Text;
                orderDetails.Address = this.txtDeliveryAddress.Text;
                orderDetails.AddressDetail = this.txtDeliveryAddressDetail.Text;

                // 비회원이면서 장바구니에 구매 상품이 담겨져 있다면,
                if ((cartId != null) && (customerId != null))
                {
                    // 주문 클래스 인스턴스 생성
                    OrdersDB ordersDatabase = new OrdersDB();
                    // 주문 실행
                    orderId = ordersDatabase.PlaceOrder(orderDetails);
                    // 주문 완료 표시
                    lblMessage.Text = "<hr />당신이 주문하신 주문번호는 : " + orderId + "입니다.<br />";
                    lblMessage.Text += "<a href='Default.aspx'>홈으로 가기</a><hr />";
                    cmdCheckOut.Visible = false;// 구매 버튼 숨기기
                }
            }

            // 메일전송 : 주문 내역을 메일 또는 SMS로 보내주는 코드는 이 부분에 위치
            // System.Web.Mail.SmtpMail.Send("admin@aaa.com", this.txtEmailAddress.Text, "주문이 완료되었습니다.", "주문번호 : " + orderId + ", 주문비밀번호 : " + this.txtOrdersPassword.Text);
        }

        protected void chkDelivery_CheckedChanged(object sender, System.EventArgs e)
        {
            if (this.chkDelivery.Checked)//동일하다면...
            {
                this.txtDeliveryCustomerName.Text = this.txtCustomerName.Text;
                this.txtDeliveryTelePhone1.Text = this.txtPhone1.Text;
                this.txtDeliveryTelePhone2.Text = this.txtPhone2.Text;
                this.txtDeliveryTelePhone3.Text = this.txtPhone3.Text;
                this.txtDeliveryMobilePhone1.Text = this.txtMobile1.Text;
                this.txtDeliveryMobilePhone2.Text = this.txtMobile2.Text;
                this.txtDeliveryMobilePhone3.Text = this.txtMobile3.Text;
                this.txtDeliveryZipCode.Text = this.txtZip.Text;
                this.txtDeliveryAddress.Text = this.txtAddress.Text;
                this.txtDeliveryAddressDetail.Text = this.txtAddressDetail.Text;
            }
            else
            {
                this.txtDeliveryCustomerName.Text = "";
                this.txtDeliveryTelePhone1.Text = "";
                this.txtDeliveryTelePhone2.Text = "";
                this.txtDeliveryTelePhone3.Text = "";
                this.txtDeliveryMobilePhone1.Text = "";
                this.txtDeliveryMobilePhone2.Text = "";
                this.txtDeliveryMobilePhone3.Text = "";
                this.txtDeliveryZipCode.Text = "";
                this.txtDeliveryAddress.Text = "";
                this.txtDeliveryAddressDetail.Text = "";
            }
        }
        #endregion
    }
}