using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class OrderDetailsPage : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // OrderList.aspx에서 주문번호 받기
            int OrderID = Int32.Parse(Request.Params["OrderID"]);

            // 주문 정보 받기
            OrdersDB orderHistory = new OrdersDB();
            OrderDetails myOrderDetails = orderHistory.GetOrderDetails(OrderID);

            // 주문 상세 내역이 있다면 출력
            if (myOrderDetails != null)
            {
                // 데이터 바인딩
                GridControl1.DataSource = myOrderDetails.OrderItems;
                GridControl1.DataBind();

                lblTotal.Text = String.Format("{0:###,###}", myOrderDetails.TotalPrice);
                lblOrderNumber.Text = OrderID.ToString();
                lblOrderDate.Text = myOrderDetails.OrderDate.ToShortDateString();
                lblShipDate.Text = myOrderDetails.ShipDate.ToShortDateString();
            }
            else // 내역이 없을시 메시지 출력
            {
                MyError.Text = "주문 상세 내역이 없습니다.";
                this.DetailsPanel.Visible = false;
            }
        }
        #endregion
    }
}