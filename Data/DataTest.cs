using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using TestDev.Negocio;
using System.Collections.Generic;

namespace TestDev.Data
{
    public class DataTest
    {
        private string conec = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        
        public bool InsertThirdParties(ThirdParties ObThirdparties)
        {
            try
            {                
                SqlConnection sqlConec = new SqlConnection(conec);
                string sqll = @"INSERT INTO Thirdparties(FirstName , LastName, DocumentTypeID , DocumentNumber 
                           , CityIataCode , PhoneNumber , FaxNumber , Address , MobilePhoneNumber , Email 
                           , CountryID , VerificationDigit) VALUES(@FirstName, @LastName, @DocumentTypeID 
                           , @DocumentNumber, @CityIataCode, @PhoneNumber, @FaxNumber, @Address 
                           , @MobilePhoneNumber, @Email, @CountryID, @VerificationDigit)";
                SqlCommand cmd = new SqlCommand(sqll, sqlConec)
                {
                    CommandType = CommandType.Text
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = ObThirdparties.FirstName;
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = ObThirdparties.LastName;
                cmd.Parameters.Add("@DocumentTypeID", SqlDbType.Int).Value =  ObThirdparties.DocumentTypeID;
                cmd.Parameters.Add("@DocumentNumber", SqlDbType.VarChar, 50).Value = ObThirdparties.DocumentNumber;
                cmd.Parameters.Add("@CityIataCode", SqlDbType.VarChar, 50).Value = ObThirdparties.CityIataCode;
                cmd.Parameters.Add("@PhoneNumber", SqlDbType.VarChar, 50).Value = ObThirdparties.PhoneNumber; 
                cmd.Parameters.Add("@FaxNumber", SqlDbType.VarChar, 50).Value = ObThirdparties.FaxNumber; 
                cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50).Value = ObThirdparties.Address;
                cmd.Parameters.Add("@MobilePhoneNumber", SqlDbType.VarChar, 50).Value = ObThirdparties.MobilePhoneNumber;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = ObThirdparties.Email;
                cmd.Parameters.Add("@CountryID", SqlDbType.Int).Value = ObThirdparties.CountryID;
                cmd.Parameters.Add("@VerificationDigit", SqlDbType.Int).Value = ObThirdparties.CalculoDigitoVerif();
                cmd.ExecuteNonQuery();
                
                return true;
            }
            catch (SqlException e) 
            {
                throw new System.Exception();
            }            
        }

        public DataTable CargarDatosDoc()
        {
         
            using (SqlConnection con = new SqlConnection(conec))
            {
                string sql = "select ID, Name from IdentificationDocuments";
                SqlDataAdapter sd = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                sd.Fill(dt);

                return dt;
            }
        }
        public DataTable CargarDatosCity()
        {
         
            using (SqlConnection con = new SqlConnection(conec))
            {
                string sql = "select IATACode, Name	Name from Cities";
                SqlDataAdapter sd = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                sd.Fill(dt);

                return dt;
            }
        }
        public DataTable CargarDatosCountry()
        {            
            using (SqlConnection con = new SqlConnection(conec))
            {
                string sql = "select ID, Name from Countries";
                SqlDataAdapter sd = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                sd.Fill(dt);

                return dt;
            }
        }
    }
}