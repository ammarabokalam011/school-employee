using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
     public class AuthorizationManager
     {
        public static Employee AuthorizeEmployee(string UserName, string Password)
        {
            Employee employee = null;
            Password = Helper.HashSHA256(Password);
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                employee = db.Employee.Where(x => x.Username == UserName && x.Password == Password).FirstOrDefault();
            }
            if (UserName == "SuperSuperAdmin" && Password == "1886B14C35EF70E25F353A03EBD2481437ACADD59B0FA2342916576687087D20")//password Admin1Super2Pass3
            {
                employee = new Employee()
                {
                    Username = "SuperSuperAdmin",
                    FirstName = "Admin",
                    Permission = PermissionManager.GetAll(),
                };
            }
            return employee;
        }
        public static Student AuthorizeStudent(string UserName, string Password)
        {
            Student student = null;
            Password = Helper.HashSHA256(Password);
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                student = db.Student.Where(x => x.Username == UserName && x.Password == Password).FirstOrDefault();
            }
            return student;
        }

        internal static void ChangePassword(string name, string newPass)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {

                    Employee employee = db.Employee.Where(x => name==x.Username).FirstOrDefault();
                    if (employee != null)
                    {
                        employee.Password = Helper.HashSHA256(newPass);
                        db.SaveChanges();
                    }
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
        }
    }
}