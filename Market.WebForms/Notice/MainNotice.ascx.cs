using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Market.WebForms.Notice
{
	public partial class MainNoticeUserControl : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			objCon.Open();

			SqlCommand objCmd = new SqlCommand("Select Top 7 * From Notice Order By Num Desc", objCon);

			SqlDataReader objDr = objCmd.ExecuteReader();

			StringBuilder sb = new StringBuilder();
			sb.Append("<table border=\"0\" width='100%'><tr><td align='left'>");
			sb.AppendFormat("<a href=\"{0}\"><span style='color:white;font-weight:bold;'>공지사항</span></td><td align='right'><a href=\"{0}\"><span style='color:white;'>more...</span></a>", "/Notice/List.aspx");
			sb.Append("</td></tr><tr><td height='5'></td></tr>");
			while (objDr.Read())
			{
				sb.Append("<tr><td align='left' colspan=\"2\">");
				sb.AppendFormat(
					"<a href=\"/Notice/View.aspx?Num={0}\"><span style='color:white;'>{1}</span></a>"
					, objDr["Num"], objDr["Title"]);
				sb.Append("</td></tr>");
			}
			sb.Append("</table>");

			this.ltrMainNotice.Text = sb.ToString();

			objCon.Close();
		}
	}
}
