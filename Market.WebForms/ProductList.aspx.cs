using Market.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class ProductList : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 넘겨져 온 카테고리 : CategoryList.ascx
            int intCategoryID = Int32.Parse(Request.Params["CategoryID"]);

            // 개체 생성
            ProductRepository productCatalogue = new ProductRepository();

            // 카테고리에 따른 상품 리스트 반환
            ctlProductsList.DataSource =
                productCatalogue.GetProducts(intCategoryID);
            ctlProductsList.DataBind();
        }
        #endregion
    }
}