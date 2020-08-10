using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 고객 상세 정보
/// Customers/Membership 테이블과 일대일로 매치되는 클래스
/// </summary>
public class CustomerDetails 
{
    	public string CustomerName { get; set; } // prop 코드 조각
	public string Phone1 { get; set; }
	public string Phone2 { get; set; }
	public string Phone3 { get; set; }
	public string Mobile1 { get; set; }
	public string Mobile2 { get; set; }
	public string Mobile3 { get; set; }
	public string Zip { get; set; }
	public string Address { get; set; }
	public string AddressDetail { get; set; }
	public string Ssn1 { get; set; }
	public string Ssn2 { get; set; }
	public string EmailAddress { get; set; }
	public int MemberDivision { get; set; }
	//
	public string UserID { get; set; }
	public string Password { get; set; }
	public string BirthYear { get; set; }
	public string BirthMonth { get; set; }
	public string BirthDay { get; set; }
	public string BirthStatus { get; set; }
	public int Gender { get; set; }
	public string Job { get; set; }
	public int Wedding { get; set; }
	public string Hobby { get; set; }
	public string Homepage { get; set; }
	public string Intro { get; set; }
	public int Mailing { get; set; }
	public int VisitCount { get; set; }
	public DateTime LastVisit { get; set; }
	public int Mileage { get; set; }
	public DateTime JoinDate { get; set; }
}
  
