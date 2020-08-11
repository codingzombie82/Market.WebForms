using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Market.WebForms.Reply
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["Num"]))
            {
                Response.Write("잘못된 요청");
                Response.End();
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    ReadData();
                }
            }
        }
        private void ReadData()
        {
            //[1] 변수 선언부
            string strNum = Request["Num"];
            string strSql = "ViewReply";
            //[2] 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            //[3] 커멘드
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            //[!] 파라미터 추가
            objCmd.Parameters.AddWithValue("@Num", strNum);
            //[4] 데이터리더 및 실행
            SqlDataReader objDr = objCmd.ExecuteReader();
            if (objDr.Read())
            {
                this.lblNum.Text = objDr[0].ToString();
                this.lblTitle.Text = objDr["Title"].ToString();
                this.lblName.Text = objDr["Name"].ToString();
                this.lblEmail.Text = objDr["Email"].ToString();
                this.lblHomepage.Text = objDr["Homepage"].ToString();
                this.lblPostDate.Text = objDr["PostDate"].ToString();
                this.lblReadCount.Text = objDr["ReadCount"].ToString();
                this.lblPostIP.Text = objDr["PostIP"].ToString();
                this.lblContent.Text = objDr["Content"].ToString();
                ViewState["Ref"] = objDr["Ref"];
                Session["Step"] = objDr["Step"];
                ViewState["RefOrder"] = objDr["RefOrder"];
            }
            //[5] 마무리
            objDr.Close();
            objCon.Close();
        }
        protected void btnReply_Click(object sender, EventArgs e)
        {
            // 답변 페이지로 현재 글의 Num, Ref, Step, RefOrder 값 넘기기
            string strUrl = String.Format(
              "Reply.aspx?Num={0}&Ref={1}&Step={2}&RefOrder={3}"
            , Request["Num"]
            , ViewState["Ref"]
            , Session["Step"]
            , ViewState["RefOrder"]);
            Response.Redirect(strUrl);
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            // 수정 페이지로 현재 글의 번호 값 넘김
            string strUrl = String.Empty;
            strUrl = "./Modify.aspx?Num=" + Request["Num"];
            Response.Redirect(strUrl);
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // 삭제 페이지로 현재 글의 번호 값 넘김
            Response.Redirect(
              String.Format("./Delete.aspx?Num={0}", Request["Num"]));
        }
        protected void btnList_Click(object sender, EventArgs e)
        {
            // 리스트 페이지로 이동
            Response.Redirect("./List.aspx");
        }
    }
}
