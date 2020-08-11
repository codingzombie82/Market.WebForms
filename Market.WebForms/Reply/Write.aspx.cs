using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Market.WebForms.Reply
{
    public partial class Write : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Empty
        }
        protected void btnWrite_Click(object sender, EventArgs e)
        {
            //[1] 변수 선언부
            string strName = this.txtName.Text;
            string strEmail = this.txtEmail.Text;
            string strHomepage = this.txtHomepage.Text;
            string strTitle = this.txtTitle.Text;
            string strContent = this.txtContent.Text;
            string strEncoding = this.lstEncoding.SelectedValue;
            string strPassword = this.txtPassword.Text;
            string strPostIP = Request.UserHostAddress;
            string strRef = GetMaxRef(); // 가장 큰 부모글의 Ref값
            string strSql = "WriteReply";
            //[2] 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            //[3] 커멘드
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            //[!] 파라미터 추가
            objCmd.Parameters.AddWithValue("@Name", strName);
            objCmd.Parameters.AddWithValue("@Email", strEmail);
            objCmd.Parameters.AddWithValue("@Title", strTitle);
            objCmd.Parameters.AddWithValue("@PostIP", strPostIP);
            objCmd.Parameters.AddWithValue("@Content", strContent);
            objCmd.Parameters.AddWithValue("@Password", strPassword);
            objCmd.Parameters.AddWithValue("@Encoding", strEncoding);
            objCmd.Parameters.AddWithValue("@Homepage", strHomepage);
            objCmd.Parameters.AddWithValue("@Ref", strRef);
            //[4] 실행 : ExecuteNonQuery()
            objCmd.ExecuteNonQuery();
            //[5] 마무리
            objCon.Close();
            btnList_Click(null, null); // 이동
        }

        // 현재 Reply 테이블의 Ref 필드에 저장된 값 중에서 가장 큰값+1
        private string GetMaxRef()
        {
            //[1] 변수선언부
            string strMaxRef = String.Empty;
            string strSql = "Select Max(Ref) As MaxRef From Reply";
            //[2] 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            //[3] 커멘드
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            //[4] 데이터리더
            SqlDataReader objDr = objCmd.ExecuteReader();
            if (objDr.Read())
            {
                strMaxRef =
                  objDr.IsDBNull(0) ? "1" :
                    Convert.ToString(Convert.ToInt32(objDr[0]) + 1);
            }
            //[5] 마무리
            objCon.Close();
            return strMaxRef;
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reply/List.aspx");
        }
    }
}
