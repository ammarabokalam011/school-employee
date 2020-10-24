using DevExpress.Web;
using DevExpress.Web.ASPxHtmlEditor;
using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolWeb
{
    public partial class MyInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] != null)
            {
                Guid studentId = Guid.Parse(Session["StudentId"].ToString());
                Student s = StudentManager.GetStudent(studentId);
                username.Value = s.Username;
                first_name.Value = s.Username;
                last_name.Value = s.LastName;
                birthdate.Value = s.BirthDate.ToString();
                father_name.Value = s.FatherName;
                mother_name.Value = s.MotherName;
                grade.Value = SubjectManager.GetGradeName( s.GradeId);
                if(s.ClassRoomId.HasValue)
                    classroom.Value = ClassRoomManager.GetClassRoomName(s.ClassRoomId.Value);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}