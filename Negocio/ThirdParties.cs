using System;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace TestDev.Negocio
{ 
    public class ThirdParties
    {
        public int ID { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public int DocumentTypeID { set; get; }
        public string DocumentType { set; get; } //Descrip tipo doc
        public string DocumentNumber { set; get; }
        public string CityIataCode { set; get; }
        public string CityIata { set; get; } //Descrip Ciudad
        public string PhoneNumber { set; get; }
        public string FaxNumber { set; get; }
        public string Address { set; get; }
        public string MobilePhoneNumber { set; get; }
        public string Email { set; get; }
        public int CountryID { set; get; }
        public string Country { set; get; } //Descrip Pais
        public int VerificationDigit { set; get; }

        public int CalculoDigitoVerif()
        {
            int Cedula = int.Parse(ConfigurationManager.AppSettings["Cedula"].ToString());
            int NIT = int.Parse(ConfigurationManager.AppSettings["NIT"].ToString());

            if (this.DocumentTypeID == Cedula)
            {                
                int num1 = int.Parse(DocumentNumber.Remove(4));
                int num2 = int.Parse(DocumentNumber.Substring(DocumentNumber.Length - 2));
                int dig = (num1 + num2) % 10;
                DocumentTypeID = dig;
            }
            else if ( this.DocumentTypeID == NIT)
            {
                int n = int.Parse(this.DocumentNumber);
                int suma = 0;
                while (n != 0)
                {
                    suma += n % 10;
                    n /= 10;
                }
                DocumentTypeID = (suma / 2) %10;
            }
            else
            {
                this.DocumentTypeID = 0;
            }
            return DocumentTypeID;
    }
    }
}