/// <summary>
/// 고객 관리
/// </summary>
public class CustomersDB
{
    /// <summary>
    /// 고객 상세 정보 반환 메서드
    /// </summary>
    /// <param name="customerID">고객번호</param>
    /// <returns>모든 고객정보 리스트</returns>
	public CustomerDetails GetCustomerDetails(string customerID) 
	{
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		objCon.Open();

		SqlCommand objCmd = new SqlCommand("CustomerDetail", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerID.Value = Int32.Parse(customerID);
		objCmd.Parameters.Add(parameterCustomerID);

		SqlDataReader objDr = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

		CustomerDetails customerDetails = new CustomerDetails();

		while(objDr.Read())
		{
			customerDetails.CustomerName = objDr.GetString(0);
			customerDetails.Phone1 = objDr.GetString(1);
			customerDetails.Phone2 = objDr.GetString(2);
			customerDetails.Phone3 = objDr.GetString(3);
			customerDetails.Mobile1 = objDr.GetString(4);
			customerDetails.Mobile2 = objDr.GetString(5);
			customerDetails.Mobile3 = objDr.GetString(6);
			customerDetails.Zip = objDr.GetString(7);
			customerDetails.Address = objDr.GetString(8);
			customerDetails.AddressDetail = objDr.GetString(9);
			customerDetails.Ssn1 = objDr.GetString(10);
			customerDetails.Ssn2 = objDr.GetString(11);
			customerDetails.EmailAddress = objDr.GetString(12);
			customerDetails.MemberDivision = objDr.GetInt32(13);
			//
			customerDetails.UserID = objDr.GetString(14);
			customerDetails.Password = objDr.GetString(15);
			customerDetails.BirthYear = objDr.GetString(16);
			customerDetails.BirthMonth = objDr.GetString(17);
			customerDetails.BirthDay = objDr.GetString(18);
			customerDetails.BirthStatus = objDr.GetString(19);
			customerDetails.Gender = objDr.GetInt32(20);
			customerDetails.Job = objDr.GetString(21);
			customerDetails.Wedding = objDr.GetInt32(22);
			customerDetails.Hobby = objDr.GetString(23);
			customerDetails.Homepage = objDr.GetString(24);
			customerDetails.Intro = objDr.GetString(25);
			customerDetails.Mailing = objDr.GetInt32(26);
			customerDetails.VisitCount = objDr.GetInt32(27);
			customerDetails.LastVisit = objDr.GetDateTime(28);
			customerDetails.Mileage = objDr.GetInt32(29);
			customerDetails.JoinDate = objDr.GetDateTime(30);
		}
		objDr.Close();

		return customerDetails;
	}

    /// <summary>
    /// 회원 가입 : Customers + Membership
    /// Register.aspx에서 사용
    /// </summary>
    /// <param name="customerDetails">고객 정보 클래스</param>
    /// <returns>고객번호</returns>
	public string AddCustomer(CustomerDetails customerDetails) 
	{
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		SqlCommand objCmd = new SqlCommand("CustomerAdd", objCon);

		objCmd.CommandType = CommandType.StoredProcedure;

		// 파라미터 추가
		SqlParameter [] parameters = 
		{
			new SqlParameter("@CustomerName",SqlDbType.NVarChar, 25),
			new SqlParameter("@Phone1",SqlDbType.NVarChar, 4),
			new SqlParameter("@Phone2",SqlDbType.NVarChar, 25),
			new SqlParameter("@Phone3",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile1",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile2",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile3",SqlDbType.NVarChar, 25),
			new SqlParameter("@EmailAddress",SqlDbType.NVarChar, 25),
			new SqlParameter("@MemberDivision",SqlDbType.Int),
			//
			new SqlParameter("@UserID",SqlDbType.NVarChar, 25),
			new SqlParameter("@Password",SqlDbType.NVarChar, 100),
			new SqlParameter("@Zip",SqlDbType.NVarChar, 25),
			new SqlParameter("@Address",SqlDbType.NVarChar, 100),
			new SqlParameter("@AddressDetail",SqlDbType.NVarChar, 100),
			new SqlParameter("@Ssn1",SqlDbType.NVarChar, 6),
			new SqlParameter("@Ssn2",SqlDbType.NVarChar, 7),
			new SqlParameter("@BirthYear",SqlDbType.NVarChar, 4),
			new SqlParameter("@BirthMonth", SqlDbType.NVarChar, 4),
			new SqlParameter("@BirthDay", SqlDbType.NVarChar, 4),
			new SqlParameter("@BirthStatus", SqlDbType.NVarChar, 2),
			new SqlParameter("@Gender", SqlDbType.Int),
			new SqlParameter("@Job",SqlDbType.NVarChar, 25),
			new SqlParameter("@Wedding",SqlDbType.Int),
			new SqlParameter("@Hobby",SqlDbType.NVarChar, 100),
			new SqlParameter("@Homepage",SqlDbType.NVarChar, 100),
			new SqlParameter("@Intro", SqlDbType.NVarChar, 400),
			new SqlParameter("@Mailing", SqlDbType.Int),
			new SqlParameter("@Mileage", SqlDbType.Int),
			new SqlParameter("@CustomerID", SqlDbType.Int, 4)
		};			
		parameters[0].Value = customerDetails.CustomerName;
		parameters[1].Value = customerDetails.Phone1;
		parameters[2].Value = customerDetails.Phone2;
		parameters[3].Value = customerDetails.Phone3;
		parameters[4].Value = customerDetails.Mobile1;
		parameters[5].Value = customerDetails.Mobile2;
		parameters[6].Value = customerDetails.Mobile3;
		parameters[7].Value = customerDetails.EmailAddress;
		parameters[8].Value = 1;
		//
		parameters[9].Value = customerDetails.UserID;
		parameters[10].Value = customerDetails.Password;
		parameters[11].Value = customerDetails.Zip;
		parameters[12].Value = customerDetails.Address;
		parameters[13].Value = customerDetails.AddressDetail;
		parameters[14].Value = customerDetails.Ssn1;
		parameters[15].Value = customerDetails.Ssn2;
		parameters[16].Value = customerDetails.BirthYear;
		parameters[17].Value = customerDetails.BirthMonth;
		parameters[18].Value = customerDetails.BirthDay;
		parameters[19].Value = customerDetails.BirthStatus;
		parameters[20].Value = customerDetails.Gender;
		parameters[21].Value = customerDetails.Job;
		parameters[22].Value = customerDetails.Wedding;
		parameters[23].Value = customerDetails.Hobby;
		parameters[24].Value = customerDetails.Homepage;
		parameters[25].Value = customerDetails.Intro;
		parameters[26].Value = customerDetails.Mailing;
		parameters[27].Value = customerDetails.Mileage;
		parameters[28].Direction = ParameterDirection.Output;

		for(int i = 0;i < parameters.Length;i++)
		{
			objCmd.Parameters.Add(parameters[i]);//파라미터 추가		
		}

		try 
		{
			objCon.Open();
			objCmd.ExecuteNonQuery();
			objCon.Close();

			// 저장 프로시저의 Output 파라미터로 부터 값 반환
			int customerId = (int)parameters[28].Value;

			return customerId.ToString();
		}
		catch 
		{
			return String.Empty;
		}
	}

    /// <summary>
    /// 회원 로그인
    /// Login.aspx에서 사용
    /// </summary>
    /// <param name="userId">아이디</param>
    /// <param name="password">암호</param>
    /// <returns>정상적으로 로그인하면 고객번호, 그렇지 않으면 null</returns>
	public string Login(string userId, string password) 
	{
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		
		SqlCommand objCmd = new SqlCommand("CustomerLogin", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		SqlParameter parameterUserID = 
			new SqlParameter("@UserID", SqlDbType.NVarChar, 50);
		parameterUserID.Value = userId;
		objCmd.Parameters.Add(parameterUserID);

		SqlParameter parameterPassword = 
			new SqlParameter("@Password", SqlDbType.NVarChar, 50);
		parameterPassword.Value = password;
		objCmd.Parameters.Add(parameterPassword);

		SqlParameter parameterCustomerID = 
			new SqlParameter("@CustomerID", SqlDbType.Int, 4);
		parameterCustomerID.Direction = ParameterDirection.Output;
		objCmd.Parameters.Add(parameterCustomerID);

		objCon.Open();
		objCmd.ExecuteNonQuery();
		objCon.Close();

		int customerId = (int)(parameterCustomerID.Value);

		if (customerId == 0) 
		{
			return null;
		}
		else 
		{
			return customerId.ToString();
		}
	}
	
    /// <summary>
    /// CheckOut.aspx에서 사용
    /// 비회원 고객 정보 저장 : Customers
    /// </summary>
    /// <param name="customerDetails">고객 정보 클래스</param>
    /// <returns>고객번호</returns>
	public string AddNonCustomer(CustomerDetails customerDetails) 
	{
		// 커넥션
		SqlConnection objCon = 
			new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

		// 커멘드
		SqlCommand objCmd = new SqlCommand("NonCustomerAdd", objCon);
		objCmd.CommandType = CommandType.StoredProcedure;

		// 파라미터 추가
		SqlParameter [] parameters = 
		{
			new SqlParameter("@CustomerName",SqlDbType.NVarChar, 25),
			new SqlParameter("@Phone1",SqlDbType.NVarChar, 4),
			new SqlParameter("@Phone2",SqlDbType.NVarChar, 25),
			new SqlParameter("@Phone3",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile1",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile2",SqlDbType.NVarChar, 25),
			new SqlParameter("@Mobile3",SqlDbType.NVarChar, 25),
			new SqlParameter("@Zip",SqlDbType.NVarChar, 25),
			new SqlParameter("@Address",SqlDbType.NVarChar, 100),
			new SqlParameter("@AddressDetail",SqlDbType.NVarChar, 100),
			new SqlParameter("@Ssn1",SqlDbType.NVarChar, 6),
			new SqlParameter("@Ssn2",SqlDbType.NVarChar, 7),
			new SqlParameter("@EmailAddress",SqlDbType.NVarChar, 25),
			new SqlParameter("@MemberDivision",SqlDbType.Int),
			new SqlParameter("@CustomerID", SqlDbType.Int)
		};			

		parameters[0].Value = customerDetails.CustomerName;
		parameters[1].Value = customerDetails.Phone1;
		parameters[2].Value = customerDetails.Phone2;
		parameters[3].Value = customerDetails.Phone3;
		parameters[4].Value = customerDetails.Mobile1;
		parameters[5].Value = customerDetails.Mobile2;
		parameters[6].Value = customerDetails.Mobile3;
		parameters[7].Value = customerDetails.Zip;
		parameters[8].Value = customerDetails.Address;
		parameters[9].Value = customerDetails.AddressDetail;
		parameters[10].Value = customerDetails.Ssn1;
		parameters[11].Value = customerDetails.Ssn2;
		parameters[12].Value = customerDetails.EmailAddress;
		parameters[13].Value = 0;//비회원
		parameters[14].Direction = ParameterDirection.Output;

		for(int i = 0;i < parameters.Length;i++)
		{
			objCmd.Parameters.Add(parameters[i]);//파라미터 추가		
		}

		try 
		{
			objCon.Open();
			objCmd.ExecuteNonQuery();
			objCon.Close();

			int customerId = (int)parameters[14].Value;

			return customerId.ToString();
		}
		catch 
		{
			return String.Empty;
		}
	}	
}
