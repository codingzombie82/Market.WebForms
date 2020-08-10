using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class ShoppingCartDB
{
    /// <summary>
    /// 현재 접속자에게 고유한 키값을 반환
    /// AddToCart.aspx에서 사용
    /// </summary>
    /// <returns>고유한 문자열(인증값(CustomerID/UserID), 랜덤값(GUID))</returns>
	public string GetShoppingCartId() 
	{
		// HttpContext 개체 생성
		System.Web.HttpContext context = System.Web.HttpContext.Current;

		// 인증된 사용자 : 회원
		if (!String.IsNullOrEmpty(context.User.Identity.Name)) 
		{
			return context.User.Identity.Name; // 인증된 사용자명을 입력
		}

		// 인증되지 않은 사용자이지만, 쿠키값이 있다면,
		if (context.Request.Cookies["Shopping_CartID"] != null) 
		{
			return context.Request.Cookies["Shopping_CartID"].Value;
		}
		else 
		{
            // 비회원일 때에는 랜덤한 문자열을 받는다.
			// 랜덤함 GUID 값 생성
			Guid tempCartId = Guid.NewGuid(); // 랜덤한 문자열을 생성하는 코드

			// 쿠키에 tempCartId 값 저장
			context.Response.Cookies["Shopping_CartID"].Value = tempCartId.ToString();

			// tempCartId 반환
			return tempCartId.ToString();
		}
	}

    /// <summary>
    /// 장바구니 담기
    /// AddToCart.aspx에서 사용
    /// </summary>
    /// <param name="cartID">누가</param>
    /// <param name="productID">어떤 제품</param>
    /// <param name="quantity">수량</param>
	public void AddItem(string cartID, int productID, int quantity) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartAddItem", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = productID;
        objCmd.Parameters.Add(parameterProductID);

        SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
        parameterQuantity.Value = quantity;
        objCmd.Parameters.Add(parameterQuantity);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
	}

	/// <summary>
	/// 현재 접속자의 장바구니에 들어있는 상품 개수
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="cartID">현재접속자(회원/비회원)</param>
	/// <returns>상품 개수</returns>
	public int GetItemCount(string cartID) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartItemCount", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlParameter parameterItemCount = new SqlParameter("@ItemCount", SqlDbType.Int, 4);
        parameterItemCount.Direction = ParameterDirection.Output;
        objCmd.Parameters.Add(parameterItemCount);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();

        // 항목 수 반환
        return ((int)parameterItemCount.Value);
        #endregion
    }

	/// <summary>
	/// 현재 접속자의 장바구니 리스트
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="cartID">현재접속자</param>
	/// <returns>데이터리더 개체</returns>
	public SqlDataReader GetItems(string cartID) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        objCon.Open();

        SqlCommand objCmd = new SqlCommand("ShoppingCartList", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlDataReader result = objCmd.ExecuteReader(CommandBehavior.CloseConnection);

        return result;
        #endregion
    }

	/// <summary>
	/// 장바구니 수정
    /// ShoppingCart.aspx에서 사용	
    /// </summary>
	/// <param name="cartID">현재접속자</param>
	/// <param name="productID">현재상품</param>
	/// <param name="quantity">수량</param>
	public void UpdateItem(string cartID, int productID, int quantity) 
	{
		if (quantity < 0) 
		{
			throw new Exception("수량은 0이상이어야 합니다.");
		}

        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartUpdate", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = productID;
        objCmd.Parameters.Add(parameterProductID);

        SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
        parameterQuantity.Value = quantity;
        objCmd.Parameters.Add(parameterQuantity);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
    }

	/// <summary>
	/// 선택한 상품 지우기
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="cartID">현재 접속자/카트고유번호</param>
	/// <param name="productID">상품번호</param>
	public void RemoveItem(string cartID, int productID) 
	{
        #region [1] ADO.NET 클래스 사용 예제
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartRemoveItem", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = productID;
        objCmd.Parameters.Add(parameterProductID);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
    }

	/// <summary>
	/// 현재 장바구니의 총 금액
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="cartID">현재접속자</param>
	/// <returns>장바구니에 담긴 상품의 가격 총 합계</returns>
	public int GetTotal(string cartID) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon =
            new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartTotal", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        parameterCartID.Value = cartID;
        objCmd.Parameters.Add(parameterCartID);

        SqlParameter parameterTotalCost = new SqlParameter("@TotalCost", SqlDbType.Int, 8);
        parameterTotalCost.Direction = ParameterDirection.Output;
        objCmd.Parameters.Add(parameterTotalCost);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();

        // Total 값 반환
        if (parameterTotalCost.Value.ToString() != "")
        {
            return (int)parameterTotalCost.Value;
        }
        else
        {
            return 0;
        }
        #endregion
    }

	/// <summary>
	/// 장바구니 담고나서 로그인할 때 장바구니 테이블 업데이트
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="oldCartId">고유한 문자열/로그인하기 전에 받은 세션ID</param>
	/// <param name="newCartId">회원 아이디</param>
	public void MigrateCart(string oldCartId, string newCartId) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand objCmd = new SqlCommand("ShoppingCartMigrate", objCon);

        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter cart1 = new SqlParameter("@OriginalCartId ", SqlDbType.NVarChar, 50);
        cart1.Value = oldCartId;
        objCmd.Parameters.Add(cart1);

        SqlParameter cart2 = new SqlParameter("@NewCartId ", SqlDbType.NVarChar, 50);
        cart2.Value = newCartId;
        objCmd.Parameters.Add(cart2);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
    }

	/// <summary>
	/// 현재 접속자의 장바구니 전체 비우기
    /// ShoppingCart.aspx에서 사용
    /// </summary>
	/// <param name="cartID">현재 접속자</param>
	public void EmptyCart(string cartID) 
	{
        #region ADO.NET 클래스 사용
        SqlConnection objCon = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand objCmd = new SqlCommand("ShoppingCartEmpty", objCon);
        objCmd.CommandType = CommandType.StoredProcedure;

        SqlParameter cartid = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
        cartid.Value = cartID;
        objCmd.Parameters.Add(cartid);

        objCon.Open();
        objCmd.ExecuteNonQuery();
        objCon.Close();
        #endregion
    }
}
