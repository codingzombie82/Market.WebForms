using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class CheckLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 인증된 고객이라면 바로 주문서 페이지로 이동
            if (Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("CheckOut.aspx");
            }
        }
        protected void cmdGuestLogin_Click(object sender, EventArgs e)
        {
            // 비회원 주문으로 주문서 페이지 이동
            Response.Redirect("CheckOut.aspx");
        }
    }
}