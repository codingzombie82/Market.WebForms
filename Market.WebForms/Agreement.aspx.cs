using System.IO;

namespace Market.WebForms
{
	public partial class Agreement : System.Web.UI.Page
    {
		#region Controls
		#endregion

		#region Event Handlers
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 영문 기준
			//			System.IO.StreamReader reader = 
			//				System.IO.File.OpenText(
			//					Server.MapPath("Agreement.txt"));// 같은 경로에 있는 파일
			// 한글 기준
			System.IO.StreamReader reader = new StreamReader(
				Server.MapPath("Agreement.txt")
				, System.Text.Encoding.Default);// 한글 처리

			string inout = reader.ReadLine();// 한줄 읽기
			while (inout != null)
			{
				this.txtAgreement.Text += inout + "\r\n";// 한줄 출력
														 //this.lblAgreement.Text += inout + "<br />";//한줄 출력
				inout = reader.ReadLine();// 다시 읽어오기
			}

			reader.Close();// 리더 개체 종료
		}


		protected void cmdRegister_Click(object sender, System.EventArgs e)
		{
			if (this.chkConfirm.Checked)
			{
				Response.Redirect("Register.aspx");
			}
			else
			{
				// JavaScript 메시지 출력
				Response.Write("<script>alert('약관 동의 해야 함.');</script>");
			}
		}
		#endregion
	}
}