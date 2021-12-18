using Newtonsoft.Json;
using System;
using TestDev.Controllers;

namespace TestDev
{
    public partial class DataJson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnJson_Click(object sender, EventArgs e)
        {
            string json = @"{'id': '50082546','Nombre': 'Pruebas','Apellido': '.NET','identificacion': '8888881','tipo': '1','validar': 'true',}";

            ObJson ObjPrueba = JsonConvert.DeserializeObject<ObJson>(json);

            lblJson.Text = string.Format("Apellido y  nombre: {0} {1}", ObjPrueba.Nombre, ObjPrueba.Apellido);
        }
    }
}