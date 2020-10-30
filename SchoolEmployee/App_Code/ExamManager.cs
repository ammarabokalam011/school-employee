using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class ExamManager
    {
        public static List<Exam> GetExams(int gradeId)
        {
            List<Exam> exams = new List<Exam>();
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    exams =db.Exam.Where(x => gradeId == x.Subject.GradeId && x.Year==DateTime.Now.Year).OrderBy(x=>x.PublishDate).ToList();
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return exams;
        }

        internal static object GetTheEvarageOfTheStudent(Guid id)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    Student student = db.Student.Where(x => id == x.ID).First();
                      return student.StudentExam.Where(x=> x.Exam.Year==2020 ).Select(x=> (double)(x.Mark) / (double)x.Exam.Mark).Average() *100;
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return 0;
        }
    }
}