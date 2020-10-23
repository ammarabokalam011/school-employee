using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SchoolWeb.App_Code;
using SchoolWeb.Model;

namespace SchoolWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void Button1_Click1(object sender, EventArgs e)
        {
            
        }

        protected void myBtn_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Value, password = txtPassword.Value;
            Employee employee = AuthorizationManager.AuthorizeEmployee(username, password);
            if (employee != null)
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, username, DateTime.Now,
                DateTime.Now.AddHours(2), false,
                String.Join("|", employee.Username == "SuperSuperAdmin" ? PermissionManager.GetAll().Select(x => x.Name) : PermissionManager.GetEmployeePermissions(employee.ID).Select(x => x.Name)));
                //commaSeperatedRoles AddStudnet,EditStudent,Addpayment
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                
                    ;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                }
                else
                {
                    Response.Redirect("/AdminPages/Home.aspx");
                }
            }
        }
    }
}