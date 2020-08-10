using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Controls
{
    public partial class LoginUserControl : System.Web.UI.UserControl
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 로그인 확인 
            if (Page.User.Identity.IsAuthenticated)
            {
                this.lblError.Text = "이미 로그인 하셨습니다.";
            }
        }

        protected void btnLogin_Click(object sender, System.EventArgs e)
        {
            // 오래된 쇼핑카트 아이디 저장
            ShoppingCartDB shoppingCart = new ShoppingCartDB();
            string tempCartID = shoppingCart.GetShoppingCartId();

            // 로그인 정보가 맞는지 확인
            CustomersDB accountSystem = new CustomersDB();
            // 로그인이 정상적으로 진행되면 고객번호 : 1번 고객, 2번 고객
            string customerId = accountSystem.Login(txtUserID.Text, Security.Encrypt(txtPassword.Text));

            if (customerId != null)
            {
                // 현재 쇼핑카트 정보를 고객 정보로 마이그레이트
                shoppingCart.MigrateCart(tempCartID, customerId);

                // 고객의 모든 정보 값 반환
                CustomerDetails customerDetails = accountSystem.GetCustomerDetails(customerId);

                // 고객의 이름을 쿠키에 저장
                // Response.Cookies["Shopping_CustomerName"].Value = customerDetails.CustomerName;
                HttpCookie customerName = new HttpCookie("Shopping_CustomerName", Server.UrlEncode(customerDetails.CustomerName));
                customerName.HttpOnly = true;
                Response.Cookies.Add(customerName);

                // 고객의 이이디를 쿠키에 저장
                Response.Cookies["Shopping_UserID"].Value = customerDetails.UserID;

                // 고객 이름 저장 체크박스 확인
                if (chkRememberLogin.Checked == true)
                {
                    // 앞으로 한달간 저장
                    Response.Cookies["Shopping_CustomerName"].Expires = DateTime.Now.AddMonths(1);
                }

                // 원래 요청했었던 페이지로 이동
                if (Request.ServerVariables["SCRIPT_NAME"].ToLower().EndsWith("checklogin.aspx"))
                {
                    System.Web.Security.FormsAuthentication.SetAuthCookie(customerId, chkRememberLogin.Checked); // 인증값 부여
                    Response.Redirect("CheckOut.aspx"); // 현재 페이지가 로그인 체크 페이지면 주문서 페이지로 이동                
                }
                else
                {
                    // 따로 지정하지 않았으면 기본값으로 ~/Default.aspx로 이동
                    System.Web.Security.FormsAuthentication.RedirectFromLoginPage(customerId, chkRememberLogin.Checked);
                }
            }
            else
            {
                lblError.Text = "로그인에 실패했습니다. 다시 로그인하세요.";
            }
        }

        protected void btnRegister_Click(object sender, System.EventArgs e)
        {
            // 회원 가입 페이지로 이동
            Response.Redirect("Register.aspx");
        }
        #endregion
    }
}