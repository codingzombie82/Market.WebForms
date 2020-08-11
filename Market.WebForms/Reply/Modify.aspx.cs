using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Market.WebForms.Reply
{
    public partial class Modify : System.Web.UI.Page
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
                this.txtTitle.Text = objDr["Title"].ToString();
                this.txtName.Text = objDr["Name"].ToString();
                this.txtEmail.Text = objDr["Email"].ToString();
                this.txtHomepage.Text = objDr["Homepage"].ToString();
                this.txtContent.Text = objDr["Content"].ToString();
            }
            //[5] 마무리
            objDr.Close();
            objCon.Close();
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            if (IsCorrectPassword())
            {
                ModifyProcess();
            }
            else
            {
                Response.Write("암호가 틀립니다."); Response.End();
            }
        }
        private bool IsCorrectPassword()
        {
            string strSql = "ReadPasswordReply";
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.Parameters.AddWithValue("@Num", Request["Num"]);
            string strPassword = objCmd.ExecuteScalar().ToString();
            if (this.txtPassword.Text == strPassword)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void ModifyProcess()
        {
            //[1] 변수 선언부
            string strName = this.txtName.Text;
            string strEmail = this.txtEmail.Text;
            string strHomepage = this.txtHomepage.Text;
            string strTitle = this.txtTitle.Text;
            string strContent = this.txtContent.Text;
            string strEncoding = this.lstEncoding.SelectedValue;
            string strPassword = this.txtPassword.Text;
            string strModifyIP = Request.UserHostAddress;
            string strSql = "ModifyReply";
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
            objCmd.Parameters.AddWithValue("@ModifyIP", strModifyIP);
            objCmd.Parameters.AddWithValue("@ModifyDate", DateTime.Now);
            objCmd.Parameters.AddWithValue("@Content", strContent);
            objCmd.Parameters.AddWithValue("@Encoding", strEncoding);
            objCmd.Parameters.AddWithValue("@Homepage", strHomepage);
            objCmd.Parameters.AddWithValue("@Num", Request["Num"]);
            //[4] 실행 : ExecuteNonQuery()
            objCmd.ExecuteNonQuery();
            //[5] 마무리
            objCon.Close();
            btnList_Click(null, null); // 이동
        }

        protected void btnList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reply/List.aspx");
        }
    }
}
