using System;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace TestDev.Negocio
{
    public class Session
    {
        public String IdUser { set; get; }
        public String Password { set; get; }

        public bool ValidationUser()
        {            
            string passEncrypt = Session.GetSHA256(Password);
            string UserValid = ConfigurationManager.AppSettings["IdUser"];
            string PassValid = ConfigurationManager.AppSettings["Pass"];

            bool Valid = passEncrypt == PassValid && IdUser.ToLower() == UserValid ?  true : false;
            return Valid;
        }

        public static string GetSHA256(string str)
        {
            SHA256 sha256 = SHA256Managed.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = sha256.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
    }
}