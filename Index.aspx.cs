using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestDev
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("Insert_ThirdParties.aspx");
        }
        protected void BtnSelect_Click(object sender, EventArgs e)
        {
            Response.Redirect("Select_ThirdParties.aspx");
        }
        protected void BtnJson_Click(object sender, EventArgs e)
        {
            Response.Redirect("DataJson.aspx");
        }
    }
}