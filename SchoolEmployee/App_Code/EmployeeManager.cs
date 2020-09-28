using System;
using SchoolWeb.App_Code;
using SchoolWeb.Model;
using System.Linq;

namespace SchoolWeb.App_Code
{
    public class EmployeeManager
    {
        public static void AddEmployee(Employee employee)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    db.Employee.Add(employee);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
        }
        public static Employee GetEmployeeById(Guid Id)
        {
            Employee employee = null;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    employee= db.Employee.Where(x=>x.ID== Id).FirstOrDefault();
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return employee;
        }

        internal static bool RestPassword(Guid guid)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {

                    Employee employee= db.Employee.Where(x=> guid.Equals(x.ID)).FirstOrDefault();
                    if (employee != null)
                    {
                        employee.Password = Helper.HashSHA256(employee.Username);
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

    }
}