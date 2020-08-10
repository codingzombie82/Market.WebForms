using Market.Models;
using System;

namespace Market.WebForms.Controls
{
    public partial class AlsoBoughtUserControl : System.Web.UI.UserControl
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 상품 클래스의 개체 생성
            ProductRepository productCatalogue = new ProductRepository();

            // GetProductsAlsoPurchased() 메서드 호출(연관상품)
            alsoBoughtList.DataSource = productCatalogue.GetProductsAlsoPurchased(Convert.ToInt32(Request["ProductID"]));
            alsoBoughtList.DataBind();

            // 만약에 데이터가 없으면 리피터/데이터리스트 컨트롤 숨김
            if (alsoBoughtList.Items.Count == 0)
            {
                alsoBoughtList.Visible = false;
            }
        }
        #endregion
    }
}