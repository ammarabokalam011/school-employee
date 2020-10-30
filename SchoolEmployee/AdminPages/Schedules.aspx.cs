using DevExpress.Web;
using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SchoolWeb.AdminPages
{
    public partial class Schedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!User.IsInRole("ManageClassRoom"))
                Response.Redirect("~/AdminPages/");
            bool edit=false;
            int classRoomId=-1;
            try
            {
                classRoomId= int.Parse(Request.QueryString["ClassRoomId"]);
                edit = bool.Parse(Request.QueryString["Edit"]);
                
            }
            catch (Exception ex)
            {
                Response.Redirect("~/AdminPages/home");
            }
            ClassRoomName.Text = "ClassRoom Name: "+ClassRoomManager.GetClassRoomName(classRoomId);
            Session["GradeId"] = ClassRoomManager.GetClassRoom(classRoomId).GradeID;
            List<Schedule> schedules= ScheduleManager.GetSchedule(classRoomId);
            Dictionary<int, Dictionary<int,  Schedule>> schTable = schedules.ToList().GroupBy(x => x.Day)
                .ToDictionary(x => x.Key,
                x => x.ToList().GroupBy(y => y.PeriodId).ToDictionary(y => y.Key, y => y.FirstOrDefault())
                );
            Dictionary<int,string> daysName = Helper.GetDaysNames();
            TableHeaderRow tableHeader = new TableHeaderRow();
            tableHeader.Cells.Add(new TableCell() { Text = "Day/Time" });
            List<Period> periods = PeriodManager.GetPeriods();
            periods.ForEach(
                x =>
                {
                    tableHeader.Cells.Add(new TableCell() { Text = string.Format("{0}-{1}",x.StartTime,x.EndTime)});
                }
            );
            Table1.Rows.Add(tableHeader);
            if (edit)
            {
                
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
                        ASPxComboBox comboBox = new ASPxComboBox();
                        ListBoxColumn column = new ListBoxColumn("TeacherId", "");
                        column.Visible = false;
                        comboBox.Columns.Add(new ListBoxColumn("TeacherName", "Teacher Name"));
                        comboBox.Columns.Add(new ListBoxColumn("SubjectName", "Subject Name"));
                        comboBox.Columns.Add(column);
                        comboBox.TextFormatString = "{0} {1}";
                        comboBox.ValueField = "SubjectId";
                        comboBox.ValueType = typeof(string);
                        comboBox.TextField = "SubjectName";
                        comboBox.DataSource = SqlDataSource1;
                        comboBox.DataBind();
                        comboBox.NullText = "empty";
                        comboBox.Items.Insert(0, new ListEditItem(" ", null));
                        comboBox.SelectedIndexChanged +=
                                 new EventHandler((s, k) => ASPxComboBox1_SelectedIndexChanged(s, k, x.ID,dayId));
                        comboBox.AutoPostBack = true;
                        comboBox.ClientEnabled = true;
                        comboBox.AllowNull = true;
                        if (schTable.ContainsKey(dayId))
                        {
                            if (schTable[dayId].ContainsKey(x.ID))
                            {
                                if (schTable[dayId][x.ID] != null) {
                                    ListEditItem item= comboBox.Items.Where(y => (y.Value != null ? (int.Parse(y.Value.ToString())) : -1) == schTable[dayId][x.ID].SubjectId).FirstOrDefault();
                                    if(item!=null)
                                        comboBox.SelectedIndex = item.Index;
                                    }
                                else
                                    comboBox.SelectedIndex = 0;
                            }
                        }
                        cell.Controls.Add(comboBox);
                        row.Cells.Add(cell);
                    });
                    Table1.Rows.Add(row);
                }
                
            }
            else
            {

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
                                    textBoxSubject.Text = SubjectManager.GetSubjectNames( schTable[dayId][x.ID].SubjectId);
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
        }

        protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e,int PeriodId,int DayId)
        {
            int ClassId = int.Parse(Request.QueryString["ClassRoomId"]);
            if ((sender as ASPxComboBox).Value != null)
            {
                int SubjectId = int.Parse((sender as ASPxComboBox).Value.ToString());
                Nullable<int> TeacherId = null;
                if (int.TryParse((sender as ASPxComboBox).SelectedItem.GetFieldValue("TeacherId").ToString(), out int t))
                {
                    TeacherId = t;
                }
                
                if (ScheduleManager.EditSchedule(PeriodId, DayId, SubjectId, TeacherId, ClassId))
                {

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('failed the teacher has other thing in the same time');" + "location.href = '" + Request.RawUrl + "';", true);
                }
            }
            else
            {
                ScheduleManager.RemoveSchedule(PeriodId, DayId, ClassId);
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert","location.href = '" + Request.RawUrl + "';", true);
            }

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("/AdminPages/ClassRooms.aspx");
        }
    }
}