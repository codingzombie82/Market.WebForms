using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Reply
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ReadData();
            }
        }
        private void ReadData()
        {
            //[1] 변수 선언부
            string strSql = "ListReply";
            //[2] 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            //[3] 커멘드
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            //[4] 데이터어댑터
            SqlDataAdapter objDa = new SqlDataAdapter();
            objDa.SelectCommand = objCmd;
            //[5] 데이터셋
            DataSet objDs = new DataSet();
            objDa.Fill(objDs, "Reply");
            //[6] 그리드 컨트롤에 바인딩
            this.ctlReplyList.DataSource = objDs.Tables["Reply"].DefaultView;
            this.ctlReplyList.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strSql = "ListReply"; // 저장 프로시저
            string strFilter = // 필터링 조건 : Like절
              lstSearchField.SelectedValue
                + " Like '%" + txtSearchQuery.Text + "%' ";
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand objCmd = new SqlCommand(strSql, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter objDa = new SqlDataAdapter();
            objDa.SelectCommand = objCmd;
            DataSet objDs = new DataSet();//데이터베이스(Database)
            objDa.Fill(objDs, "Reply");
            //[6] 데이터테이블
            DataTable objDt = objDs.Tables["Reply"];//테이블(Table)
                                                    //[7] 데이터뷰
            DataView objDv = objDt.DefaultView; // 뷰(View)
                                                //[8] 필터링(검색)
            objDv.RowFilter = strFilter;//필터링
                                        //[9] 그리드뷰
            this.ctlReplyList.DataSource = objDv;
            this.ctlReplyList.DataBind();
        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            // 글 쓰기 페이지로 이동
            Response.Redirect("./Write.aspx");
        }
        protected void ctlReplyList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.ctlReplyList.PageIndex = e.NewPageIndex;
            ReadData();
        }

        /// <summary>
        /// 넘겨져 온 스텝값만큼 들여쓰기
        /// </summary>
        /// <param name="strStep">Step</param>
        /// <returns>&nbsp; 문자열 반환</returns>
        protected string FuncStep(object objStep)
        {
            int intStep = Convert.ToInt32(objStep);
            string strResult = "";
            for (int i = 0; i < intStep; i++)
            {
                strResult += "&nbsp;&nbsp;"; // 들여쓰기 
            }
            if (intStep > 0) // 답변 이미지 처리
            {
                strResult += "<img src=\"images\\re.gif\" />";
            }
            return strResult;
        }

        protected string GetNewImg(object objPostDate)
        {
            // 넘겨져 온 날짜 모양을 실제 날짜 형식으로 변경
            DateTime dtPostDate =
              Convert.ToDateTime(objPostDate);
            // 현재 날짜 - 넘겨져 온 날짜 => TimeSpan 구조체형 변수
            TimeSpan tsPostDate = DateTime.Now - dtPostDate;
            // 24시간 이내의 글 확인
            if (tsPostDate.TotalHours < 24)
            {
                return "<img src=\"images\\new.gif\" />";
            }
            else
            {
                return String.Empty;
            }
        }
    }
}
