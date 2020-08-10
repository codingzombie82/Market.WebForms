namespace Market.WebForms
{
    public partial class ShowImages : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.imgProductImage.ImageUrl = "~/ProductImages/bigs/" + Request["ProductImage"];
        }
        #endregion
    }
}