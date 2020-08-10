using Market.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Controls
{
    public partial class PopularItems : System.Web.UI.UserControl
    {
		#region Controls
		#endregion

		#region Event Handlers
		protected void Page_Load(object sender, System.EventArgs e)
		{
			ProductRepository products = new ProductRepository();

			productList.DataSource = products.GetMostPopularProductsOfWeek();
			productList.DataBind();

			if (productList.Items.Count == 0)
			{
				productList.Visible = false;
			}
		}
		#endregion
	}
}