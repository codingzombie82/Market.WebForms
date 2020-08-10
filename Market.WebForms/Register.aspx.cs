using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Market.WebForms
{
    public partial class Register : System.Web.UI.Page
    {
        #region Event Handlers
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // 여기에 사용자 코드를 배치하여 페이지를 초기화합니다.
        }

        // 회원 가입 버튼
        protected void btnRegister_Click(object sender, System.EventArgs e)
        {
            // 쇼핑 카드 업데이트
            ShoppingCartDB shoppingCart = new ShoppingCartDB();
            String tempCartId = shoppingCart.GetShoppingCartId();

            // 고객 클래스 인스턴스 생성
            CustomersDB accountSystem = new CustomersDB();
            CustomerDetails customerDetails = new CustomerDetails();

            customerDetails.CustomerName = this.txtCustomerName.Text;
            customerDetails.Phone1 = this.txtPhone1.Text;
            customerDetails.Phone2 = this.txtPhone2.Text;
            customerDetails.Phone3 = this.txtPhone2.Text;
            customerDetails.Mobile1 = this.txtMobile1.Text;
            customerDetails.Mobile2 = this.txtMobile2.Text;
            customerDetails.Mobile3 = this.txtMobile3.Text;
            customerDetails.EmailAddress = this.txtEmailAddress.Text;
            customerDetails.MemberDivision = 1;
            //
            customerDetails.UserID = this.txtUserID.Text;
            customerDetails.Password = Security.Encrypt(txtPassword.Text);
            customerDetails.Zip = this.txtZip.Text;
            customerDetails.Address = this.txtAddress.Text;
            customerDetails.AddressDetail = this.txtAddressDetail.Text;
            customerDetails.Ssn1 = this.txtSsn1.Text;
            customerDetails.Ssn2 = this.txtSsn2.Text;
            customerDetails.BirthYear = this.txtBirthYear.Text;
            customerDetails.BirthMonth = this.txtBirthMonth.Text;
            customerDetails.BirthDay = this.txtBirthDay.Text;
            customerDetails.BirthStatus = this.lstBirthStatus.SelectedValue;
            customerDetails.Gender = Convert.ToInt32(this.lstGender.SelectedValue);
            customerDetails.Job = this.lstJob.SelectedValue;
            customerDetails.Wedding = Convert.ToInt32(this.lstWedding.SelectedValue);
            customerDetails.Hobby = this.txtHobby.Text;
            customerDetails.Homepage = this.txtHomepage.Text;
            customerDetails.Intro = this.txtIntro.Text;
            customerDetails.Mailing = (this.chkMailing.Checked) ? 1 : 0;
            customerDetails.Mileage = 0;

            // 고객 정보 입력
            string customerId = accountSystem.AddCustomer(customerDetails);

            if (customerId != "")
            {
                // 회원가입 후 바로 로그인 처리 : 1, 2, 3
                System.Web.Security.FormsAuthentication.SetAuthCookie(customerId, false);

                shoppingCart.MigrateCart(tempCartId, customerId);
                // 현재 접속자의 이름은 따로 쿠키에 저장 
                //Response.Cookies["Shopping_CustomerName"].Value = Server.HtmlEncode(this.txtCustomerName.Text); // 홍길동
                HttpCookie customerName = new HttpCookie("Shopping_CustomerName", Server.UrlEncode(txtCustomerName.Text));
                customerName.HttpOnly = true;
                Response.Cookies.Add(customerName);
            }
            else
            {
                lblDisplay.Text = "Registration failed:&nbsp; That email address is already registered.<br /><img align=left height=1 width=92 src=images/1x1.gif>";
            }

            string strJs = @"
			<script language='javascript'>
			window.alert('회원가입을 축하드립니다.');
			location.href='Default.aspx';
			</script>
		";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "js", strJs);

            //Response.Redirect("Default.aspx");
        }

        // 주민 번호 찾기 버튼 : 사용X
        protected void btnSsn_Click(object sender, System.EventArgs e)
        {
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();

            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objCon;
            objCmd.CommandText = "Select Ssn1 From Customers Where Ssn1 = '" + this.txtSsn1.Text + "' And Ssn2 = '" + this.txtSsn2.Text + "'";
            objCmd.CommandType = CommandType.Text;
            string strMsg = String.Empty;
            SqlDataReader objDr = objCmd.ExecuteReader();
            if (objDr.Read())
            {
                strMsg = "이미 등록된 주민번호입니다.";
            }
            else
            {
                strMsg = "사용할 수 있는 주민번호입니다.";
            }
            objDr.Close(); objCon.Close();

            string strJs = "<script>";
            strJs += "alert('" + strMsg + "');";
            strJs += "</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "aaa", strJs);//앞
        }

        // 우편 번호 찾기 버튼 : 서버측 이벤트 핸들러 : 사용X
        protected void btnZipCode_Click(object sender, System.EventArgs e)
        {
            string strJs = @"
			<script language='javascript'>
			window.open('./GetZipCode.aspx','','width=400,height=300,scrollbars=yes');
			</script>
		";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GetZipCode", strJs);
        }

        // 아이디 중복 확인 버튼 : 서버측 이벤트 핸들러 : 사용X
        protected void btnCheckID_Click(object sender, System.EventArgs e)
        {
            // 자바스크립트 코드를 변수에 기록
            string strJs = @"
			<script language='javascript'>
			window.open('./CheckID.aspx','','width=400,height=200');
			</script>
		";
            // C# 레벨에서 자바스크립트 코드 실행
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "checkID", strJs);
        }

        // 취소 버튼
        protected void btnDefault_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        #endregion
    }   
}