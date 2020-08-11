using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class PasswordReminder : System.Web.UI.Page
    {
		#region Event Handlers
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Empty
		}

		// 패스워드 전송
		protected void cmdFind_Click(object sender, System.EventArgs e)
		{
			Random r = new Random();//랜덤 개체 생성
			string strPassword =
				Convert.ToString(r.Next(1000, 9999));//1000~9999까지의 문자열
			SqlConnection objCon = new SqlConnection(
				ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			string strSql = @"
			Update MemberShip
			Set
				Password = '" + Security.Encrypt(strPassword) + @"'
			Where
			CustomerID = 
			(
			Select CustomerID From Customers
			Where CustomerName = '" + this.txtCustomerName.Text
				+ @"' And Ssn1 = '" + this.txtSsn1.Text
				+ @"' And Ssn2 = '" + this.txtSsn2.Text + @"'
			)
		";
			SqlCommand objCmd = new SqlCommand(strSql, objCon);
			objCon.Open();
			objCmd.ExecuteNonQuery();
			// 새로운 쿼리문
			objCmd.CommandText = @"
			Select EmailAddress From Customers
			Where CustomerName = '" + this.txtCustomerName.Text
				+ @"' And Ssn1 = '" + this.txtSsn1.Text
				+ @"' And Ssn2 = '" + this.txtSsn2.Text + @"'
		";
			objCmd.CommandType = CommandType.Text;
			string strEmail = objCmd.ExecuteScalar().ToString();//
			objCon.Close();
			// 메일로 전송
			System.Net.Mail.SmtpClient objSmtpMail = new System.Net.Mail.SmtpClient();
			objSmtpMail.Send(
				"admin@shop.com"
				, strEmail
				, "비밀번호 찾기"
				, strPassword + "로 초기화 되었으니, 바꿔서 사용하세요.");
			this.lblDisplay.Text = strPassword + "로 초기화 되었습니다.";
		}
		#endregion
	}
}