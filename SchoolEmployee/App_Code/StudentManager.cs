using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class StudentManager
    {
        public static List<Student> GetStudents(Guid studentId)
        {
            List<Student> students = new List<Student>();
            using (SchoolDBEntities dBEntities = new SchoolDBEntities())
            {
                Student s = dBEntities.Student.First(x => x.ID == studentId);

                students = dBEntities.Student
                    .OrderBy(x => x.FirstName)
                    .ThenBy(x => x.LastName)
                    .ToList();


                List<StudentExam> studentExams = dBEntities.StudentExam
                    .Where(x => x.StudentId == studentId)
                    .ToList();
                studentExams.ForEach(
                        x =>
                        {
                            dBEntities.Exam.Where(y => y.ID == x.ExamId)
                            .FirstOrDefault();
                        }
                    );

                var sts = from x in dBEntities.Student
                          where x.ID == studentId
                          select x;

            }
            return null;
        }

        public static Student GetStudent(Guid studentId)
        {
            Student student = new Student();
            using (SchoolDBEntities dBEntities = new SchoolDBEntities())
            {
                try
                {
                    
                    student = dBEntities.Student.Where(x => x.ID == studentId).FirstOrDefault();
                }catch(Exception e)
                {

                }
            }
            return student;
        }

        internal static bool RestPassword(Guid guid)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {

                    Student student = db.Student.Where(x => guid.Equals(x.ID)).FirstOrDefault();
                    if (student != null)
                    {
                        student.Password = Helper.HashSHA256(student.Username);
                        db.SaveChanges();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
                return false;
            }
        }

        internal static bool Add(string firstName, string secondName, string fatherName, string motherName, string userName, int discount, DateTime birthdate, int? classroomd, int gradeId)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    Student student = new Student();
                    student.ID = Guid.NewGuid();
                    student.FirstName = firstName;
                    student.LastName = secondName;
                    student.FatherName = fatherName;
                    student.MotherName = motherName;
                    student.Username = userName;
                    student.BirthDate = birthdate;
                    student.Discount = discount;
                    student.ClassRoomId = classroomd;
                    student.GradeId = gradeId;
                    student.Password = Helper.HashSHA256(student.Username);
                    db.Student.Add(student);
                    db.SaveChanges();
                    return true;
                }
                catch (DbEntityValidationException e)
                {
                    String.Compare("", "");
                }
                return false;
            }
        }
    }
}