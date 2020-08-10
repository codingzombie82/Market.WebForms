using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class AddToCart : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 장바구니 담는 기본 수량은 1로 초기화
            int intQuantity = 1;

            // 만약에 넘겨져 온 수량값이 있다면 해당 값으로 초기화
            if (Request["Quantity"] != null)
            {
                intQuantity = Int32.Parse(Request["Quantity"]);
            }

            // 넘겨져 온 상품코드가 있다면, 해당 상품코드를 장바구니 테이블에 추가
            if (Request.Params["ProductID"] != null)
            {
                // 쇼핑카트 클래스 인스턴스 생성
                ShoppingCartDB cart = new ShoppingCartDB();

                // 고유 키값 생성 : GUID값(접속자의 유일한 값)
                // 회원로그인했을 경우에는 cartId에 CustomerID가 저장
                String cartId = cart.GetShoppingCartId();
                // String cartId = Session.SessionID; // 고전 방식

                // 장바구니 담기
                cart.AddItem(cartId, Int32.Parse(Request.Params["ProductID"]), intQuantity);
            }

            if (Request["State"] == null) // 장바구니 담기
            {
                // 장바구니 테이블로 이동
                Response.Redirect("~/ShoppingCart.aspx");
            }
            else // 즉시구매 
            {
                Response.Redirect("CheckLogin.aspx"); // 주문 페이지로 이동
            }
        }
        #endregion
    }
}