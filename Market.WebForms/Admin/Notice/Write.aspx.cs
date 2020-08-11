using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Admin.Notice
{
    public partial class Write : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            string strJs =
                String.Format(
                    @"
                    <script>
                    window.alert('입력되었습니다.');
                    location.href='List.aspx';
                    </script>
                ");
            Page.ClientScript.RegisterClientScriptBlock(
                this.GetType(), "goList", strJs);
        }
    }
}