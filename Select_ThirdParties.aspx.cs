using System;
using System.Data;
using TestDev.Data;

namespace TestDev
{
    public partial class Select_ThirdParties : System.Web.UI.Page
    {
        DataTest Data = new DataTest();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { DisplayCombo(); }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            if (DropDocument.SelectedItem.Value != "" && DropCountry.SelectedItem.Value != "")
            {                
                consulta();
            }
         }

        public void consulta()
        {
            string ssql = @"SELECT  A.ID, FirstName  ,LastName  ,B.Name Doc ,DocumentNumber  ,C.Name Ciudad ,PhoneNumber
                            ,FaxNumber  ,Address  ,MobilePhoneNumber  ,Email  ,D.Name Country ,VerificationDigit 
                             FROM Thirdparties A
                             INNER JOIN IdentificationDocuments B ON A.DocumentTypeID = B.ID
                             INNER JOIN Countries D ON A.CountryID = D.ID
                             INNER JOIN Cities C ON A.CityIataCode = C.IATACode AND C.CountryIATACode = D.IATACode
                             WHERE A.DocumentTypeID = " + DropDocument.SelectedItem.Value  + " AND A.CountryID=" + DropCountry.SelectedItem.Value;
            SqlDataSource1.SelectCommand = ssql;
            

        }
        public void DisplayCombo()
        {
            DataTable rtDoc = Data.CargarDatosDoc();

            DropDocument.DataSource = rtDoc;
            DropDocument.DataTextField = "Name";
            DropDocument.DataValueField = "ID";
            DropDocument.DataBind();

            DropDocument.DataBind();

            DataTable rtCountry = Data.CargarDatosCountry();

            DropCountry.DataSource = rtCountry;
            DropCountry.DataTextField = "Name";
            DropCountry.DataValueField = "ID";
            DropCountry.DataBind();

            DropCountry.DataBind();
        }
    }
}