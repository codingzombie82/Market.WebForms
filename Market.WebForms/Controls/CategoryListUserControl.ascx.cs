using Market.Models;
using System;

namespace Market.WebForms.Controls
{
    public partial class CategoryListUserControl : System.Web.UI.UserControl
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 현재 선택된 카테고리의 배경색을 구분짓기 위한 로직
            string strSelectionID = Request.Params["Selection"];
            if (strSelectionID != null)
            {
                // SelectedIndex가 적용된 항목의 SelectedItemTemplate이 적용됨 
                ctlCategoryList.SelectedIndex = Int32.Parse(strSelectionID);
            }

            // 상품관리 클래스의 인스턴스 생성
            ProductRepository objProducts = new ProductRepository();
            // 상품 카테고리 리스트 출력
            ctlCategoryList.DataSource = objProducts.GetProductCategories();
            ctlCategoryList.DataBind();
        }
        #endregion
    }
}