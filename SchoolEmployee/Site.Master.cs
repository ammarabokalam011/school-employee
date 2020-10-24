using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SchoolWeb
{
    public partial class SiteMaster : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] != null)
            {
                
                LinkButton link = new LinkButton();
                link.CssClass = "hover-btn-new log orange";
                link.PostBackUrl = "#"; 
                HtmlGenericControl span = new HtmlGenericControl("span");
                span.InnerText= "Log out from "  + StudentManager.GetStudent(Guid.Parse(Session["StudentId"].ToString())).Username ;
                link.Controls.Add( span);
                link.Click += new EventHandler((x,y)=> {
                    Session["StudentId"] =null;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                });
                loginUl.Controls.Add(link);
            }
            else
            {
                loginUl.InnerHtml = "<a class='hover-btn-new log orange' href='#' data-toggle='modal' data-target='#login'><span>Login</span> </a> ";
            }
        }
        
        protected void myBtn_Click(object sender, EventArgs e)
        {

            string pass = txtPassword.Value;
            string userName = txtUserName.Value;
            Student student = AuthorizationManager.AuthorizeStudent(userName, pass);
            if (student != null)
            {
                Session["StudentId"] = student.ID;
                Response.Redirect("Home.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('UserName or password wrong')", true);
            }
        }
        
    }
}