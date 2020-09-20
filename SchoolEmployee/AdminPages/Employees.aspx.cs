using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Employee employee = new Employee()
            {
                FirstName = e.NewValues[0].ToString(),
                LastName = e.NewValues[1].ToString(),
                FatherName = e.NewValues[2].ToString(),
                MotherName =e.NewValues[3].ToString(),
                BirthDate= DateTime.Parse(e.NewValues[4].ToString()),
                Username = e.NewValues[6].ToString(),
                Password = Helper.HashSHA256(e.NewValues[6].ToString()),
                Role = e.NewValues[5].ToString(),
            };
            EmployeeManager.AddEmployee(employee);
        }

        protected void RestPasswordBtn_Click(object sender, EventArgs e)
        {
            string.Compare("", "");
        }
    }
}