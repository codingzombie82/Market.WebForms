using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Admin.QA
{
    public partial class QA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.End(); // 사용하려면 현재 라인을 주석 처리 후 사용하세요.
        }
        protected void btnExecute_Click(object sender, EventArgs e)
        {

            // Go -> ;으로 변경 후 ; 으로 Split()해서 있는만큼 반복해 실행
            (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteNonQuery(CommandType.Text, @txtQuery.Text);
        }
    }
}