using System;

namespace Market.WebForms.Admin.Notice
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.lnkModify.NavigateUrl =
                "Modify.aspx?Num=" + Request["Num"];
            this.lnkDelete.NavigateUrl =
                "Delete.aspx?Num=" + Request["Num"];
        }
    }
}