using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

/// <summary>
/// 상품의 필드를 구성하는 상품 상세 클래스
/// </summary>
public class ProductDetails
{
    public int ProductID { get; set; }
    public int CategoryID { get; set; }

	//public string  ModelNumber; // public 필드 : X
    public string ModelNumber { get; set; }

    // 상품명
    private string _ModelName;
    public string ModelName
    {
        get { return _ModelName; }
        set { this._ModelName = value; }
    }

    // 제조회사 속성
    public string Company { get; set; }
    public int OriginPrice { get; set; }
    public int SellPrice { get; set; }
    public string EventName { get; set; }
    public string ProductImage { get; set; }
    public string Explain { get; set; }
    public string Description { get; set; }
    public string Encoding { get; set; }
    public int ProductCount { get; set; }
    public DateTime RegistDate { get; set; }
    public int Mileage { get; set; }
    public int Absence { get; set; }
}

public class ProductsDB
{
    /// <summary>
    /// 상품 등록 
    /// ProductAdd.aspx에서 사용
    /// </summary>
    /// <param name="product">상품상세 개체</param>
    /// <returns>현재 입력된 상품의 상품번호</returns>
    public int AddProduct(ProductDetails product)
    {
        // Database 클래스의 인스턴스 생성
        Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
        // DbCommand 클래스의 인스턴스 생성
        DbCommand dbCommand = db.GetStoredProcCommand("ProductsAdd");
        // 파라미터 추가 : Input/Output
        db.AddInParameter(dbCommand, "CategoryID", DbType.Int32, product.CategoryID);
        db.AddInParameter(dbCommand, "ModelNumber", DbType.String, product.ModelNumber);
        db.AddInParameter(dbCommand, "ModelName", DbType.String, product.ModelName);
        db.AddInParameter(dbCommand, "Company", DbType.String, product.Company);
        db.AddInParameter(dbCommand, "OriginPrice", DbType.Int32, product.OriginPrice);
        db.AddInParameter(dbCommand, "SellPrice", DbType.Int32, product.SellPrice);
        db.AddInParameter(dbCommand, "EventName", DbType.String, product.EventName);
        db.AddInParameter(dbCommand, "ProductImage", DbType.String, product.ProductImage);
        db.AddInParameter(dbCommand, "Explain", DbType.Int32, product.Explain);
        db.AddInParameter(dbCommand, "Description", DbType.String, product.Description);
        db.AddInParameter(dbCommand, "Encoding", DbType.String, product.Encoding);
        db.AddInParameter(dbCommand, "ProductCount", DbType.Int32, product.ProductCount);
        db.AddInParameter(dbCommand, "Mileage", DbType.Int32, product.Mileage);
        db.AddInParameter(dbCommand, "Absence", DbType.Int32, product.Absence);
        db.AddOutParameter(dbCommand, "ProductID", DbType.Int32, 8);
        // 실행
        db.ExecuteNonQuery(dbCommand);
        return Convert.ToInt32(db.GetParameterValue(dbCommand, "ProductID"));
    }

    /// <summary>
    /// 전체 카테고리 리스트
    /// CategoryList.ascx에서 사용
    /// </summary>
    /// <returns>카테고리 리스트</returns>
	public SqlDataReader GetProductCategories() 
	{
        #region ADO.NET 클래스 사용
        //SqlConnection objCon = 
        //    new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //objCon.Open();

        //SqlCommand objCmd = new SqlCommand("ProductCategoryList", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader(CommandType.StoredProcedure, "ProductCategoryList");
	}

	/// <summary>
	/// 카테고리에 따른 상품 리스트
	/// ProductsList.aspx에서 사용
	/// </summary>
	/// <param name="intCategoryID">카테고리 번호</param>
	/// <returns>카테고리에 따른 상품 리스트(데이터리더)</returns>
	public SqlDataReader GetProducts(int intCategoryID) 
	{
        #region ADO.NET 클래스 사용
        //SqlConnection objCon = new SqlConnection(
        //    ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //objCon.Open();

        //SqlCommand objCmd = new SqlCommand("ProductsByCategory", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
        //parameterCategoryID.Value = intCategoryID;
        //objCmd.Parameters.Add(parameterCategoryID);

        //SqlDataReader result = 
        //    objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader("ProductsByCategory", intCategoryID);
	}

