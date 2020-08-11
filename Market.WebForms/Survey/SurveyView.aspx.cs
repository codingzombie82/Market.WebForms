using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Web.UI;

namespace Market.WebForms.Survey
{
	public partial class SurveyView : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				DisplayData();
			}
		}

		private void DisplayData()
		{
			//[1] 변수 선언부
			int intOptionCount = 0; // 항목수
			string[] strContents = new string[9];//9개 항목
			int[] intCounts = new int[9];//카운트
			int[] intPercents = new int[9]; // 퍼센트
			int intSurveyCount = 0; // 참가인원
			int intTotalCount = 0; // 총 카운트
								   //[2] 데이터 읽어오기
			using (IDataReader objDr = (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteReader(
					CommandType.Text, "Select * From Surveys Where SurveyID = " + Request["SurveyID"] + " Order By SurveyID Desc"))
			{
				while (objDr.Read())
				{
					this.lblTitle.Text = objDr["Title"].ToString();
					intOptionCount = Convert.ToInt32(objDr["OptionCount"].ToString());
					strContents[0] = objDr["Option1"].ToString();
					strContents[1] = objDr["Option2"].ToString();
					strContents[2] = objDr["Option3"].ToString();
					strContents[3] = objDr["Option4"].ToString();
					strContents[4] = objDr["Option5"].ToString();
					strContents[5] = objDr["Option6"].ToString();
					strContents[6] = objDr["Option7"].ToString();
					strContents[7] = objDr["Option8"].ToString();
					strContents[8] = objDr["Option9"].ToString();
					intCounts[0] = objDr.IsDBNull(17) ? 0 : Convert.ToInt32(objDr[17]);
					intCounts[1] = objDr.IsDBNull(18) ? 0 : Convert.ToInt32(objDr[18]);
					intCounts[2] = objDr.IsDBNull(19) ? 0 : Convert.ToInt32(objDr[19]);
					intCounts[3] = objDr.IsDBNull(20) ? 0 : Convert.ToInt32(objDr[20]);
					intCounts[4] = objDr.IsDBNull(21) ? 0 : Convert.ToInt32(objDr[21]);
					intCounts[5] = objDr.IsDBNull(22) ? 0 : Convert.ToInt32(objDr[22]);
					intCounts[6] = objDr.IsDBNull(23) ? 0 : Convert.ToInt32(objDr[23]);
					intCounts[7] = objDr.IsDBNull(24) ? 0 : Convert.ToInt32(objDr[24]);
					intCounts[8] = objDr.IsDBNull(25) ? 0 : Convert.ToInt32(objDr[25]);
					intSurveyCount = objDr.IsDBNull(26) ? 0 : Convert.ToInt32(objDr[26]);
					intTotalCount = objDr.IsDBNull(27) ? 0 : Convert.ToInt32(objDr[27]);
				}
				objDr.Close();
			}
			//[3] 출력
			// 퍼센트 계산
			for (int i = 0; i <= 8; i++)
			{
				if (intCounts[i] == 0)
				{
					intPercents[i] = 0;
				}
				else
				{
					intPercents[i] =
						(int)(Convert.ToDouble(intCounts[i]) / Convert.ToDouble(intTotalCount) * 1000 / 10);
				}
			}
			// 투표수 출력
			this.lblVoteCount.Text = intSurveyCount.ToString();
			// 설문보기 페이지 출력
			for (int j = 0; j < intOptionCount; j++)
			{
				lblDisplay.Text += Convert.ToString(j + 1) + ". " + strContents[j]
					+ " <img src='images/graph.gif' height='10' width='" +
					Convert.ToInt32(Convert.ToDouble(intPercents[j]) / 100 * 100) * 3 + "'>&nbsp;"
					+ intCounts[j] + "표(" + intPercents[j] + "%)<br />";
			}
		}
	}
}