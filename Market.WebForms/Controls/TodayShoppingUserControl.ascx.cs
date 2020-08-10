using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Controls
{
    public partial class TodayShoppingUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 현재 보고 있는 상품의 ProductID값을 콤마를 구분자로 기록
            Response.Cookies["TodayShopping"].Value = Request.Cookies["TodayShopping"].Value + Request["ProductID"] + ",";

            // 만약에 TodayShopping이라는 쿠키값이 없으면 생성
            if (Request.Cookies["TodayShopping"] != null)
            {
                string[] strProductID = Request.Cookies["TodayShopping"].Value.Split(',');
                foreach (string item in strProductID)
                {
                    if (item != "")
                    {
                        ltrTodayShopping.Text += item + "번 상품<br />";

                    }
                }
            }
        }
    }
}