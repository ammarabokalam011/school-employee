using SchoolWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class ClassStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int classRoomId = int.Parse(Request.QueryString["ClassRoomId"]);
                txtClassRoomId.Value = classRoomId;
            }
            catch(Exception ex)
            {
                Response.Redirect("~/AdminPages/");
            }

        }

        protected void ASPxGridView1_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "AvarageMark")
            {
                Guid id = Guid.Parse(e.GetListSourceFieldValue("ID").ToString());
                e.Value = ExamManager.GetTheEvarageOfTheStudent(id);
            }
        }
    }
}