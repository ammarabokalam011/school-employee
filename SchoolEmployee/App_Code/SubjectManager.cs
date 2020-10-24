using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class SubjectManager
    {
        internal static string GetSubjectNames(int id){
            string name = "";
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    name= db.Subject.Where(x => x.ID == id).FirstOrDefault().Name;
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return name;
        }

        internal static void EditTeacherSubject(int[] ids,int teacherId)
        {
            List<Subject> subjects = new List<Subject>();
            Teacher teacher;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    teacher = db.Teacher.Where(x => x.ID==teacherId).FirstOrDefault();
                    teacher.Subject.Clear();
                    subjects = db.Subject.Where(p => ids.Contains(p.ID))
                        .ToList();
                    foreach (var subject in subjects)
                        teacher.Subject.Add(subject);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
        }

        internal static string GetGradeName(int gradeId)
        {
            string s = "";
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                return db.Grade.Where(x => gradeId == x.ID).FirstOrDefault().Name;
            }
            return s;
        }

            internal static List<int> GetTeacherSubjectsIds(int id)
        {
            List<Subject> subjects = new List<Subject>();
            Teacher teacher;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    teacher = db.Teacher.Where(x => x.ID == id).FirstOrDefault();
                    subjects = teacher.Subject.ToList();
                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return subjects.Select(x=>x.ID).ToList();
        }
    }
}