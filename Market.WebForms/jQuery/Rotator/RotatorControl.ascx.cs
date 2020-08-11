using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Web.UI;

namespace Market.WebForms.jQuery.Rotator
{
    public partial class RotatorControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DisplayData();
            }
        }

        private void DisplayData()
        {
            string products = "";
            DataTable dt = (new DatabaseProviderFactory()).Create("ConnectionString")
                .ExecuteDataSet(CommandType.Text,
                    "Select Top 5 * From Products Where EventName = 'HIT'").Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                products += @"
            <div class='divHeight'>
            <a href='../../ProductDetails.aspx?ProductID=" + dt.Rows[i]["ProductID"] + @"'>
            <img src='../../ProductImages/thumbs/" + dt.Rows[i]["ProductImage"] + @"' /><br />
            " + dt.Rows[i]["ModelName"] + @"<br />
            " + dt.Rows[i]["SellPrice"] + @"
            </a>
            </div>
            ";
            }
            ltrNewProducts.Text = products;
        }
    }
}