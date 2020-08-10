using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;

namespace Market.WebForms
{
    public partial class GetZipCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 참고. 만약에 부모창(Register.aspx)에서 동이름이 동적으로 넘겨온다면,
            // 해당 동이름의 우편번호 리스트를 그리드에 출력
            if (Request["Dong"] != null)
            {
                txtZip.Text = Request["Dong"];
                btnSearch_Click(null, null);
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
            DataSet ds = db.ExecuteDataSet(CommandType.Text, "Select * From Zip Where Dong Like N'" + txtZip.Text + "%'");
            this.ctlZipColdeList.DataSource = ds;
            this.ctlZipColdeList.DataBind();
        }
    }
}