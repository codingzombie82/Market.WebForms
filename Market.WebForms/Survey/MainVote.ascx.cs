using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Survey
{
    public partial class MainVoteUserControl : System.Web.UI.UserControl
    {
        private int TotalCount = 0;//총 카운트
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ReadData();
            }
        }
        private void ReadData()
        {
            int intQuestionCount = 0; // 문항수 : 해당 문항수 만큼 반복해서 바인딩
            ListItem item; // 체크박스/라디오버튼리스트에 등록할 항목 저장용 변수
            using (IDataReader objDr = (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteReader(CommandType.Text, "Select Top 1 * From Surveys Order By SurveyID Desc"))
            {
                while (objDr.Read())
                {
                    #region 각각의 컨트롤에 출력
                    ViewState["SurveyID"] = objDr["SurveyID"];//마지막 설문번호

                    this.lblTitle.Text = objDr["Title"].ToString();
                    intQuestionCount = Convert.ToInt32(objDr["OptionCount"].ToString());//설문 문항수
                    ViewState["QuestionOver"] = objDr["OptionType"].ToString();//단일/다중 선택 여부(0/1)
                    TotalCount = objDr.IsDBNull(27) ? 0 : Convert.ToInt32(objDr[27]);//***
                    if (objDr["OptionType"].ToString() == "0")
                    { //단일 선택
                        this.CheckBoxList1.Visible = false;
                        for (int i = 1; i <= intQuestionCount; i++)
                        {
                            item = new ListItem(); item.Value = i.ToString();
                            item.Text = objDr["Option" + i.ToString()].ToString();
                            this.RadioButtonList1.Items.Add(item);
                        }
                    }
                    else
                    {
                        this.RadioButtonList1.Visible = false;
                        for (int i = 1; i <= intQuestionCount; i++)
                        {
                            item = new ListItem(); item.Value = i.ToString();
                            item.Text = objDr["Option" + i.ToString()].ToString();
                            this.CheckBoxList1.Items.Add(item);
                        }
                    }
                    #endregion
                }
                objDr.Close();
            }
        }
        protected void btnVote_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["SurveyWrite"] != null)
            {
                // 저장된 쿠키가 오늘 날짜이면 경고대화상자 출력 그렇지 않으면 투표진행
                if (Request.Cookies["SurveyWrite"].Value ==
                    DateTime.Now.ToShortDateString())
                {
                    string strJs = @"
                    <script language='javascript'>
                    window.alert('이미 투표하셨습니다.');
                    </script>
                ";
                    Page.ClientScript.RegisterClientScriptBlock(
                        this.GetType(), "msg1", strJs);
                }
                else
                {
                    // 쿠키 저장
                    Response.Cookies["SurveyWrite"].Expires = DateTime.Now.AddDays(1); // 하루
                    Response.Cookies["SurveyWrite"].Value = DateTime.Now.ToShortDateString();
                    // 투표 진행
                    VoteProcess();
                }
            }
            else
            {
                // 쿠키 저장
                Response.Cookies["SurveyWrite"].Expires = DateTime.Now.AddDays(1); // 하루
                Response.Cookies["SurveyWrite"].Value = DateTime.Now.ToShortDateString();
                // 투표 진행
                VoteProcess();
            }
        }

        private void VoteProcess()
        {
            #region 라디오버튼 또는 체크박스 리스트 컨트롤의 항목 체크
            int Option1Vote = 0;
            int Option2Vote = 0;
            int Option3Vote = 0;
            int Option4Vote = 0;
            int Option5Vote = 0;
            int Option6Vote = 0;
            int Option7Vote = 0;
            int Option8Vote = 0;
            int Option9Vote = 0;

            if (ViewState["QuestionOver"].ToString() == "0") // 라디오버튼 리스트
            {
                switch (this.RadioButtonList1.SelectedValue)
                {
                    case "1": Option1Vote = 1; break;
                    case "2": Option2Vote = 1; break;
                    case "3": Option3Vote = 1; break;
                    case "4": Option4Vote = 1; break;
                    case "5": Option5Vote = 1; break;
                    case "6": Option6Vote = 1; break;
                    case "7": Option7Vote = 1; break;
                    case "8": Option8Vote = 1; break;
                    case "9": Option9Vote = 1; break;
                }
                TotalCount = TotalCount + 1;
            }
            else
            {
                foreach (ListItem item in this.CheckBoxList1.Items) // 체크박스 리스트
                {
                    if (item.Selected)
                    {
                        switch (item.Value)
                        {
                            case "1": Option1Vote = 1; break;
                            case "2": Option2Vote = 1; break;
                            case "3": Option3Vote = 1; break;
                            case "4": Option4Vote = 1; break;
                            case "5": Option5Vote = 1; break;
                            case "6": Option6Vote = 1; break;
                            case "7": Option7Vote = 1; break;
                            case "8": Option8Vote = 1; break;
                            case "9": Option9Vote = 1; break;
                        }
                        TotalCount = TotalCount + 1;
                    }
                }
            }
            #endregion

            (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteNonQuery(
                CommandType.Text
                , "Update Surveys Set Option1Vote = Option1Vote + " + Option1Vote +
                ",Option2Vote = Option2Vote + " + Option2Vote +
                ",Option3Vote= Option3Vote + " + Option3Vote +
                ",Option4Vote = Option4Vote + " + Option4Vote +
                ",Option5Vote = Option5Vote + " + Option5Vote +
                ",Option6Vote = Option6Vote + " + Option6Vote +
                ",Option7Vote = Option7Vote + " + Option7Vote +
                ",Option8Vote = Option8Vote + " + Option8Vote +
                ",Option9Vote = Option9Vote + " + Option9Vote +
                ",TotalCount = TotalCount + " + TotalCount +
                ",SurveyCount = SurveyCount + 1 Where SurveyID = "
                + ViewState["SurveyID"].ToString()
            );
            btnView_Click(null, null);
        }

        private string _SiteName = "Market"; // 기본값

        public string SiteName
        {
            get { return _SiteName; }
            set { _SiteName = value; }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Survey/SurveyView.aspx?SurveyID=" + ViewState["SurveyID"].ToString());
            //        string strJs = @"
            //			<script>
            //			window.open('/" + SiteName + @"/Survey/SurveyView.aspx?SurveyID=" 
            //            +ViewState["SurveyID"].ToString() 
            //            + @"', 'Survey', 'width=400,height=400');
            //			</script>
            //		";
            //        Page.ClientScript.RegisterStartupScript(
            //            this.GetType(), "SurveyResult", strJs
            //        );
        }
    }
}