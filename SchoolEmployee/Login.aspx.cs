﻿using System;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = UserName.Text,password= Password.Text;
            Employee employee= AuthorizationManager.AuthorizeEmployee(username,password );
            if (employee != null)
            {
                FormsAuthenticationTicket tkt;
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, username, DateTime.Now,
                DateTime.Now.AddMinutes(30), RememberMeCheckBox.Checked, String.Join("|", employee.Permission.Select(x=> x.Name)));
                //commaSeperatedRoles AddStudnet,EditStudent,Addpayment
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                if (RememberMeCheckBox.Checked)
                    ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;
                Response.Cookies.Add(ck);
                Response.Redirect("/AdminPages/Home.aspx");
            }
        }
    }
}