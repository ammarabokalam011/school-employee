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
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        }

        protected void AddStudnetBtn_Click(object sender, EventArgs e)
        {
            Session["StudentId"] = "";
            MultiView1.ActiveViewIndex = 1;
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Session["StudentId"] = "";
            MultiView1.ActiveViewIndex = 0;
        }
    }
}