using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class StudentMaange
    {
        public static List<Student> GetStudents(Guid studentId)
        {
            List<Student> students = new List<Student>();
            using(SchoolDBEntities dBEntities =new SchoolDBEntities())
            {
                Student s=dBEntities.Student.First(x => x.ID == studentId);
                
                students =dBEntities.Student
                    .Where(x => x.Discount == "0%")
                    .OrderBy(x=> x.FirstName)
                    .ThenBy(x=> x.LastName)
                    .ToList();


                List<StudentExam> studentExams= dBEntities.StudentExam
                    .Where(x => x.StudentId == studentId)
                    .ToList();
                studentExams.ForEach(
                        x => {
                            dBEntities.Exam.Where(y => y.ID == x.ExamId)
                            .FirstOrDefault();
                        }
                    );

                var sts = from x in dBEntities.Student
                          where x.ID == studentId select x;

            }
            return null;
        }
    }
}