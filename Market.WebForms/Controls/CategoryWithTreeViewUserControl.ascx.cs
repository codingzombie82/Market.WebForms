using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Market.WebForms.Controls
{
    public partial class CategoryWithTreeViewUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 무한대 카테고리를 TreeView 컨트롤에 설정하기
            DisplayCategory();
        }

        private void DisplayCategory()
        {
            // Step 1: 데이터가져오기: 추후 DB에서 가져오면 됨
            // Create the DataTable and columns
            DataTable dt = new DataTable("MarketCategory");
            dt.Columns.Add("CategoryId", typeof(int));
            dt.Columns.Add("CategoryName", typeof(String));
            dt.Columns.Add("SuperCategory", typeof(int));
            dt.Columns.Add("Align", typeof(int));

            // Add some test data
            dt.Rows.Add(new object[] { 0, "카테고리", -1, 0 }); // 최고 부모로 봄
            dt.Rows.Add(new object[] { 1, "컴퓨터", 0, 0 });
            dt.Rows.Add(new object[] { 2, "서적", 0, 1 });
            dt.Rows.Add(new object[] { 3, "강의", 0, 2 });
            dt.Rows.Add(new object[] { 4, "데스크톱", 1, 0 });
            dt.Rows.Add(new object[] { 5, "노트북", 1, 1 });
            dt.Rows.Add(new object[] { 6, "삼성", 5, 0 });
            dt.Rows.Add(new object[] { 7, "LG", 5, 1 });

            // Use the Select method to sort the rows by SuperCategory
            DataRow[] sortedCategories = dt.Select("", "CategoryId");

            // Step 2: XmlDocument 개체에 담기
            // Create an XmlDocument (with an XML declaration)
            XmlDocument doc = new XmlDocument();
            XmlDeclaration declare = doc.CreateXmlDeclaration("1.0", null, null);
            doc.AppendChild(declare);

            // iterate through the sorted data and build the XML document
            foreach (DataRow row in sortedCategories)
            {
                // Create an element node to insert
                // note: Element names may not have spaces so use ID
                // note: Element names may not start with a digit so add underscore
                XmlElement node = doc.CreateElement("_" + row["CategoryId"].ToString());
                node.SetAttribute("CategoryId", row["CategoryId"].ToString());
                node.SetAttribute("CategoryName", row["CategoryName"].ToString());
                node.SetAttribute("SuperCategory", row["SuperCategory"].ToString());
                node.SetAttribute("Align", row["Align"].ToString());

                // special case for top level node
                if ((int)row["SuperCategory"] == -1)
                {
                    doc.AppendChild(node); // root node
                }
                else
                {
                    // use XPath to find the parent node in the tree
                    string searchString = String.Format("//*[@CategoryId=\"{0}\"] ", row["SuperCategory"].ToString());
                    XmlNode parent = doc.SelectSingleNode(searchString);

                    if (parent != null)
                    {
                        parent.AppendChild(node);
                    }
                    else
                    {
                        ; // Handle Error: Category with no boss
                    }
                }
            }


            // Step 3: 트리뷰에 추가하기
            // we cannot bind the TreeView directly to an XmlDocument
            // so we must create an XmlDataSource and assign the XML text
            XmlDataSource xmlDataSource = new XmlDataSource();
            xmlDataSource.ID = DateTime.Now.Ticks.ToString(); // unique ID is required
            xmlDataSource.Data = doc.OuterXml;

            // we want the full name displayed in the tree so
            // do custom databindings
            TreeNodeBinding binding = new TreeNodeBinding();
            binding.TextField = "CategoryName";
            binding.ValueField = "CategoryId";
            ctlCategoryListWithTreeView.DataBindings.Add(binding);

            // Finally! Hook that bad boy up!
            ctlCategoryListWithTreeView.DataSource = xmlDataSource;
            ctlCategoryListWithTreeView.DataBind();
        }
    }
}