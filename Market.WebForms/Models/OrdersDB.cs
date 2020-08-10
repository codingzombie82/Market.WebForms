using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 주문 상세 정보 제공 클래스
/// Orders테이블과 일대일로 매치되는 클래스
/// </summary>
public class OrderDetails 
{
    public string CustomerID { get; set; } //[3] .NET 3.X 버전 이상에서의 속성

	/// <summary>
	/// OrderPlaced
	/// </summary>
    public DateTime OrderDate { get; set; }

    public DateTime ShipDate { get; set; }

    public int TotalPrice { get; set; }
	public string OrderStatus { get; set; }
	public string Payment { get; set; }
	public int PaymentPrice { get; set; }
	public string PaymentInfo { get; set; }
	public DateTime PaymentEndDate { get; set; }
	public int DeliveryInfo { get; set; }
	public string DeliveryStatus { get; set; }

	/// <summary>
	/// OrderFulfilled
	/// </summary>
	public DateTime DeliveryEndDate { get; set; }

	public string OrderIP { get; set; }
	public string Password { get; set; }
	//
	public string CartID { get; set; }
	//
	public string Message { get; set; }
	//
	public string CustomerName { get; set; }
	public string TelePhone { get; set; }
	public string MobilePhone { get; set; }
	public string ZipCode { get; set; }
	public string Address { get; set; }
	public string AddressDetail { get; set; }
	//
	public DataSet OrderItems { get; set; } // 주문 항목 : 하나의 주문에 여러개 상품리스트
}

