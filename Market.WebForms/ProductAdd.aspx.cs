using Market.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class ProductAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DisplayData(); // 처음 로드시에만 카테고리 바인딩 
            }
        }

        private void DisplayData()
        {
            // 상품 클래스의 인스턴스 생성
            ProductRepository products = new ProductRepository();
            // 카테고리 리스트 출력
            this.lstCategoryID.DataSource = products.GetProductCategories();
            this.lstCategoryID.DataTextField = "CategoryName"; // 표시
            this.lstCategoryID.DataValueField = "CategoryId"; // 값
            this.lstCategoryID.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // 컨트롤 기반 저장(입력)
            this.SqlDataSource1.Insert();
            this.lblProductID.Text = "상품이 등록되었습니다.";
        }
    }
}