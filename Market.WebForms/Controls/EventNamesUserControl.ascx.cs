using Microsoft.Practices.EnterpriseLibrary.Data;
using System.ComponentModel;
using System.Data;
using System.Web.UI;

namespace Market.WebForms.Controls
{
    public partial class EventNamesUserControl : System.Web.UI.UserControl
    {
        #region Private Member Variables
        // 필드
        private string _EventsName;
        #endregion

        #region Public Properties
        // 속성
        // 특성 : CategoryAttribute 클래스를 MSDN 온라인에서 검색
        [
            Category("내가 만든 카테고리")
        ]
        public string EventsName
        {
            get { return _EventsName; }
            set { _EventsName = value; }
        }
        #endregion

        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ReadData();
            }
        }
        #endregion

        #region Private Methods
        private void ReadData()
        {
            this.ctlProductCatalog.DataSource = (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteDataSet(CommandType.Text, "Select Top 9 * From Products Where EventName = '" + this._EventsName + "'");
            this.ctlProductCatalog.DataBind();
        }
        #endregion
    }
}