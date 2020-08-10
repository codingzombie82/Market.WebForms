using Market.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class SearchResults : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 상품 개체 선언
            ProductRepository productCatalogue = new ProductRepository();

            // 데이터 리스트 컨트롤에 출력
            ctlSearchResults.DataSource =
                productCatalogue.GetProductsBySearchString(
                    Request.Params["txtSearch"]);//넘겨져 온 검색어에 따른 상품리스트
            ctlSearchResults.DataBind();

            // 데이터 리스트에 아무런 데이터가 없다면,
            if (ctlSearchResults.Items.Count == 0)
            {
                lblErrorMsg.Text = "검색 조건에 맞는 상품이 없습니다.";
            }
        }
        #endregion
    }
}