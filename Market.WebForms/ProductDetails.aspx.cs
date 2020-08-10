using Market.Models;
using System;
using System.Web.UI;

namespace Market.WebForms
{
    public partial class ProductDetailsPage : System.Web.UI.Page
    {
        #region Public Properties
        // 넘겨온 ProductID에 해당하는 이미지이름을 저장
        public string ProductImage { get; set; }
        #endregion

        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // ProductList.aspx에서 넘겨져 온 값 받기
            int ProductID = Convert.ToInt32(Request["ProductID"]);

            // 인스턴스 생성
            ProductRepository products = new ProductRepository();
            Product productDetails = products.GetProduct(ProductID);//반환(Factory Method)

            // 바인딩
            this.lblModelNumber.Text = productDetails.ModelNumber;
            this.lblModelName.Text = productDetails.ModelName;
            this.lblSellPrice.Text =
                Convert.ToString(productDetails.SellPrice);
            this.lblCompany.Text = productDetails.Company;
            this.lblDescription.Text = Dul.HtmlUtility.EncodeWithTabAndSpace(productDetails.Description);
            this.lblProductCount.Text = Convert.ToString(productDetails.ProductCount);
            this.imgProductImage.ImageUrl = "ProductImages/" + productDetails.ProductImage;
            ViewState["ProductImage"] = ProductImage = // 속성에 이미지명 저장
                productDetails.ProductImage;//뷰스테이트

            //Cache["ProductImage"] = 
            //	productDetails.ProductImage;//캐시
            //[1] 리뷰 클래스에게 상품번호 전달
            ReviewListUserControl.ProductID = ProductID;//
        }

        // 장바구니 담기
        protected void btnAddToCart_Click(object sender, System.EventArgs e)
        {
            string strUrl = String.Format(
                "AddToCart.aspx?ProductID={0}&Quantity={1}"
                    , Request["ProductID"], this.txtQuantity.Text);
            Response.Redirect(strUrl);//상품코드와 수량을 가지고 전송
        }

        // 큰 이미지 보기
        protected void btnViewImage_Click(object sender, System.EventArgs e)
        {
            string strJs = @"
				<script language='JavaScript'>
				window.open('ShowImages.aspx?ProductImage="
                + ViewState["ProductImage"]
                + @"','','width=400,height=450');
				</script>
			";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "openImg", strJs);
        }
        #endregion
    }
}