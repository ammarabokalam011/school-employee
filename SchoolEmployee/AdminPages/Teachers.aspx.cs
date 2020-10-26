using DevExpress.Web;
using SchoolWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Teachers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("ManageTeacher"))
                Response.Redirect("~/AdminPages/");


        }
        protected void EditSubjectBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            int id = int.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            txtTeacherId.Text= id.ToString();
            GridLookup.DataBind();
            MultiView1.ActiveViewIndex = 1;
            GridLookup.Value= SubjectManager.GetTeacherSubjectsIds(id);
        }

        protected void ASPxButtonBack_Click(object sender, EventArgs e)
        {
            txtTeacherId.Text = "";
            ASPxGridView1.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void GridLookup_ValueChanged(object sender, EventArgs e)
        {
            int[] ids =((sender as DevExpress.Web.ASPxGridLookup).GridView.GetSelectedFieldValues("SubjectId")).Select(Convert.ToInt32).ToArray();
            SubjectManager.EditTeacherSubject(ids,int.Parse(txtTeacherId.Text));
        }
    }
}