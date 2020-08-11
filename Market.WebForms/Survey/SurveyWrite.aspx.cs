using System;
using System.Web.UI.WebControls;

namespace Market.WebForms.Survey
{
    public partial class SurveyWrite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //// 인증된 사용자만 글쓰기
            //if (Page.User.Identity.Name.ToLower() == "admin"
            //    || Roles.IsUserInRole("Administrators"))
            //{
            //  // 인증된 사용자면 현재 페이지 보이기
            //}
            //else
            //{
            //    // 인증되지 않으면 로그인 페이지로 이동
            //    Response.Redirect("~/Login.aspx?returnUrl=Survey/SurveyWrite.aspx");
            //}
        }
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            // 설문 등록 후 설문 리스트로 이동
            Response.Redirect("SurveyList.aspx");
        }
    }
}