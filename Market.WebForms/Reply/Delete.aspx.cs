using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Market.WebForms.Reply
{
    public partial class Delete : System.Web.UI.Page
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
                this.lblNum.Text = Request["Num"];
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (IsPasswordCorrect())
            {
                DeleteProcess();
            }
            else
            {
                this.lblError.Text = "암호가 잘못되었습니다.";
            }
        }
        private bool IsPasswordCorrect()
        {
            string strSql = "ReadPasswordReply";
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.Parameters.AddWithValue("@Num", Request["Num"]);
            string strPassword = objCmd.ExecuteScalar().ToString();
            if (strPassword == this.txtPassword.Text)
                return true;
            return false;
        }
        private void DeleteProcess()
        {
            //[1] 변수 선언부
            string strSql = "DeleteReply";
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.Parameters.AddWithValue("@Num", Request["Num"]);

            objCon.Open();
            objCmd.ExecuteNonQuery();
            objCon.Close();

            Response.Redirect("List.aspx");
        }
    }
}
