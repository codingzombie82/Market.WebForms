using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class ReviewsDB
{
    /// <summary>
    /// 리뷰(상품평) 리스트  
    /// ReviewList.ascx에서 사용
    /// </summary>
    /// <param name="productID">상품번호</param>
    /// <returns>쿼리스트링으로 넘겨온 상품번호에 해당하는 리뷰 리스트 반환</returns>
	public SqlDataReader GetReviews(int productID) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        objCon.Open();

        SqlCommand objCmd = new SqlCommand("ReviewsList", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = productID;
        objCmd.Parameters.Add(parameterProductID);

        SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        return result;
        #endregion
    }

    /// <summary>
    /// 리뷰 저장
    /// ReviewList.ascx에서 사용
    /// </summary>
    /// <param name="productID">상품번호</param>
    /// <param name="customerName">작성자</param>
    /// <param name="customerEmail">이메일</param>
    /// <param name="rating">점수(1~5)</param>
    /// <param name="comments">코멘트 내용</param>
	public void AddReview(int productID, string customerName, string customerEmail, int rating, string comments) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ReviewsAdd", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterProductID =
            new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = productID;
        objCmd.Parameters.Add(parameterProductID);

        SqlParameter parameterCustomerName =
            new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
        parameterCustomerName.Value = customerName;
        objCmd.Parameters.Add(parameterCustomerName);

        SqlParameter parameterEmail =
            new SqlParameter("@CustomerEmail", SqlDbType.NVarChar, 50);
        parameterEmail.Value = customerEmail;
        objCmd.Parameters.Add(parameterEmail);

        SqlParameter parameterRating =
            new SqlParameter("@Rating", SqlDbType.Int, 4);
        parameterRating.Value = rating;
        objCmd.Parameters.Add(parameterRating);

        SqlParameter parameterComments =
            new SqlParameter("@Comments", SqlDbType.NVarChar, 3850);
        parameterComments.Value = comments;
        objCmd.Parameters.Add(parameterComments);

        SqlParameter parameterReviewID =
            new SqlParameter("@ReviewID", SqlDbType.Int, 4);
        parameterReviewID.Direction = ParameterDirection.Output;
        objCmd.Parameters.Add(parameterReviewID);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
    }
}
