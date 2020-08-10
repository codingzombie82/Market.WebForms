using System;
namespace Market.WebForms.Controls
{
    public partial class SearchFormUserControl : System.Web.UI.UserControl
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Empty
        }

        protected void btnSearch_Click(object sender, System.EventArgs e)
        {
            Response.Redirect(String.Format("SearchResults.aspx?txtSearch={0}", this.txtSearch.Text));
        }
        #endregion
    }
}