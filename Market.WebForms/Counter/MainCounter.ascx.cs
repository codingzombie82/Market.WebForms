using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;

namespace Market.WebForms.Counter
{
    public partial class MainCounterUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region 텍스트 카운터
            // 총 접속자
            this.lblTotalVisit.Text =
                (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteScalar(
                    CommandType.StoredProcedure, "GetTotalVisit").ToString();
            // 오늘 접속자
            this.lblTodayVisit.Text =
                (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteScalar(
                    CommandType.StoredProcedure, "GetTodayVisit").ToString();
            // 현재 접속자
            this.lblCurrentVisit.Text = Application["CurrentVisit"].ToString();
            #endregion

            #region 이미지 카운트로 덮어쓰기
            lblCurrentVisit.Text = ConvertToImageCounter(lblCurrentVisit.Text);
            lblTotalVisit.Text = ConvertToImageCounter(lblTotalVisit.Text);
            lblTodayVisit.Text = ConvertToImageCounter(lblTodayVisit.Text);
            #endregion
        }

        // 넘겨온 숫자값에 해당하는 숫자 이미지 리스트 출력 메서드
        public string ConvertToImageCounter(string totalHit)
        {
            #region 이미지로 표현
            int intCount = Convert.ToInt32(totalHit);
            int j = 7 - totalHit.Length;//숫자의 길이
            string strTable = String.Empty;
            strTable =
            "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"91\" height=\"15\"><tr>";
            for (int i = 1; i <= j; i++)
            {
                if (i <= j)
                {
                    strTable +=
                        "<td><img  height=\"13\" src=\"/Counter/images/d0.gif\" width=\"15\" ></td>";
                }
            }
            for (int i = 1; i <= totalHit.Length; i++)
            {
                switch (intCount.ToString().Substring(i - 1, 1))
                {
                    case "1":
                        strTable +=
        "<td><img height='13' src='/Counter/images/d1.gif' width='15'></td>"; break;
                    case "2":
                        strTable +=
                  "<td><img height='13' src='/Counter/images/d2.gif' width='15'></td>"; break;
                    case "3": strTable += "<td><img height='13' src='/Counter/images/d3.gif' width='15'></td>"; break;
                    case "4": strTable += "<td><img height='13' src='/Counter/images/d4.gif' width='15'></td>"; break;
                    case "5": strTable += "<td><img height='13' src='/Counter/images/d5.gif' width='15'></td>"; break;
                    case "6": strTable += "<td><img height='13' src='/Counter/images/d6.gif' width='15'></td>"; break;
                    case "7": strTable += "<td><img height='13' src='/Counter/images/d7.gif' width='15'></td>"; break;
                    case "8": strTable += "<td><img height='13' src='/Counter/images/d8.gif' width='15'></td>"; break;
                    case "9": strTable += "<td><img height='13' src='/Counter/images/d9.gif' width='15'></td>"; break;
                    case "0": strTable += "<td><img height='13' src='/Counter/images/d0.gif' width='15'></td>"; break;
                }
            }
            strTable += "</tr></table>";
            return strTable;
            #endregion
        }
    }
}