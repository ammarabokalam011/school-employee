using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class ScheduleManager
    {
        public static List<Schedule> GetSchedule(int classRoomId)
        {
            List<Schedule> schedules=null;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    schedules= db.Schedule.Where(x=> x.ClassRoomId==classRoomId)
                        .ToList();
                    
                }catch(Exception e)
                {
                    e.ToString();
                }
            }
            return schedules;
        }

        internal static void EditSchedule(int periodId, int dayId, int subjectId, int? teacherId, int classId)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    Schedule schedule = db.Schedule
                        .Where(x => x.ClassRoomId == classId && dayId == x.Day && periodId == x.PeriodId)
                        .FirstOrDefault();
                    if (schedule != null)
                    {
                        db.Schedule.Remove(schedule);
                    }

                    Schedule s = new Schedule();
                    s.SubjectId = subjectId;
                    if (teacherId.HasValue)
                        s.TeacherId = teacherId;
                    s.ClassRoomId = classId;
                    s.PeriodId = periodId;
                    s.Day = dayId;
                    db.Schedule.Add(s);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
        }
    }
}