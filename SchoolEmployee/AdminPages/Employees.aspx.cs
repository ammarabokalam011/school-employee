using DevExpress.Web;
using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Web.UI;

namespace SchoolWeb.AdminPages
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("ManageEmployees"))
                Response.Redirect("~/AdminPages/");
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Employee employee = new Employee()
            {
                ID = Guid.NewGuid(),
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
            e.Cancel = true ;
            ASPxGridView1.CancelEdit();
            ASPxGridView1.DataBind();
        }

        protected void RestPasswordBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            Guid guid = Guid.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            if (EmployeeManager.RestPassword(guid))
            {
                ScriptManager.RegisterStartupScript(this,GetType(),"Alert","alert('Succses')",false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this,GetType(),"Alert","alert('Failed')", false);
            }
        }
    }
}