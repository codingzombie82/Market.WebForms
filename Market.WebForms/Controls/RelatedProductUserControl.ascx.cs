using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Data;

namespace Market.WebForms.Controls
{
    public partial class RelatedProductUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = (new DatabaseProviderFactory()).Create("ConnectionString");

            // 현재 보고 있는 상품(이미지) 이전 상품 2개
            this.ctlPrev.DataSource = db.ExecuteDataSet(CommandType.Text,
                @"Select Top 2 * From Products Where ProductID < " + Request["ProductID"]
                + " Order By ProductID Desc");
            this.ctlPrev.DataBind();
            // 현재 보고 있는 상품(이미지) 다음 상품 2개
            this.ctlNext.DataSource = db.ExecuteDataSet(CommandType.Text,
                @"Select Top 2 * From Products Where ProductID > " + Request["ProductID"]
                + " Order By ProductID Asc");
            this.ctlNext.DataBind();
        }
    }
}