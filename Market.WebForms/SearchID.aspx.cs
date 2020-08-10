using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class SearchID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Empty
        }
        protected void btnSearchID_Click(object sender, EventArgs e)
        {
            string strSql =
                "SELECT Membership.UserID, Customers.CustomerName FROM Customers "
                + "INNER JOIN MemberShip ON Customers.CustomerID = MemberShip.CustomerID "
                + "Where Customers.CustomerName = '" + txtCustomerName.Text + "'"; // And Customers.Ssn1 = '" + txtSsn1.Text
                                                                                   //+ "' And Customers.Ssn2 = '" + txtSsn2.Text + "'";
            using (IDataReader dr = (new DatabaseProviderFactory()).Create("ConnectionString").ExecuteReader(CommandType.Text, strSql))
            {
                if (dr.Read())
                {
                    this.lblResult.Text =
                        String.Format("이름 : {0}, 아이디 : {1}"
                            , dr["CustomerName"], dr["UserID"]);
                }
                else
                {
                    this.lblResult.Text = "이름 또는 주민번호가 잘못되었습니다.";
                }
            }
        }
    }
}