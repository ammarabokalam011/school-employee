using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class TeacherManager
    {
        internal static string GetTeacherName(int? teacherId)
        {
            string name = "";
            if (!teacherId.HasValue)
                return name;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    Teacher teacher = db.Teacher.Where(x => x.ID == teacherId).FirstOrDefault();
                    name = teacher.FirstName+" " +teacher.LastName;
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return name;
        }

        internal static List<Teacher> GetTeachers()
        {
            List<Teacher> teachers = new List<Teacher>();
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    teachers = db.Teacher
                        .ToList();

                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return teachers;
        }
    }
}