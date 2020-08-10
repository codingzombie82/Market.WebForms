using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Market.Models
{
    public class ProductRepository
    {
        /// <summary>
        /// 상품 등록 
        /// ProductAdd.aspx에서 사용
        /// </summary>
        /// <param name="product">상품상세 개체</param>
        /// <returns>현재 입력된 상품의 상품번호</returns>
        public int AddProduct(Product product)
        {
            // 커넥션
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            // 커멘드
            SqlCommand objCmd = new SqlCommand("ProductsAdd", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            // 파라미터 추가
            SqlParameter parameterProductID =
                new SqlParameter("@CategoryId", SqlDbType.Int, 4);
            parameterProductID.Value = product.CategoryId;
            objCmd.Parameters.Add(parameterProductID);

            objCmd.Parameters.AddWithValue("@ModelNumber", product.ModelNumber);
            objCmd.Parameters.AddWithValue("@ModelName", product.ModelName);
            objCmd.Parameters.AddWithValue("@Company", product.Company);
            objCmd.Parameters.AddWithValue("@OriginPrice", product.OriginPrice);
            objCmd.Parameters.AddWithValue("@SellPrice", product.SellPrice);
            objCmd.Parameters.AddWithValue("@EventName", product.EventName);
            objCmd.Parameters.AddWithValue("@ProductImage", product.ProductImage);
            objCmd.Parameters.AddWithValue("@Explain", product.Explain);
            objCmd.Parameters.AddWithValue("@Description", product.Description);
            objCmd.Parameters.AddWithValue("@Encoding", product.Encoding);
            objCmd.Parameters.AddWithValue("@ProductCount", product.ProductCount);
            objCmd.Parameters.AddWithValue("@Mileage", product.Mileage);
            objCmd.Parameters.AddWithValue("@Absence", product.Absence);

            SqlParameter parameterProductCount =
                new SqlParameter("@ProductId", SqlDbType.Int, 8);
            parameterProductCount.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterProductCount);

            objCon.Open();
            objCmd.ExecuteNonQuery();
            objCon.Close();


            return (int)parameterProductCount.Value;
        }

        /// <summary>
        /// 전체 카테고리 리스트
        /// CategoryList.ascx에서 사용
        /// </summary>
        /// <returns>카테고리 리스트</returns>
        public SqlDataReader GetProductCategories()
        {
            #region ADO.NET 클래스 사용
            SqlConnection objCon =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();

            SqlCommand objCmd = new SqlCommand("ProductCategoryList", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
            #endregion
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
            SqlConnection objCon = new SqlConnection(
                ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();

            SqlCommand objCmd = new SqlCommand("ProductsByCategory", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCategoryID = new SqlParameter("@CategoryId", SqlDbType.Int, 4);
            parameterCategoryID.Value = intCategoryID;
            objCmd.Parameters.Add(parameterCategoryID);

            SqlDataReader result =
                objCmd.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
            #endregion
        }

        /// <summary>
        /// 상품 상세 정보 반환 
        /// Product.aspx에서 사용
        /// </summary>
        /// <param name="intProductID">상품 번호</param>
        /// <returns>Product 형식의 데이터</returns>
        public Product GetProduct(int intProductID)
        {
            #region ADO.NET 클래스 사용
            // 커넥션
            SqlConnection objCon =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            // 커멘드
            SqlCommand objCmd = new SqlCommand("ProductDetail", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            // 파라미터 추가
            SqlParameter parameterProductID =
                new SqlParameter("@ProductId", SqlDbType.Int, 4);
            parameterProductID.Value = intProductID;
            objCmd.Parameters.Add(parameterProductID);

            SqlParameter parameterOriginPrice =
                new SqlParameter("@OriginPrice", SqlDbType.Int, 8);
            parameterOriginPrice.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterOriginPrice);

            SqlParameter parameterSellPrice =
                new SqlParameter("@SellPrice", SqlDbType.Int, 8);
            parameterSellPrice.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterSellPrice);

            SqlParameter parameterModelNumber =
                new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
            parameterModelNumber.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterModelNumber);

            SqlParameter parameterModelName =
                new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
            parameterModelName.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterModelName);

            SqlParameter parameterCompany =
                new SqlParameter("@Company", SqlDbType.NVarChar, 50);
            parameterCompany.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterCompany);

            SqlParameter parameterProductImage =
                new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
            parameterProductImage.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterProductImage);

            SqlParameter parameterDescription =
                new SqlParameter("@Description", SqlDbType.NVarChar, 4000);
            parameterDescription.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterDescription);

            SqlParameter parameterProductCount =
                new SqlParameter("@ProductCount", SqlDbType.Int, 8);
            parameterProductCount.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(parameterProductCount);

            objCon.Open();
            objCmd.ExecuteNonQuery();
            objCon.Close();

            // Product 형식변수에 저장
            Product myProduct = new Product();

            myProduct.ModelNumber = (string)parameterModelNumber.Value;
            myProduct.ModelName = (string)parameterModelName.Value;
            myProduct.Company = (string)parameterCompany.Value;
            myProduct.OriginPrice = (int)parameterOriginPrice.Value;
            myProduct.SellPrice = (int)parameterSellPrice.Value;
            myProduct.ProductImage = ((string)parameterProductImage.Value).Trim();
            myProduct.Description = Convert.ToString(parameterDescription.Value);
            myProduct.ProductCount = (int)parameterProductCount.Value;

            return myProduct;
            #endregion
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
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            objCon.Open();

            SqlCommand objCmd = new SqlCommand("CustomerAlsoBought", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterProductID = new SqlParameter("@ProductId", SqlDbType.Int, 4);
            parameterProductID.Value = intProductID;
            objCmd.Parameters.Add(parameterProductID);

            SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
            #endregion
        }

        /// <summary>
        /// 지난 일주일동안 가장 인기있었던 제품리스트
        /// PopularItems.ascx에서 사용
        /// </summary>
        /// <returns>상품 리스트</returns>
        public SqlDataReader GetMostPopularProductsOfWeek()
        {
            #region ADO.NET 클래스 사용
            SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand objCmd = new SqlCommand("ProductsMostPopular", objCon);

            objCmd.CommandType = CommandType.StoredProcedure;

            objCon.Open();
            SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
            #endregion
        }

        /// <summary>
        /// 상품 검색 결과 : 넘겨져 온 검색어에 따른 상품리스트
        /// SearchResults.aspx에서 사용
        /// </summary>
        /// <param name="searchString">검색할 상품명</param>
        /// <returns>상품 검색 결과 리스트</returns>
        public SqlDataReader GetProductsBySearchString(string searchString)
        {
            #region ADO.NET 클래스 사용
            // 커넥션
            SqlConnection objCon =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            // 커멘드
            SqlCommand objCmd = new SqlCommand("ProductSearch", objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            // 파라미터
            SqlParameter parameterSearch = new SqlParameter("@Search", SqlDbType.NVarChar, 255);
            parameterSearch.Value = searchString;
            objCmd.Parameters.Add(parameterSearch);

            // 명령 실행
            objCon.Open();
            SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

            // 데이터리더 개체 반환
            return result;
            #endregion
        }
    }
}
