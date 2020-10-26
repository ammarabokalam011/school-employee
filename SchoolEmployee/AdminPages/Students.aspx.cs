using DevExpress.Web;
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
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("ManageStudent"))
                Response.Redirect("~/AdminPages/");

        }
        protected void RestPasswordBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            Guid guid = Guid.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            if (StudentManager.RestPassword(guid))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Succses')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Failed')", true);
            }
        }

        protected void EditStudentBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            Guid guid = Guid.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            Session["StudentId"] = guid;
            MultiView1.ActiveViewIndex = 1;
            ASPxFormLayout1.DataSourceID = "SqlDataSource3";
        }

        protected void AddStudnetBtn_Click(object sender, EventArgs e)
        {
            Session["StudentId"] = "";
            MultiView1.ActiveViewIndex = 1;
        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string secondName = txtSecondName.Text;
            string fatherName = txtFatherName.Text;
            string motherName = txtMotherName.Text;
            string userName = txtUsername.Text;
            int discount = int.Parse(txtDiscount.Text);
            DateTime birthdate = datetxtBirthDate.Date;
            int? classroomd = (int?)txtClassRoomId.Value;
            int gradeId = (int)txtGradeId.Value;
            if (Session["StudentId"] != null)
            {
                
                    Guid Id = Guid.Parse(Session["StudentId"].ToString());
                    if (StudentManager.Edit(Id,firstName, secondName, fatherName, motherName, userName, discount, birthdate, classroomd, gradeId))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Succses')", true);
                        Response.Redirect("/AdminPages/Students");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Failed')", true);
                    }
                
            }
            else
            {
                if (StudentManager.Add(firstName, secondName, fatherName, motherName, userName, discount, birthdate, classroomd, gradeId))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Succses')", true);
                    Response.Redirect("/AdminPages/Students");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Failed')", true);
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Session["StudentId"] = "";
            MultiView1.ActiveViewIndex = 0;
        }
        
        protected void txtGradeId_ValueChanged(object sender, EventArgs e)
        {
            txtClassRoomId.DataBind();
        }
    }
}