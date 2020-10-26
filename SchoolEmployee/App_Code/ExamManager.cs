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

    
    }
}