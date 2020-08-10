using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Admin.Order
{
    public partial class AdminOrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DisplayData();
            }
        }
        // 전체 주문 리스트 출력
        private void DisplayData()
        {
            this.ctlOrderList.DataSource = (new DatabaseProviderFactory()).Create("ConnectionString")
                .ExecuteDataSet(CommandType.Text,
                @"
Select o.OrderID, c.CustomerID, c.CustomerName, o.OrderDate, o.TotalPrice 
From Orders o, Customers c 
Where o.CustomerID = c.CustomerID 
Order By OrderID Desc
            ");
            this.ctlOrderList.DataBind();
        }
        // GridView => Excel
        protected void btnExport_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=FileName.xls");
            Response.Charset = "utf-8";
            Response.ContentType = "application/vnd.xls";
            //한글처리1
            //Response.ContentEncoding = System.Text.Encoding.Default;  
            // 한글처리2
            StringBuilder strHtmlBuild = new StringBuilder();
            strHtmlBuild.Append("<meta http-equiv=Content-Type content='text/html; charset=utf-8'>");
            strHtmlBuild = strHtmlBuild.Append("\r\n");
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            ctlOrderList.RenderControl(htmlWrite);
            Response.Write(strHtmlBuild.ToString());//한글처리
            Response.Write(stringWrite.ToString());
            Response.End();
        }
        //[!] 형식 'GridView'의 컨트롤 'GridView1'은(는) runat=server 
        // 구문과 함께 form 태그 내부에 와야 합니다.
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        protected void btnExportExcelWithDataSet_Click(object sender, EventArgs e)
        {
            // 데이터셋으로 가져오기
            DataSet ds = (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteDataSet(CommandType.Text, @"Select o.OrderID, c.CustomerID, c.CustomerName, o.OrderDate, o.TotalPrice From Orders o, Customers c Where o.CustomerID = c.CustomerID Order By OrderID Desc");
            // 엑셀로 다운로드하는 또 다른 로직
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-excel"; // 파일 형태를 엑셀로
            Response.ContentEncoding = System.Text.Encoding.Default; // 한글처리
            Response.Charset = "euc-kr";
            // 파일명 기록
            Response.AddHeader("Content-Disposition", "attachment;filename=" +
                HttpUtility.UrlEncode(DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls",
                new UTF8Encoding()).Replace("+", "%20"));
            string html = "";
            html += "<table border='1' cellSpacing='1' cellPadding='1'> \r\n";
            #region 헤더부분
            html += "<tr bgcolor='#EFEFEF' align='center'> \r\n";
            html += " <td nowrap align='center' bgcolor='yellow' colspan='2'>출력내용</td> \r\n";
            html += " <td nowrap align='center' bgcolor='yellow' rowspan='2'>비고</td> \r\n";
            html += "</tr> \r\n";
            html += "<tr bgcolor='#EFEFEF' align='center'> \r\n";
            html += " <td nowrap align='center' bgcolor='yellow'>주문번호</td> \r\n";
            html += " <td nowrap align='center' bgcolor='yellow'>고객명</td> \r\n";
            html += "</tr> \r\n";
            #endregion
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    html += "<tr bgcolor='#EFEFEF' align='center'> \r\n";
                    html += " <td nowrap align='center'>" + ds.Tables[0].Rows[i]["OrderID"].ToString() + "</td>\r\n";
                    html += " <td nowrap align='center'>" + ds.Tables[0].Rows[i]["CustomerName"].ToString() + "</td>\r\n";
                    html += " <td nowrap align='center'>&nbsp;</td> \r\n";
                    html += "</tr> \r\n";
                }
            }
            html += "</table>";
            Response.Write((html.ToString()));
            Response.Flush();
            Response.End();
        }
    }
}