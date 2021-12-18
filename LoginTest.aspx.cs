using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using TestDev.Negocio;
using System.Windows;
using System.Web.UI;

namespace TestDev
{
    public partial class LoginTest : System.Web.UI.Page
    {
        Session Validation = new Session();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnbtnLogin_Click(object sender, EventArgs e)
        {
            if (txtuser.Text != "" && txtPass.Text != "")
            {
                Validation.IdUser = txtuser.Text;
                Validation.Password = txtPass.Text;
                if (Validation.ValidationUser())
                {
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    lblError.Text = "¡Usuario o contraseña inválido!";
                }
            }
            else
            {
                lblError.Text = "¡Ingrese un usuario y contraseña!";                
            }                
        }
    }
}