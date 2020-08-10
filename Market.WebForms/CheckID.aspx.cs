using System.Data;
using System.Data.SqlClient;

namespace Market.WebForms
{
    public partial class CheckID : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Empty
        }

        protected void btnCheck_Click(object sender, System.EventArgs e)
        {
            SqlConnection objCon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();

            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objCon;
            objCmd.CommandText = "Select UserID From MemberShip Where UserID = '" + this.txtUserID.Text.Trim() + "'";
            objCmd.CommandType = CommandType.Text;

            SqlDataReader objDr = objCmd.ExecuteReader();
            if (objDr.Read())
            {
                this.lblMsg.Text = "사용하실 수 없습니다.";
            }
            else
            {
                this.lblMsg.Text = "사용하실 수 있습니다.";
            }
            objDr.Close(); objCon.Close();
        }
        #endregion
    }
}