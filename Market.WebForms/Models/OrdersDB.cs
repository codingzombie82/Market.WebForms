using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// �ֹ� �� ���� ���� Ŭ����
/// Orders���̺�� �ϴ��Ϸ� ��ġ�Ǵ� Ŭ����
/// </summary>
public class OrderDetails 
{
    public string CustomerID { get; set; } //[3] .NET 3.X ���� �̻󿡼��� �Ӽ�

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
	public DataSet OrderItems { get; set; } // �ֹ� �׸� : �ϳ��� �ֹ��� ������ ��ǰ����Ʈ
}

/// <summary>
/// �ֹ� ó�� Ŭ����
/// </summary>
public class OrdersDB
{
    /// <summary>
    /// �ֹ� ó�� �Ϸ� : orders ���̺� ������ ����
    /// CheckOut.aspx���� ��� : �ֹ� ����
    /// </summary>
    /// <param name="orderDetails">�ֹ����̺� ����</param>
    /// <returns>�ֹ���ȣ(������ȣ)</returns>
	public int PlaceOrder(OrderDetails orderDetails) 
	{
		// Ŀ�ؼ�
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

		// Ŀ���
		SqlCommand objCmd = new SqlCommand("OrdersAdd", objCon);
		// Ŀ��� Ÿ��
		objCmd.CommandType = CommandType.StoredProcedure;

		// ���ڵ�
		SqlParameter parameterCustomerID = 
			new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerID.Value = orderDetails.CustomerID;
		objCmd.Parameters.Add(parameterCustomerID);
		// �ֹ�����
		SqlParameter parameterOrderDate = 
			new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
		parameterOrderDate.Value = DateTime.Now;
		objCmd.Parameters.Add(parameterOrderDate);
		// �������
		SqlParameter parameterShipDate = 
			new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
		parameterShipDate.Value = CalculateShippingDate();
		objCmd.Parameters.Add(parameterShipDate);
		// �ֹ��ѱݾ�
		SqlParameter parameterTotalPrice = 
			new SqlParameter("@TotalPrice", SqlDbType.Int, 4);
		parameterTotalPrice.Value = orderDetails.TotalPrice;
		objCmd.Parameters.Add(parameterTotalPrice);
		// �ֹ�����
		SqlParameter parameterOrderStatus = 
			new SqlParameter("@OrderStatus", SqlDbType.NVarChar, 20);
		parameterOrderStatus.Value = orderDetails.OrderStatus;
		objCmd.Parameters.Add(parameterOrderStatus);
		// �������
		SqlParameter parameterPayment = 
			new SqlParameter("@Payment", SqlDbType.NVarChar, 20);
		parameterPayment.Value = orderDetails.Payment;
		objCmd.Parameters.Add(parameterPayment);
		// �����ݾ�
		SqlParameter parameterPaymentPrice = 
			new SqlParameter("@PaymentPrice", SqlDbType.Int, 4);
		parameterPaymentPrice.Value = orderDetails.PaymentPrice;
		objCmd.Parameters.Add(parameterPaymentPrice);
		// ��������
		SqlParameter parameterPaymentInfo = 
			new SqlParameter("@PaymentInfo", SqlDbType.NVarChar, 20);
		parameterPaymentInfo.Value = orderDetails.PaymentInfo;
		objCmd.Parameters.Add(parameterPaymentInfo);
		// �����Ϸ���
		SqlParameter parameterPaymentEndDate = 
			new SqlParameter("@PaymentEndDate", SqlDbType.DateTime, 8);
		parameterPaymentEndDate.Value = DateTime.Now;//orderDetails.PaymentEndDate;//������ ���
		objCmd.Parameters.Add(parameterPaymentEndDate);
		// ���������
		SqlParameter parameterDeliveryInfo = 
			new SqlParameter("@DeliveryInfo", SqlDbType.Int, 4);
		parameterDeliveryInfo.Value = orderDetails.DeliveryInfo;
		objCmd.Parameters.Add(parameterDeliveryInfo);
		// ��ۻ���
		SqlParameter parameterDeliveryStatus = 
			new SqlParameter("@DeliveryStatus", SqlDbType.NVarChar, 20);
		parameterDeliveryStatus.Value = orderDetails.DeliveryStatus;
		objCmd.Parameters.Add(parameterDeliveryStatus);
		// �ŷ��Ϸ�����
		SqlParameter parameterDeliveryEndDate = 
			new SqlParameter("@DeliveryEndDate", SqlDbType.DateTime, 8);
		parameterDeliveryEndDate.Value = DateTime.Now;//orderDetails.DeliveryEndDate;//������ ���
		objCmd.Parameters.Add(parameterDeliveryEndDate);
		// �ֹ��ھ������ּ�
		SqlParameter parameterOrderIP = 
			new SqlParameter("@OrderIP", SqlDbType.NVarChar, 15);
		parameterOrderIP.Value = orderDetails.OrderIP;
		objCmd.Parameters.Add(parameterOrderIP);
		// �ֹ���й�ȣ
		SqlParameter parameterPassword = 
			new SqlParameter("@Password", SqlDbType.NVarChar, 20);
		parameterPassword.Value = orderDetails.Password;
		objCmd.Parameters.Add(parameterPassword);
		// ����īƮ ��ȣ
		SqlParameter parameterCartID = 
			new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
		parameterCartID.Value = orderDetails.CartID;
		objCmd.Parameters.Add(parameterCartID);
		// ���� �޸�
		SqlParameter parameterMessage = 
			new SqlParameter("@Message", SqlDbType.NVarChar, 50);
		parameterMessage.Value = orderDetails.Message;
		objCmd.Parameters.Add(parameterMessage);
		// ����� �̸�
		SqlParameter parameterCustomerName = 
			new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
		parameterCustomerName.Value = orderDetails.CustomerName;
		objCmd.Parameters.Add(parameterCustomerName);
		// ����� ��ȭ��ȣ
		SqlParameter parameterTelePhone = 
			new SqlParameter("@TelePhone", SqlDbType.NVarChar, 20);
		parameterTelePhone.Value = orderDetails.TelePhone;
		objCmd.Parameters.Add(parameterTelePhone);
		// ����� �޴�����ȣ
		SqlParameter parameterMobilePhone = 
			new SqlParameter("@MobilePhone", SqlDbType.NVarChar, 20);
		parameterMobilePhone.Value = orderDetails.MobilePhone;
		objCmd.Parameters.Add(parameterMobilePhone);
		// ����� �����ȣ
		SqlParameter parameterZipCode = 
			new SqlParameter("@ZipCode", SqlDbType.NVarChar, 7);
		parameterZipCode.Value = orderDetails.ZipCode;
		objCmd.Parameters.Add(parameterZipCode);
		// ����� �ּ�
		SqlParameter parameterAddress = 
			new SqlParameter("@Address", SqlDbType.NVarChar, 100);
		parameterAddress.Value = orderDetails.Address;
		objCmd.Parameters.Add(parameterAddress);
		// ����� ���ּ�
		SqlParameter parameterAddressDetail = 
			new SqlParameter("@AddressDetail", SqlDbType.NVarChar, 50);
		parameterAddressDetail.Value = orderDetails.AddressDetail;
		objCmd.Parameters.Add(parameterAddressDetail);
		// �ֹ���ȣ : ��ȯ��
		SqlParameter parameterOrderID = 
			new SqlParameter("@OrderID", SqlDbType.Int, 4);
		parameterOrderID.Direction = ParameterDirection.Output;
		objCmd.Parameters.Add(parameterOrderID);
		// Ŀ�ؼ� ���� �� ��� ����
		objCon.Open();
		objCmd.ExecuteNonQuery();
		objCon.Close();

		// �ֹ���ȣ(OrderID) ��ȯ
		return (int)parameterOrderID.Value;
	}

