using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class ClassRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("ManageClassRoom"))
                Response.Redirect("~/AdminPages/");
        }

        protected void UpdateScheduleBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            int Id = int.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            Response.Redirect(string.Format("~/AdminPages/Schedules.aspx?ClassRoomId={0}&Edit=true", Id));
        }

        protected void ShowScheduleBtn_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)btn.NamingContainer;
            int Id = int.Parse(container.Grid.GetDataRow(container.VisibleIndex).ItemArray[0].ToString());
            Response.Redirect(string.Format("~/AdminPages/Schedules.aspx?ClassRoomId={0}&Edit=false", Id));
        }
    }
}