using System;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

public partial class jQuery_AutoComplete_AutoCompleteControl : System.Web.UI.UserControl
{
    public string ModelNameList { get; set; }
    protected void Page_Load(object sender, EventArgs e) {
        string data = "";
        using (IDataReader dr = (new DatabaseProviderFactory()).Create("ConnectionString")
            .ExecuteReader(CommandType.Text, 
                "Select Distinct ModelName From Products Order By ModelName Asc")) {
            while (dr.Read()) {
                data += dr.GetString(0) + " "; 
            }
            dr.Close();
        }
        this.ModelNameList =  data.Trim().Replace(" ", "|"); // "좋은컴퓨터|냉장고|좋은책"
    }
}