using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class ProductPages : System.Web.UI.Page
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
            var db = new DatabaseProviderFactory().Create("ConnectionString");

            //[2] 페이징 값 매개변수로 전달 
            DataList1.DataSource = db.ExecuteDataSet("GetProducts", 0);
            DataList1.DataBind();
        }
    }
}