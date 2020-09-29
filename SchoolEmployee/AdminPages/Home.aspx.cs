using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EmployeeManage_Click(object sender, EventArgs e)
        {
            //TODO Check permisssion
            Response.Redirect("/AdminPages/Employees.aspx");
        }

        protected void FeeManagment_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdminPages/Fees.aspx");
        }

        protected void ManageSubject_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdminPages/Subjects.aspx");
        }
    }
}