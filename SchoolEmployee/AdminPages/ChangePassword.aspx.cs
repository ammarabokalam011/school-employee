using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string oldPass = txtOldPassword.Text;
            string newPass = txtNewPassword.Text;
            Employee employee = AuthorizationManager.AuthorizeEmployee(User.Identity.Name, oldPass);
            if (employee != null)
            {
                AuthorizationManager.ChangePassword(User.Identity.Name, newPass);
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('succses')", true);
                FormsAuthentication.SignOut();
                HttpContext.Current.User = new GenericPrincipal(new GenericIdentity(string.Empty), null);
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('old password wrong')", true);
            }

        }
    }
}