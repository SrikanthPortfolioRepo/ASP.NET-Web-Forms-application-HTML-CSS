using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sv1761
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblCustomer.Text = Session["Customer"].ToString();
            }
        }
    }
}