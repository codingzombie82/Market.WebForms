using System;
using System.Web.UI.WebControls;

namespace Market.WebForms.Admin.Notice
{
    public partial class Modify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.HyperLink1.NavigateUrl =
                "View.aspx?Num=" + Request["Num"];
        }
        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("View.aspx?Num=" + Request["Num"]);
        }
    }
}