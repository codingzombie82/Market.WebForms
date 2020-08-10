using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Controls
{
    public partial class ReviewListUserControl : System.Web.UI.UserControl
    {
		#region Public Properties
		private int _ProductID;
		[Category("내가 만든 카테고리")]
		public int ProductID        //상품번호 속성 생성 : ProductDetails.aspx에서 채워준다.
		{
			get
			{
				return _ProductID;
			}
			set
			{
				_ProductID = value;
			}
		}
		#endregion

		#region Event Handlers
		// 코멘트 출력
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ReadData();
			}
		}

		// 코멘트 입력
		protected void btnWrite_Click(object sender, System.EventArgs e)
		{
			int productID = ProductID;//Convert.ToInt32(Request["ProductID"]);

			ReviewsDB review = new ReviewsDB();
			review.AddReview(                       // 5개 값 전달(저장)
				productID,
				this.txtCustomerName.Text,
				this.txtCustomerEmail.Text,
				Convert.ToInt32(this.lstRating.SelectedValue),
				this.txtComments.Text
			);

			ReadData();//다시 출력
		}
		#endregion

		#region Private Methods
		private void ReadData()
		{
			// 리뷰 클래스의 인스턴스 생성
			ReviewsDB productReviews = new ReviewsDB();

			// 상품코드 전달 및 코멘트 출력
			this.DataList1.DataSource = productReviews.GetReviews(ProductID);
			//Convert.ToInt32(Request["ProductID"]));
			this.DataList1.DataBind();
		}
		#endregion
	}
}