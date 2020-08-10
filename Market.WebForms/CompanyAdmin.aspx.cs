using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Market.WebForms
{
    public partial class CompanyAdmin : System.Web.UI.Page
    {
        protected void btnSaveXml_Click(object sender, EventArgs e)
        {
            // 파일이 있는지 없는지 검사하여 없다면 생성
            if (!File.Exists(Server.MapPath("Company.xml")))
            {
                XmlDocument objXmlDocument = new XmlDocument();
                XmlNode Market = objXmlDocument.CreateElement(String.Empty, "Company", String.Empty);

                objXmlDocument.AppendChild(objXmlDocument.CreateXmlDeclaration("1.0", "utf-8", "yes"));
                objXmlDocument.AppendChild(Market);
                objXmlDocument.Save(Server.MapPath("Company.xml"));
            }

            XmlDocument doc = new XmlDocument();
            doc.AppendChild(doc.CreateXmlDeclaration("1.0", "utf-8", "yes"));

            XmlNode company = doc.CreateElement(String.Empty, "Company", String.Empty);

            XmlNode companyName = doc.CreateElement(String.Empty, "CompanyName", String.Empty);
            companyName.InnerXml = this.TextBox1.Text;
            company.AppendChild(companyName);

            XmlNode companyNumber = doc.CreateElement(String.Empty, "CompanyNumber", String.Empty);
            companyNumber.InnerXml = this.TextBox2.Text;
            company.AppendChild(companyNumber);

            XmlNode companyAddress = doc.CreateElement(String.Empty, "CompanyAddress", String.Empty);
            companyAddress.InnerXml = this.TextBox3.Text;
            company.AppendChild(companyAddress);

            XmlNode companyAddressDetail = doc.CreateElement(String.Empty, "CompanyAddressDetail", string.Empty);
            companyAddressDetail.InnerXml = this.TextBox4.Text;
            company.AppendChild(companyAddressDetail);

            XmlNode name = doc.CreateElement(String.Empty, "Name", String.Empty);
            name.InnerXml = this.TextBox5.Text;
            company.AppendChild(name);

            XmlNode companyType = doc.CreateElement(String.Empty, "CompanyType", String.Empty);
            companyType.InnerXml = this.TextBox6.Text;
            company.AppendChild(companyType);

            XmlNode companyStyle = doc.CreateElement(String.Empty, "CompanyStyle", String.Empty);
            companyStyle.InnerXml = this.TextBox7.Text;
            company.AppendChild(companyStyle);

            XmlNode varOperator = doc.CreateElement(String.Empty, "Operator", String.Empty);
            varOperator.InnerXml = this.TextBox8.Text;
            company.AppendChild(varOperator);

            XmlNode phone = doc.CreateElement(String.Empty, "Phone", String.Empty);
            phone.InnerXml = this.TextBox9.Text;
            company.AppendChild(phone);

            XmlNode fax = doc.CreateElement(String.Empty, "Fax", String.Empty);
            fax.InnerXml = this.TextBox10.Text;
            company.AppendChild(fax);

            XmlNode email = doc.CreateElement(String.Empty, "Email", String.Empty);
            email.InnerXml = this.TextBox11.Text;
            company.AppendChild(email);

            doc.AppendChild(company);

            doc.Save(Server.MapPath("Company.xml"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (File.Exists(Server.MapPath("Company.xml")))
                {
                    XmlDocument objXmlDocumentReader = new XmlDocument();
                    objXmlDocumentReader.Load(Server.MapPath("Company.xml"));

                    if (objXmlDocumentReader.ChildNodes.Count > 0)
                    {
                        XmlNodeList companyList = objXmlDocumentReader.SelectSingleNode("Company").ChildNodes;

                        this.TextBox1.Text = companyList[0].InnerXml;
                        this.TextBox2.Text = companyList[1].InnerXml;
                        this.TextBox3.Text = companyList[2].InnerXml;
                        this.TextBox4.Text = companyList[3].InnerXml;
                        this.TextBox5.Text = companyList[4].InnerXml;
                        this.TextBox6.Text = companyList[5].InnerXml;
                        this.TextBox7.Text = companyList[6].InnerXml;
                        this.TextBox8.Text = companyList[7].InnerXml;
                        this.TextBox9.Text = companyList[8].InnerXml;
                        this.TextBox10.Text = companyList[9].InnerXml;
                        this.TextBox11.Text = companyList[10].InnerXml;
                    }
                }
            }
        }
    }
}