	/// <summary>
	/// 상품 상세 정보 반환 
	/// ProductDetails.aspx에서 사용
	/// </summary>
	/// <param name="intProductID">상품 번호</param>
	/// <returns>ProductDetails 형식의 데이터</returns>
	public ProductDetails GetProductDetails(int intProductID) 
	{
        #region ADO.NET 클래스 사용
        //// 커넥션
        //SqlConnection objCon =
        //    new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //// 커멘드
        //SqlCommand objCmd = new SqlCommand("ProductDetail", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //// 파라미터 추가
        //SqlParameter parameterProductID =
        //    new SqlParameter("@ProductID", SqlDbType.Int, 4);
        //parameterProductID.Value = intProductID;
        //objCmd.Parameters.Add(parameterProductID);

        //SqlParameter parameterOriginPrice =
        //    new SqlParameter("@OriginPrice", SqlDbType.Int, 8);
        //parameterOriginPrice.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterOriginPrice);

        //SqlParameter parameterSellPrice =
        //    new SqlParameter("@SellPrice", SqlDbType.Int, 8);
        //parameterSellPrice.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterSellPrice);

        //SqlParameter parameterModelNumber =
        //    new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
        //parameterModelNumber.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterModelNumber);

        //SqlParameter parameterModelName =
        //    new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
        //parameterModelName.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterModelName);

        //SqlParameter parameterCompany =
        //    new SqlParameter("@Company", SqlDbType.NVarChar, 50);
        //parameterCompany.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterCompany);

        //SqlParameter parameterProductImage =
        //    new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
        //parameterProductImage.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterProductImage);

        //SqlParameter parameterDescription =
        //    new SqlParameter("@Description", SqlDbType.NVarChar, 4000);
        //parameterDescription.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterDescription);

        //SqlParameter parameterProductCount =
        //    new SqlParameter("@ProductCount", SqlDbType.Int, 8);
        //parameterProductCount.Direction = ParameterDirection.Output;
        //objCmd.Parameters.Add(parameterProductCount);
		
        //objCon.Open();
        //objCmd.ExecuteNonQuery();
        //objCon.Close();

        //// ProductDetails 형식변수에 저장
        //ProductDetails myProductDetails = new ProductDetails();

        //myProductDetails.ModelNumber = (string)parameterModelNumber.Value;
        //myProductDetails.ModelName = (string)parameterModelName.Value;
        //myProductDetails.Company = (string)parameterCompany.Value;
        //myProductDetails.OriginPrice = (int)parameterOriginPrice.Value;
        //myProductDetails.SellPrice = (int)parameterSellPrice.Value;
        //myProductDetails.ProductImage = ((string)parameterProductImage.Value).Trim();
        //myProductDetails.Description = Convert.ToString(parameterDescription.Value);
        //myProductDetails.ProductCount = (int)parameterProductCount.Value;

        //return myProductDetails;  
        #endregion
        // Database 클래스의 인스턴스 생성
        Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
        // DbCommand 클래스의 인스턴스 생성
        DbCommand dbCommand = db.GetStoredProcCommand("ProductDetail");
        // 파라미터 추가 : Input/Output
        db.AddInParameter(dbCommand, "ProductID", DbType.Int32, intProductID);
        db.AddOutParameter(dbCommand, "OriginPrice", DbType.Int32, 8);
        db.AddOutParameter(dbCommand, "SellPrice", DbType.Int32, 8);
        db.AddOutParameter(dbCommand, "ModelNumber", DbType.String, 50);
        db.AddOutParameter(dbCommand, "ModelName", DbType.String, 50);
        db.AddOutParameter(dbCommand, "Company", DbType.String, 50);
        db.AddOutParameter(dbCommand, "ProductImage", DbType.String, 50);
        db.AddOutParameter(dbCommand, "Description", DbType.String, 4000);
        db.AddOutParameter(dbCommand, "ProductCount", DbType.Int32, 8);
        // 실행
        db.ExecuteNonQuery(dbCommand);
        // ProductDetails 형식변수에 저장
        ProductDetails myProductDetails = new ProductDetails();
        myProductDetails.ModelNumber = db.GetParameterValue(dbCommand, "ModelNumber").ToString();
        myProductDetails.ModelName = db.GetParameterValue(dbCommand, "ModelName").ToString();     
        myProductDetails.Company = db.GetParameterValue(dbCommand, "Company").ToString();
        myProductDetails.OriginPrice = Convert.ToInt32(db.GetParameterValue(dbCommand, "OriginPrice"));
        myProductDetails.SellPrice = Convert.ToInt32(db.GetParameterValue(dbCommand, "SellPrice"));
        myProductDetails.ProductImage = db.GetParameterValue(dbCommand, "ProductImage").ToString();
        myProductDetails.Description = db.GetParameterValue(dbCommand, "Description").ToString();
        myProductDetails.ProductCount = 
            Convert.ToInt32(db.GetParameterValue(dbCommand, "ProductCount"));
        return myProductDetails;  
    }

    /// <summary>
    /// 이미 구매한 제품과 같이 구매한 상품리스트를 반환
    /// AlsoBought.ascx에서 사용
    /// </summary>
    /// <param name="intProductID">상품번호</param>
    /// <returns>연관 상품 리스트</returns>
	public SqlDataReader GetProductsAlsoPurchased(int intProductID) 
	{
        #region ADO.NET 클래스 사용
        //SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //objCon.Open();

        //SqlCommand objCmd = new SqlCommand("CustomerAlsoBought", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        //parameterProductID.Value = intProductID;
        //objCmd.Parameters.Add(parameterProductID);

        //SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader("CustomerAlsoBought", intProductID);
	}

    /// <summary>
    /// 지난 일주일동안 가장 인기있었던 제품리스트
    /// PopularItems.ascx에서 사용
    /// </summary>
    /// <returns>상품 리스트</returns>
	public SqlDataReader GetMostPopularProductsOfWeek() 
	{
        #region ADO.NET 클래스 사용
        //SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //SqlCommand objCmd = new SqlCommand("ProductsMostPopular", objCon);

        //objCmd.CommandType = CommandType.StoredProcedure;

        //objCon.Open();
        //SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString"
            ).ExecuteReader(CommandType.StoredProcedure, "ProductsMostPopular");
	}

	/// <summary>
	/// 상품 검색 결과 : 넘겨져 온 검색어에 따른 상품리스트
	/// SearchResults.aspx에서 사용
	/// </summary>
	/// <param name="searchString">검색할 상품명</param>
	/// <returns>상품 검색 결과 리스트</returns>
	public SqlDataReader SearchProductDescriptions(string searchString) 
	{
        #region ADO.NET 클래스 사용
        //// 커넥션
        //SqlConnection objCon =
        //    new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //// 커멘드
        //SqlCommand objCmd = new SqlCommand("ProductSearch", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //// 파라미터
        //SqlParameter parameterSearch = new SqlParameter("@Search", SqlDbType.NVarChar, 255);
        //parameterSearch.Value = searchString;
        //objCmd.Parameters.Add(parameterSearch);

        //// 명령 실행
        //objCon.Open();
        //SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //// 데이터리더 개체 반환
        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader("ProductSearch", searchString);
	}
}