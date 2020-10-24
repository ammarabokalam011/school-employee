using DevExpress.Web;
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
    public partial class MySchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int classRoomId = -1;

            if (Session["StudentId"] != null)
            {
                Guid studentId = Guid.Parse(Session["StudentId"].ToString());
                Student s=StudentManager.GetStudent(studentId);
                if (s.ClassRoomId.HasValue)
                {
                    classRoomId = s.ClassRoomId.Value;
                    ClassRoomName.Text = "ClassRoom Name: " + ClassRoomManager.GetClassRoomName(classRoomId);

                    List<Schedule> schedules = ScheduleManager.GetSchedule(classRoomId);
                    Dictionary<int, Dictionary<int, Schedule>> schTable = schedules.ToList().GroupBy(x => x.Day)
                        .ToDictionary(x => x.Key,
                        x => x.ToList().GroupBy(y => y.PeriodId).ToDictionary(y => y.Key, y => y.FirstOrDefault())
                        );
                    Dictionary<int, string> daysName = Helper.GetDaysNames();
                    TableHeaderRow tableHeader = new TableHeaderRow();
                    tableHeader.Cells.Add(new TableCell() { Text = "Day/Time" });
                    List<Period> periods = PeriodManager.GetPeriods();
                    periods.ForEach(
                        x =>
                        {
                            tableHeader.Cells.Add(new TableCell() { Text = string.Format("{0}-{1}", x.StartTime, x.EndTime) });
                        }
                    );
                    Table1.Rows.Add(tableHeader);
                    foreach (KeyValuePair<int, string> entry in daysName)
                    {
                        TableRow row = new TableRow();
                        int dayId = entry.Key;
                        string dayName = entry.Value;
                        TableCell firstCell = new TableCell();
                        firstCell.Text = dayName;
                        row.Cells.Add(firstCell);
                        periods.ForEach(x => {
                            TableCell cell = new TableCell();
                            ASPxLabel textBoxSubject = new ASPxLabel();
                            ASPxLabel textBoxTeacher = new ASPxLabel();
                            if (schTable.ContainsKey(dayId))
                            {
                                if (schTable[dayId].ContainsKey(x.ID))
                                {
                                    if (schTable[dayId][x.ID] != null)
                                    {
                                        textBoxSubject.Text = SubjectManager.GetSubjectNames(schTable[dayId][x.ID].SubjectId);
                                        textBoxTeacher.Text = TeacherManager.GetTeacherName(schTable[dayId][x.ID].TeacherId);
                                    }

                                }
                            }
                            cell.Controls.Add(textBoxSubject);
                            cell.Controls.Add(new Literal() { Text = "<br/>" });
                            cell.Controls.Add(textBoxTeacher);
                            row.Cells.Add(cell);
                        });
                        Table1.Rows.Add(row);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('you must be in a classroom to get inside this page')", true);
                }
            }
            else {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('this page not avalible unless you logged in')", true);
                Response.Redirect("~/Home");
            }



        }
    }
}