using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolWeb.App_Code;
using SchoolWeb.Model;

namespace SchoolWeb.AdminPages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Employee employee= AuthorizationManager.AuthorizeEmployee(UserName.Text, Password.Text);
            if (employee != null)
            {
                Response.Redirect("/AdminPages/Home.aspx");
            }
        }
    }
}