    /// <summary>
    /// ���� ��¥�� �������� ����, ����, �� ��¥�� ��ȯ
    /// CheckOut.aspx���� ��� : �����ϰ� ����� ��� �� ��ȯ
    /// </summary>
    /// <returns>��� ������</returns>
	public DateTime CalculateShippingDate() 
	{
		Random x = new Random();
		double myrandom = (double)x.Next(0,3);
		return DateTime.Now.AddDays(myrandom);//���� ���ܽ� +1 
	}	

    /// <summary>
    /// ����ȣ�� ���� �ֹ� ����Ʈ
    /// OrderList.aspx���� ��� : ȸ����
    /// </summary>
    /// <param name="customerID">����ȣ/������ȣ</param>
    /// <returns>�ֹ� ����Ʈ</returns>
	public SqlDataReader GetCustomerOrders(string customerID) 
	{
		// Ŀ�ؼ�
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		
		// Ŀ���
		SqlCommand objCmd = new SqlCommand("OrdersList", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		// �Ķ����
		SqlParameter parameterCustomerid = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerid.Value = Int32.Parse(customerID);
		objCmd.Parameters.Add(parameterCustomerid);

		// ����
		objCon.Open();
		SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

		// ��� �����ͼ� ����
		return result;
	}	

    /// <summary>
    /// �ֹ���ȣ/��ȣ�� ���� �� ��ȸ���� �ֹ� ����Ʈ
    /// OrderList.aspx���� ��� : ��ȸ����
    /// </summary>
    /// <param name="orderID">�ֹ��� �ֹ���ȣ</param>
    /// <param name="password">�ֹ��� ��й�ȣ</param>
    /// <returns>�ֹ� ����Ʈ</returns>
	public SqlDataReader GetNonCustomerOrders(string orderID, string password) 
	{
		// Ŀ�ؼ�
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		
		// Ŀ���
		SqlCommand objCmd = new SqlCommand("OrdersListNonCustomer", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		// �Ķ����
		SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
		parameterOrderID.Value = Int32.Parse(orderID);
		objCmd.Parameters.Add(parameterOrderID);

		SqlParameter parameterPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 20);
		parameterPassword.Value = password;
		objCmd.Parameters.Add(parameterPassword);

		// ����
		objCon.Open();
		SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

		// ��� �����ͼ� ����
		return result;
	}	

    /// <summary>
    /// �ֹ��� ���� �ֹ� �� ����
    /// OrderDetails.aspx���� ��� 
    /// </summary>
    /// <param name="orderID">�ֹ���ȣ</param>
    /// <returns>�ֹ� �� ���� ����Ʈ</returns>
	public OrderDetails GetOrderDetails(int orderID) 
	{
		// Ŀ�ؼ�
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

		// Ŀ���
		SqlDataAdapter objCmd = new SqlDataAdapter("OrdersDetail", objCon);
		objCmd.SelectCommand.CommandType = CommandType.StoredProcedure;

		// �Ķ����
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

		// ä���
		DataSet myDataSet = new DataSet();
		objCmd.Fill(myDataSet, "OrderItems");
          
		if (parameterShipDate.Value != DBNull.Value) 
		{            
			OrderDetails myOrderDetails = new OrderDetails();

			myOrderDetails.OrderDate = (DateTime)parameterOrderDate.Value;
			myOrderDetails.ShipDate = (DateTime)parameterShipDate.Value;
			myOrderDetails.TotalPrice = (int)parameterTotalPrice.Value;
			myOrderDetails.OrderItems = myDataSet;

			// �����ͼ� ��ȯ
			return myOrderDetails;
		}
		else
			return null;
	}
}
