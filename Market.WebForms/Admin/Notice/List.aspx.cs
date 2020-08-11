using System;

namespace Market.WebForms.Admin.Notice
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(
                String.Format(
                    "Search.aspx?SearchField={0}&SearchQuery={1}"
                    , lstSearchField.SelectedValue
                    , txtSearchQuery.Text
                ));
        }
    }
}