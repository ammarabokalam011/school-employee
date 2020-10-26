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
    public partial class MyExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] != null)
            {
                Guid studentId = Guid.Parse(Session["StudentId"].ToString());
                Student s = StudentManager.GetStudent(studentId);
                ExamManager.GetExams(s.GradeId).ForEach(x =>
                {
                    TableRow row = new TableRow();
                    TableCell namecell = new TableCell();
                    namecell.Text = x.Name;
                    row.Cells.Add(namecell);
                    TableCell datecell = new TableCell();
                    datecell.Text = x.PublishDate.ToString();
                    row.Cells.Add(datecell);
                    if (x.PeriodId.HasValue)
                    {
                        TableCell periodcell = new TableCell();
                        periodcell.Text = PeriodManager.GetPeriodAsString(x.PeriodId.Value);
                        row.Cells.Add(periodcell);
                    }
                    TableCell subjectcell = new TableCell();
                    subjectcell.Text = SubjectManager.GetSubjectNames( x.SubjectId);
                    row.Cells.Add(subjectcell);
                    TableCell classcell = new TableCell();
                    classcell.Text = ClassRoomManager.GetClassRoomName(x.ClassRoomId);
                    row.Cells.Add(classcell);
                    TableCell markcell = new TableCell();
                    markcell.Text = StudentManager.GetStudentMark(studentId,x.ID)+"/"+x.Mark;
                    row.Cells.Add(markcell);
                    examTable.Rows.Add(row);
                });
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}