using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Market.WebForms.Admin
{
    public partial class ZipCodeAddFromFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddToZipTable_Click(object sender, EventArgs e)
        {
            StreamReader sr = new StreamReader(Server.MapPath("../Documents/") + "\\zipcode_20090929.csv", Encoding.Default);

            while (!sr.EndOfStream) // 파일의 끝에 도달할 때까지
            {
                // 콤마로 구분해서 한줄씩 읽어오기
                string[] arr = sr.ReadLine().Split(',');
                // Zip 테이블의 각각의 필드에 저장

                Database db = (new DatabaseProviderFactory()).Create("ConnectionString");
                db.ExecuteNonQuery(CommandType.Text, String.Format("Insert Zip Values(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}')", arr[0], arr[1], arr[2], arr[3], arr[4]));
            }

            sr.Close();
        }
    }
}