using System;
using System.Web.UI;

namespace Market.WebForms
{
    public partial class MasterPageMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 로그인하였을 때, 쿠키에 저장된 사용자 이름을 레이블에 출력
            // Login 페이지에서 로그인 성공시 Shopping_CustomerName 쿠키에 사용자명 저장함
            if (Page.User.Identity.IsAuthenticated)
            {
                if (Request.Cookies["Shopping_CustomerName"] != null)
                {
                    ((System.Web.UI.WebControls.Label)this.LoginView1.FindControl("lblUserID")).Text = Server.UrlDecode(Request.Cookies["Shopping_CustomerName"].Value);
                }
            }
        }
    }
}