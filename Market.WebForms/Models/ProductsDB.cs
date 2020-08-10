using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

/// <summary>
/// ��ǰ�� �ʵ带 �����ϴ� ��ǰ �� Ŭ����
/// </summary>
public class ProductDetails
{
    public int ProductID { get; set; }
    public int CategoryID { get; set; }

	//public string  ModelNumber; // public �ʵ� : X
    public string ModelNumber { get; set; }

    // ��ǰ��
    private string _ModelName;
    public string ModelName
    {
        get { return _ModelName; }
        set { this._ModelName = value; }
    }

    // ����ȸ�� �Ӽ�
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
    /// ��ǰ ��� 
    /// ProductAdd.aspx���� ���
    /// </summary>
    /// <param name="product">��ǰ�� ��ü</param>
    /// <returns>���� �Էµ� ��ǰ�� ��ǰ��ȣ</returns>
    public int AddProduct(ProductDetails product)
    {
        // Database Ŭ������ �ν��Ͻ� ����
        Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
        // DbCommand Ŭ������ �ν��Ͻ� ����
        DbCommand dbCommand = db.GetStoredProcCommand("ProductsAdd");
        // �Ķ���� �߰� : Input/Output
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
        // ����
        db.ExecuteNonQuery(dbCommand);
        return Convert.ToInt32(db.GetParameterValue(dbCommand, "ProductID"));
    }

    /// <summary>
    /// ��ü ī�װ� ����Ʈ
    /// CategoryList.ascx���� ���
    /// </summary>
    /// <returns>ī�װ� ����Ʈ</returns>
	public SqlDataReader GetProductCategories() 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ī�װ��� ���� ��ǰ ����Ʈ
	/// ProductsList.aspx���� ���
	/// </summary>
	/// <param name="intCategoryID">ī�װ� ��ȣ</param>
	/// <returns>ī�װ��� ���� ��ǰ ����Ʈ(�����͸���)</returns>
	public SqlDataReader GetProducts(int intCategoryID) 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ��ǰ �� ���� ��ȯ 
	/// ProductDetails.aspx���� ���
	/// </summary>
	/// <param name="intProductID">��ǰ ��ȣ</param>
	/// <returns>ProductDetails ������ ������</returns>
	public ProductDetails GetProductDetails(int intProductID) 
	{
        #region ADO.NET Ŭ���� ���
        //// Ŀ�ؼ�
        //SqlConnection objCon =
        //    new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //// Ŀ���
        //SqlCommand objCmd = new SqlCommand("ProductDetail", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //// �Ķ���� �߰�
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

        //// ProductDetails ���ĺ����� ����
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
        // Database Ŭ������ �ν��Ͻ� ����
        Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
        // DbCommand Ŭ������ �ν��Ͻ� ����
        DbCommand dbCommand = db.GetStoredProcCommand("ProductDetail");
        // �Ķ���� �߰� : Input/Output
        db.AddInParameter(dbCommand, "ProductID", DbType.Int32, intProductID);
        db.AddOutParameter(dbCommand, "OriginPrice", DbType.Int32, 8);
        db.AddOutParameter(dbCommand, "SellPrice", DbType.Int32, 8);
        db.AddOutParameter(dbCommand, "ModelNumber", DbType.String, 50);
        db.AddOutParameter(dbCommand, "ModelName", DbType.String, 50);
        db.AddOutParameter(dbCommand, "Company", DbType.String, 50);
        db.AddOutParameter(dbCommand, "ProductImage", DbType.String, 50);
        db.AddOutParameter(dbCommand, "Description", DbType.String, 4000);
        db.AddOutParameter(dbCommand, "ProductCount", DbType.Int32, 8);
        // ����
        db.ExecuteNonQuery(dbCommand);
        // ProductDetails ���ĺ����� ����
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
    /// �̹� ������ ��ǰ�� ���� ������ ��ǰ����Ʈ�� ��ȯ
    /// AlsoBought.ascx���� ���
    /// </summary>
    /// <param name="intProductID">��ǰ��ȣ</param>
    /// <returns>���� ��ǰ ����Ʈ</returns>
	public SqlDataReader GetProductsAlsoPurchased(int intProductID) 
	{
        #region ADO.NET Ŭ���� ���
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
    /// ���� �����ϵ��� ���� �α��־��� ��ǰ����Ʈ
    /// PopularItems.ascx���� ���
    /// </summary>
    /// <returns>��ǰ ����Ʈ</returns>
	public SqlDataReader GetMostPopularProductsOfWeek() 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ��ǰ �˻� ��� : �Ѱ��� �� �˻�� ���� ��ǰ����Ʈ
	/// SearchResults.aspx���� ���
	/// </summary>
	/// <param name="searchString">�˻��� ��ǰ��</param>
	/// <returns>��ǰ �˻� ��� ����Ʈ</returns>
	public SqlDataReader SearchProductDescriptions(string searchString) 
	{
        #region ADO.NET Ŭ���� ���
        //// Ŀ�ؼ�
        //SqlConnection objCon =
        //    new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //// Ŀ���
        //SqlCommand objCmd = new SqlCommand("ProductSearch", objCon);
        //objCmd.CommandType = CommandType.StoredProcedure;

        //// �Ķ����
        //SqlParameter parameterSearch = new SqlParameter("@Search", SqlDbType.NVarChar, 255);
        //parameterSearch.Value = searchString;
        //objCmd.Parameters.Add(parameterSearch);

        //// ��� ����
        //objCon.Open();
        //SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        //// �����͸��� ��ü ��ȯ
        //return result; 
        #endregion
        return (SqlDataReader)DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader("ProductSearch", searchString);
	}
}