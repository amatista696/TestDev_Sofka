using System;
using TestDev.Negocio;
using TestDev.Data;
using System.Data;
using System.Web.UI;

namespace TestDev
{
    public partial class Insert_ThirdParties : System.Web.UI.Page
    {
        DataTest Data = new DataTest();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){ DisplayCombo(); }            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            var Third = new ThirdParties
            {
                ID = 0,
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                DocumentTypeID = int.Parse( DropDocument.SelectedItem.Value),
                DocumentNumber = txtDocumentNumber.Text,
                CityIataCode = DropCity.SelectedItem.Value,
                PhoneNumber = txtPhoneNumber.Text,
                FaxNumber = txtFaxNumber.Text,
                Address = txtAddress.Text,
                MobilePhoneNumber = txtMobilePhoneNumber.Text,
                Email = txtEmail.Text,
                CountryID = int.Parse(DropCountry.SelectedItem.Value )
            };

            
            Data.InsertThirdParties(Third);
            
            Response.Redirect("Index.aspx");
        }

        public void DisplayCombo() 
        {
            DataTable rtDoc = Data.CargarDatosDoc();

            DropDocument.DataSource = rtDoc;
            DropDocument.DataTextField = "Name";
            DropDocument.DataValueField = "ID";
            DropDocument.DataBind();

            DropDocument.DataBind();
            
            DataTable rtCity = Data.CargarDatosCity();

            DropCity.DataSource = rtCity;
            DropCity.DataTextField = "Name";
            DropCity.DataValueField = "IATACode";
            DropCity.DataBind();

            DropCity.DataBind();

            DataTable rtCountry = Data.CargarDatosCountry();

            DropCountry.DataSource = rtCountry;
            DropCountry.DataTextField = "Name";
            DropCountry.DataValueField = "ID";
            DropCountry.DataBind();

            DropCountry.DataBind();
        }
    }

}