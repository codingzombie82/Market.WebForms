using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms
{
    public partial class OrderList : System.Web.UI.Page
    {
        #region Controls
        // 학습 목적으로 DataGrid 컨트롤 사용 -> GridView로 대체해도 무관
        protected System.Web.UI.WebControls.DataGrid DataGrid1;
        protected System.Web.UI.WebControls.DataGrid DataGrid2;
        #endregion

        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated) // 인증된 사용자
            {
                this.CustomerPanel.Visible = true;
                this.NonCustomerPanel.Visible = false;

                // 고객코드 받기
                string customerID = Page.User.Identity.Name;

                // 주문 클래스의 인스턴스 생성
                OrdersDB orderHistory = new OrdersDB();

                // 주문 내역 출력
                MyList.DataSource = orderHistory.GetCustomerOrders(customerID); // 정수형으로 넘겨줘도 됨.
                MyList.DataBind();

                // 주문 내역이 없을시
                if (MyList.Items.Count == 0)
                {
                    MyError.Text = "주문 내역이 없습니다.";
                    MyList.Visible = false;
                }
            }
            else // 비회원
            {
                this.CustomerPanel.Visible = false;
                this.NonCustomerPanel.Visible = true;
            }
        }

        protected void cmdOrder_Click(object sender, System.EventArgs e)
        {
            this.CustomerPanel.Visible = true;
            this.NonCustomerPanel.Visible = true;

            // 고객코드 받기
            string strOrderID = this.txtOrderID.Text;
            string strPassword = this.txtPassword.Text;

            // 주문 클래스의 인스턴스 생성
            OrdersDB orderHistory = new OrdersDB();

            // 주문 내역 출력
            MyList.DataSource = orderHistory.GetNonCustomerOrders(strOrderID, strPassword);
            MyList.DataBind();

            // 주문 내역이 없을시
            if (MyList.Items.Count == 0)
            {
                MyError.Text = "주문 내역이 없습니다.";
                MyList.Visible = false;
            }
        }
        #endregion
    }
}