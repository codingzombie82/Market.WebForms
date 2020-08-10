using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class ReviewsDB
{
    /// <summary>
    /// ����(��ǰ��) ����Ʈ  
    /// ReviewList.ascx���� ���
    /// </summary>
    /// <param name="productID">��ǰ��ȣ</param>
    /// <returns>������Ʈ������ �Ѱܿ� ��ǰ��ȣ�� �ش��ϴ� ���� ����Ʈ ��ȯ</returns>
	public SqlDataReader GetReviews(int productID) 
	{
        #region ADO.NET Ŭ���� ���
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
    /// ���� ����
    /// ReviewList.ascx���� ���
    /// </summary>
    /// <param name="productID">��ǰ��ȣ</param>
    /// <param name="customerName">�ۼ���</param>
    /// <param name="customerEmail">�̸���</param>
    /// <param name="rating">����(1~5)</param>
    /// <param name="comments">�ڸ�Ʈ ����</param>
	public void AddReview(int productID, string customerName, string customerEmail, int rating, string comments) 
	{
        #region ADO.NET Ŭ���� ���
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