/// <summary>
/// 주문 처리 클래스
/// </summary>
public class OrdersDB
{
    /// <summary>
    /// 주문 처리 완료 : orders 테이블에 데이터 저장
    /// CheckOut.aspx에서 사용 : 주문 실행
    /// </summary>
    /// <param name="orderDetails">주문테이블 정보</param>
    /// <returns>주문번호(고유번호)</returns>
	public int PlaceOrder(OrderDetails orderDetails) 
	{
		// 커넥션
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

		// 커멘드
		SqlCommand objCmd = new SqlCommand("OrdersAdd", objCon);
		// 커멘드 타입
		objCmd.CommandType = CommandType.StoredProcedure;

		// 고객코드
		SqlParameter parameterCustomerID = 
			new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerID.Value = orderDetails.CustomerID;
		objCmd.Parameters.Add(parameterCustomerID);
		// 주문일자
		SqlParameter parameterOrderDate = 
			new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
		parameterOrderDate.Value = DateTime.Now;
		objCmd.Parameters.Add(parameterOrderDate);
		// 배송일자
		SqlParameter parameterShipDate = 
			new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
		parameterShipDate.Value = CalculateShippingDate();
		objCmd.Parameters.Add(parameterShipDate);
		// 주문총금액
		SqlParameter parameterTotalPrice = 
			new SqlParameter("@TotalPrice", SqlDbType.Int, 4);
		parameterTotalPrice.Value = orderDetails.TotalPrice;
		objCmd.Parameters.Add(parameterTotalPrice);
		// 주문상태
		SqlParameter parameterOrderStatus = 
			new SqlParameter("@OrderStatus", SqlDbType.NVarChar, 20);
		parameterOrderStatus.Value = orderDetails.OrderStatus;
		objCmd.Parameters.Add(parameterOrderStatus);
		// 결제방법
		SqlParameter parameterPayment = 
			new SqlParameter("@Payment", SqlDbType.NVarChar, 20);
		parameterPayment.Value = orderDetails.Payment;
		objCmd.Parameters.Add(parameterPayment);
		// 결제금액
		SqlParameter parameterPaymentPrice = 
			new SqlParameter("@PaymentPrice", SqlDbType.Int, 4);
		parameterPaymentPrice.Value = orderDetails.PaymentPrice;
		objCmd.Parameters.Add(parameterPaymentPrice);
		// 결제상태
		SqlParameter parameterPaymentInfo = 
			new SqlParameter("@PaymentInfo", SqlDbType.NVarChar, 20);
		parameterPaymentInfo.Value = orderDetails.PaymentInfo;
		objCmd.Parameters.Add(parameterPaymentInfo);
		// 결제완료일
		SqlParameter parameterPaymentEndDate = 
			new SqlParameter("@PaymentEndDate", SqlDbType.DateTime, 8);
		parameterPaymentEndDate.Value = DateTime.Now;//orderDetails.PaymentEndDate;//관리자 계산
		objCmd.Parameters.Add(parameterPaymentEndDate);
		// 배송지구분
		SqlParameter parameterDeliveryInfo = 
			new SqlParameter("@DeliveryInfo", SqlDbType.Int, 4);
		parameterDeliveryInfo.Value = orderDetails.DeliveryInfo;
		objCmd.Parameters.Add(parameterDeliveryInfo);
		// 배송상태
		SqlParameter parameterDeliveryStatus = 
			new SqlParameter("@DeliveryStatus", SqlDbType.NVarChar, 20);
		parameterDeliveryStatus.Value = orderDetails.DeliveryStatus;
		objCmd.Parameters.Add(parameterDeliveryStatus);
		// 거래완료일자
		SqlParameter parameterDeliveryEndDate = 
			new SqlParameter("@DeliveryEndDate", SqlDbType.DateTime, 8);
		parameterDeliveryEndDate.Value = DateTime.Now;//orderDetails.DeliveryEndDate;//관리자 계산
		objCmd.Parameters.Add(parameterDeliveryEndDate);
		// 주문자아이피주소
		SqlParameter parameterOrderIP = 
			new SqlParameter("@OrderIP", SqlDbType.NVarChar, 15);
		parameterOrderIP.Value = orderDetails.OrderIP;
		objCmd.Parameters.Add(parameterOrderIP);
		// 주문비밀번호
		SqlParameter parameterPassword = 
			new SqlParameter("@Password", SqlDbType.NVarChar, 20);
		parameterPassword.Value = orderDetails.Password;
		objCmd.Parameters.Add(parameterPassword);
		// 쇼핑카트 번호
		SqlParameter parameterCartID = 
			new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
		parameterCartID.Value = orderDetails.CartID;
		objCmd.Parameters.Add(parameterCartID);
		// 남길 메모
		SqlParameter parameterMessage = 
			new SqlParameter("@Message", SqlDbType.NVarChar, 50);
		parameterMessage.Value = orderDetails.Message;
		objCmd.Parameters.Add(parameterMessage);
		// 배송자 이름
		SqlParameter parameterCustomerName = 
			new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
		parameterCustomerName.Value = orderDetails.CustomerName;
		objCmd.Parameters.Add(parameterCustomerName);
		// 배송지 전화번호
		SqlParameter parameterTelePhone = 
			new SqlParameter("@TelePhone", SqlDbType.NVarChar, 20);
		parameterTelePhone.Value = orderDetails.TelePhone;
		objCmd.Parameters.Add(parameterTelePhone);
		// 배송지 휴대폰번호
		SqlParameter parameterMobilePhone = 
			new SqlParameter("@MobilePhone", SqlDbType.NVarChar, 20);
		parameterMobilePhone.Value = orderDetails.MobilePhone;
		objCmd.Parameters.Add(parameterMobilePhone);
		// 배송지 우편번호
		SqlParameter parameterZipCode = 
			new SqlParameter("@ZipCode", SqlDbType.NVarChar, 7);
		parameterZipCode.Value = orderDetails.ZipCode;
		objCmd.Parameters.Add(parameterZipCode);
		// 배송지 주소
		SqlParameter parameterAddress = 
			new SqlParameter("@Address", SqlDbType.NVarChar, 100);
		parameterAddress.Value = orderDetails.Address;
		objCmd.Parameters.Add(parameterAddress);
		// 배송지 상세주소
		SqlParameter parameterAddressDetail = 
			new SqlParameter("@AddressDetail", SqlDbType.NVarChar, 50);
		parameterAddressDetail.Value = orderDetails.AddressDetail;
		objCmd.Parameters.Add(parameterAddressDetail);
		// 주문번호 : 반환값
		SqlParameter parameterOrderID = 
			new SqlParameter("@OrderID", SqlDbType.Int, 4);
		parameterOrderID.Direction = ParameterDirection.Output;
		objCmd.Parameters.Add(parameterOrderID);
		// 커넥션 오픈 및 명령 실행
		objCon.Open();
		objCmd.ExecuteNonQuery();
		objCon.Close();

		// 주문번호(OrderID) 반환
		return (int)parameterOrderID.Value;
	}

