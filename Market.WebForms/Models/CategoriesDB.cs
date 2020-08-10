using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data; // 

/// <summary>
/// 카테고리 관리 클래스
/// </summary>
public class CategoriesDB
{
    /// <summary>
    /// 카테고리 추가 : CategoryAdd.ascx에서 사용 
    /// </summary>
    /// <param name="categoryName">분류명</param>
    public void AddCategory(string categoryName)
    {
        (new DatabaseProviderFactory()).Create(
            "ConnectionString").ExecuteNonQuery(
                CommandType.Text,
                    "Insert Into Categories(CategoryName) "
                        + " Values('" + categoryName + "')");
    }

    /// <summary>
    ///  카테고리 반환 : CategoryList.ascx에서 사용
    /// </summary>
    /// <returns>전체 카테고리 리스트(내림차순)</returns>
    public DataSet GetCategories()
    {
        return (new DatabaseProviderFactory()).Create(
            "ConnectionString").ExecuteDataSet(
                CommandType.Text,
                "Select CategoryID, CategoryName From Categories "
                    + " Order By CategoryID Desc");
    }
}
