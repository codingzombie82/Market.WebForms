using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Market.WebForms.Reply
{
    public partial class Reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Empty
        }
        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("List.aspx");
        }
        protected void btnWrite_Click(object sender, EventArgs e)
        {
            //[1] 변수 선언부
            //[a] 폼
            string strName = this.txtName.Text;
            string strEmail = txtEmail.Text;
            string strHomepage = txtHomepage.Text;
            string strTitle = txtTitle.Text;
            string strContent = txtContent.Text;
            string strEncoding = lstEncoding.SelectedValue;
            string strPassword = txtPassword.Text;
            //[b] 코드
            string strPostIP = Request.UserHostAddress;
            //[c] 쿼리스트링
            int intRef = Convert.ToInt32(Request["Ref"]);
            int intStep = Convert.ToInt32(Request["Step"]);
            int intRefOrder = Convert.ToInt32(Request["RefOrder"]);
            //[2] 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            //[3] 커멘드
            SqlCommand objCmd = new SqlCommand("ReplyReply", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            //[4] 파라미터 추가
            objCmd.Parameters.AddWithValue("@Name", strName);
            objCmd.Parameters.AddWithValue("@Email", strEmail);
            objCmd.Parameters.AddWithValue("@Title", strTitle);
            objCmd.Parameters.AddWithValue("@PostIP", strPostIP);
            objCmd.Parameters.AddWithValue("@Content", strContent);
            objCmd.Parameters.AddWithValue("@Password", strPassword);
            objCmd.Parameters.AddWithValue("@Encoding", strEncoding);
            objCmd.Parameters.AddWithValue("@Homepage", strHomepage);
            objCmd.Parameters.AddWithValue("@Ref", intRef);
            objCmd.Parameters.AddWithValue("@Step", intStep);
            objCmd.Parameters.AddWithValue("@RefOrder", intRefOrder);
            //[!] 실행
            objCmd.ExecuteNonQuery();
            //[5] 마무리
            objCon.Close();
            Response.Redirect("List.aspx");
        }
    }
}