    /// <summary>
    /// 오늘 날짜를 기준으로 오늘, 내일, 모레 날짜를 반환
    /// CheckOut.aspx에서 사용 : 랜덤하게 배송일 계산 후 반환
    /// </summary>
    /// <returns>배송 예정일</returns>
	public DateTime CalculateShippingDate() 
	{
		Random x = new Random();
		double myrandom = (double)x.Next(0,3);
		return DateTime.Now.AddDays(myrandom);//오늘 제외시 +1 
	}	

    /// <summary>
    /// 고객번호에 따른 주문 리스트
    /// OrderList.aspx에서 사용 : 회원용
    /// </summary>
    /// <param name="customerID">고객번호/인증번호</param>
    /// <returns>주문 리스트</returns>
	public SqlDataReader GetCustomerOrders(string customerID) 
	{
		// 커넥션
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		
		// 커멘드
		SqlCommand objCmd = new SqlCommand("OrdersList", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		// 파라미터
		SqlParameter parameterCustomerid = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerid.Value = Int32.Parse(customerID);
		objCmd.Parameters.Add(parameterCustomerid);

		// 실행
		objCon.Open();
		SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

		// 결과 데이터셋 리턴
		return result;
	}	

    /// <summary>
    /// 주문번호/암호가 맞을 때 비회원용 주문 리스트
    /// OrderList.aspx에서 사용 : 비회원용
    /// </summary>
    /// <param name="orderID">주문시 주문번호</param>
    /// <param name="password">주문시 비밀번호</param>
    /// <returns>주문 리스트</returns>
	public SqlDataReader GetNonCustomerOrders(string orderID, string password) 
	{
		// 커넥션
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		
		// 커멘드
		SqlCommand objCmd = new SqlCommand("OrdersListNonCustomer", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		// 파라미터
		SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
		parameterOrderID.Value = Int32.Parse(orderID);
		objCmd.Parameters.Add(parameterOrderID);

		SqlParameter parameterPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 20);
		parameterPassword.Value = password;
		objCmd.Parameters.Add(parameterPassword);

		// 실행
		objCon.Open();
		SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

		// 결과 데이터셋 리턴
		return result;
	}	

    /// <summary>
    /// 주문에 따른 주문 상세 내역
    /// OrderDetails.aspx에서 사용 
    /// </summary>
    /// <param name="orderID">주문번호</param>
    /// <returns>주문 상세 내역 리스트</returns>
	public OrderDetails GetOrderDetails(int orderID) 
	{
		// 커넥션
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

		// 커멘드
		SqlDataAdapter objCmd = new SqlDataAdapter("OrdersDetail", objCon);
		objCmd.SelectCommand.CommandType = CommandType.StoredProcedure;

		// 파라미터
		SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
		parameterOrderID.Value = orderID;
		objCmd.SelectCommand.Parameters.Add(parameterOrderID);

		SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
		parameterOrderDate.Direction = ParameterDirection.Output;
		objCmd.SelectCommand.Parameters.Add(parameterOrderDate);

		SqlParameter parameterShipDate = new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
		parameterShipDate.Direction = ParameterDirection.Output;
		objCmd.SelectCommand.Parameters.Add(parameterShipDate);

		SqlParameter parameterTotalPrice = new SqlParameter("@TotalPrice", SqlDbType.Int, 8);
		parameterTotalPrice.Direction = ParameterDirection.Output;
		objCmd.SelectCommand.Parameters.Add(parameterTotalPrice);

		// 채우기
		DataSet myDataSet = new DataSet();
		objCmd.Fill(myDataSet, "OrderItems");
          
		if (parameterShipDate.Value != DBNull.Value) 
		{            
			OrderDetails myOrderDetails = new OrderDetails();

			myOrderDetails.OrderDate = (DateTime)parameterOrderDate.Value;
			myOrderDetails.ShipDate = (DateTime)parameterShipDate.Value;
			myOrderDetails.TotalPrice = (int)parameterTotalPrice.Value;
			myOrderDetails.OrderItems = myDataSet;

			// 데이터셋 반환
			return myOrderDetails;
		}
		else
			return null;
	}
}
