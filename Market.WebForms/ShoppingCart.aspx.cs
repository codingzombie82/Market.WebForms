using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        #region Private Member Variables
        private int quantityTotal = 0; // 수량 합계
        private int priceTotal = 0; // 가격 합계
        private int extendedAmountTotal = 0; // 소계 합계
        private int quantitySelectedTotal = 0; // 선택된 수량 합계
        private int priceSelectedTotal = 0; // 선택된 가격 합계
        private int extendedSelectedAmountTotal = 0; // 선택된 소계 합계    
        #endregion

        #region Event Handlers
        // 페이지 로드
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateShoppingCartList();
            }
        }

        // 업데이트 버튼
        protected void btnUpdateShoppingCart_Click(object sender, System.EventArgs e)
        {
            // 쇼핑카트를 업데이트하고, 다시 쇼핑카트 리스트 출력
            UpdateShoppingCartDatabase();
            PopulateShoppingCartList();
        }

        // 주문 버튼
        protected void btnCheckOut_Click(object sender, System.EventArgs e)
        {
            // 쇼핑카트 업데이트
            UpdateShoppingCartDatabase();

            ShoppingCartDB cart = new ShoppingCartDB();
            string cartId = cart.GetShoppingCartId();

            // 장바구니 검사
            if (cart.GetItemCount(cartId) != 0)
            {
                Response.Redirect("CheckLogin.aspx");//주문 페이지로 이동
            }
            else
            {
                lblErrorMessage.Text = "장바구니가 비어있습니다.";
            }
        }

        #region protected void ctlShoppingCartList_RowDataBound() : SubTotal 구하기
        /// <summary>
        /// SubTotal 구하기
        /// </summary>
        protected void ctlShoppingCartList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // 수량에 대한 SubTotal
                quantityTotal += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Quantity"));
                // 가격에 대한 SubTotal
                priceTotal += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "SellPrice"));
                // 소계에 대한 SubTotal
                extendedAmountTotal += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ExtendedAmount"));

                // 만약에 삭제 체크박스를 체크된 상태로 보여주고자 한다면...
                //TableCell tc = (e.Row.Cells[7]);
                //CheckBox c = tc.FindControl("Remove") as CheckBox;
                //c.Checked = true; 
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "SubTotal : ";
                e.Row.Cells[4].Text = quantityTotal.ToString();
                e.Row.Cells[5].Text = priceTotal.ToString();
                e.Row.Cells[6].Text = extendedAmountTotal.ToString();
            }
        }
        #endregion

        #endregion

        #region Private Methods
        /// <summary>
        /// 쇼핑카트 리스트
        /// 현재 접속자에 대한 장바구니 리스트를 출력
        /// </summary>
        private void PopulateShoppingCartList()
        {
            // 쇼핑카트 인스턴스 생성
            ShoppingCartDB cart = new ShoppingCartDB();
            // 고유 키 값 생성
            string cartId = cart.GetShoppingCartId();
            // 현재 사용자에 해당하는 상품이 없다면... 아이템 카운트가 0이라면..
            if (cart.GetItemCount(cartId) == 0)
            {
                this.MultiView1.ActiveViewIndex = 1;
                lblErrorMessage.Text = "장바구니가 비어있습니다.";
            }
            else
            {
                this.MultiView1.ActiveViewIndex = 0;
                // 바인딩
                ctlShoppingCartList.DataSource = cart.GetItems(cartId);
                ctlShoppingCartList.DataBind();

                // 총합 : 정수 3자리마다 콤마 찍기 : String.Format("{0:###,###}", 정수형데이터); 
                lblTotal.Text = String.Format("{0:###,###}", cart.GetTotal(cartId));
            }
        }

        #region private void UpdateShoppingCartDatabase()
        /// <summary>
        /// 쇼핑카트 내용 업데이트
        /// </summary>
        private void UpdateShoppingCartDatabase()
        {
            // 쇼핑카트 객체 생성
            ShoppingCartDB cart = new ShoppingCartDB();

            // 고유 키 값 반환
            string cartId = cart.GetShoppingCartId();

            // 그리드뷰의 아이템 개수만큼 반복
            for (int i = 0; i < ctlShoppingCartList.Rows.Count; i++)
            {
                // 수량 텍스트박스 값 가져오기
                TextBox quantityTxt = (TextBox)ctlShoppingCartList.Rows[i].FindControl("Quantity");

                // 삭제 체크박스 값 가져오기
                CheckBox remove = (CheckBox)ctlShoppingCartList.Rows[i].FindControl("Remove");

                int quantity;
                try
                {
                    // 수량 값 가져오기
                    quantity = Int32.Parse(quantityTxt.Text);

                    // 원래 바인딩될 때의 수량과 현재 텍스트박스의 수량이 틀리고, 삭제 체크박스가 선택되어 있다면...
                    if (quantity != (int)ctlShoppingCartList.DataKeys[i].Value || remove.Checked == true)
                    {
                        // 해당 상품코드값 가져오기
                        Label lblProductID = (Label)ctlShoppingCartList.Rows[i].FindControl("ProductID");

                        // 수량이 0이거나 삭제가 체크되었다면, 삭제 로직 실행
                        if (quantity == 0 || remove.Checked == true)
                        {
                            cart.RemoveItem(cartId, Int32.Parse(lblProductID.Text));
                        }
                        else // 그렇지 않으면 업데이트 로직 실행
                        {
                            cart.UpdateItem(cartId, Int32.Parse(lblProductID.Text), quantity);
                        }
                    }
                }
                catch
                {
                    lblErrorMessage.Text = "고객님께서 입력하신 자료가 잘못되었습니다.";
                }
            } // end for
        }
        #endregion

        // 선택 합계 구하기(옵션)
        protected void SelectedTotal(object sender, EventArgs e)
        {
            // 그리드뷰의 아이템 개수만큼 반복
            for (int i = 0; i < ctlShoppingCartList.Rows.Count; i++)
            {
                // 선택 체크박스 값 가져오기
                if (((CheckBox)ctlShoppingCartList.Rows[i].FindControl("Select")).Checked)
                {
                    // 수량에 대한 SubTotal
                    quantitySelectedTotal += Convert.ToInt32(((TextBox)ctlShoppingCartList.Rows[i].FindControl("Quantity")).Text);
                    // 가격에 대한 SubTotal
                    priceSelectedTotal += Convert.ToInt32(ctlShoppingCartList.Rows[i].Cells[5].Text.Replace(",", String.Empty));
                    // 소계에 대한 SubTotal
                    extendedSelectedAmountTotal += Convert.ToInt32(ctlShoppingCartList.Rows[i].Cells[6].Text.Replace(",", ""));
                }
            }//end for
            this.lblQuantitySelectedTotal.Text = quantitySelectedTotal.ToString();
            this.lblPriceSelectedTotal.Text = priceSelectedTotal.ToString();
            this.lblExtendedSelectedAmountTotal.Text = extendedSelectedAmountTotal.ToString();
            // 총합
            // 쇼핑카트 인스턴스 생성
            ShoppingCartDB cart = new ShoppingCartDB();
            // 고유 키 값 생성
            string cartId = cart.GetShoppingCartId();
            // 총합
            lblTotal.Text = String.Format("{0:###,###}", cart.GetTotal(cartId));
        }
        #endregion
    }
}