using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class ShoppingCartDB
{
    /// <summary>
    /// ���� �����ڿ��� ������ Ű���� ��ȯ
    /// AddToCart.aspx���� ���
    /// </summary>
    /// <returns>������ ���ڿ�(������(CustomerID/UserID), ������(GUID))</returns>
	public string GetShoppingCartId() 
	{
		// HttpContext ��ü ����
		System.Web.HttpContext context = System.Web.HttpContext.Current;

		// ������ ����� : ȸ��
		if (!String.IsNullOrEmpty(context.User.Identity.Name)) 
		{
			return context.User.Identity.Name; // ������ ����ڸ��� �Է�
		}

		// �������� ���� �����������, ��Ű���� �ִٸ�,
		if (context.Request.Cookies["Shopping_CartID"] != null) 
		{
			return context.Request.Cookies["Shopping_CartID"].Value;
		}
		else 
		{
            // ��ȸ���� ������ ������ ���ڿ��� �޴´�.
			// ������ GUID �� ����
			Guid tempCartId = Guid.NewGuid(); // ������ ���ڿ��� �����ϴ� �ڵ�

			// ��Ű�� tempCartId �� ����
			context.Response.Cookies["Shopping_CartID"].Value = tempCartId.ToString();

			// tempCartId ��ȯ
			return tempCartId.ToString();
		}
	}

    /// <summary>
    /// ��ٱ��� ���
    /// AddToCart.aspx���� ���
    /// </summary>
    /// <param name="cartID">����</param>
    /// <param name="productID">� ��ǰ</param>
    /// <param name="quantity">����</param>
	public void AddItem(string cartID, int productID, int quantity) 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ���� �������� ��ٱ��Ͽ� ����ִ� ��ǰ ����
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="cartID">����������(ȸ��/��ȸ��)</param>
	/// <returns>��ǰ ����</returns>
	public int GetItemCount(string cartID) 
	{
        #region ADO.NET Ŭ���� ���
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

        // �׸� �� ��ȯ
        return ((int)parameterItemCount.Value);
        #endregion
    }

	/// <summary>
	/// ���� �������� ��ٱ��� ����Ʈ
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="cartID">����������</param>
	/// <returns>�����͸��� ��ü</returns>
	public SqlDataReader GetItems(string cartID) 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ��ٱ��� ����
    /// ShoppingCart.aspx���� ���	
    /// </summary>
	/// <param name="cartID">����������</param>
	/// <param name="productID">�����ǰ</param>
	/// <param name="quantity">����</param>
	public void UpdateItem(string cartID, int productID, int quantity) 
	{
		if (quantity < 0) 
		{
			throw new Exception("������ 0�̻��̾�� �մϴ�.");
		}

        #region ADO.NET Ŭ���� ���
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
	/// ������ ��ǰ �����
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="cartID">���� ������/īƮ������ȣ</param>
	/// <param name="productID">��ǰ��ȣ</param>
	public void RemoveItem(string cartID, int productID) 
	{
        #region [1] ADO.NET Ŭ���� ��� ����
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
	/// ���� ��ٱ����� �� �ݾ�
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="cartID">����������</param>
	/// <returns>��ٱ��Ͽ� ��� ��ǰ�� ���� �� �հ�</returns>
	public int GetTotal(string cartID) 
	{
        #region ADO.NET Ŭ���� ���
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

        // Total �� ��ȯ
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
	/// ��ٱ��� ����� �α����� �� ��ٱ��� ���̺� ������Ʈ
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="oldCartId">������ ���ڿ�/�α����ϱ� ���� ���� ����ID</param>
	/// <param name="newCartId">ȸ�� ���̵�</param>
	public void MigrateCart(string oldCartId, string newCartId) 
	{
        #region ADO.NET Ŭ���� ���
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
	/// ���� �������� ��ٱ��� ��ü ����
    /// ShoppingCart.aspx���� ���
    /// </summary>
	/// <param name="cartID">���� ������</param>
	public void EmptyCart(string cartID) 
	{
        #region ADO.NET Ŭ���� ���
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
