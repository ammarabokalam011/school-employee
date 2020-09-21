using System;
using SchoolWeb.Model;

namespace SchoolWeb.AdminPages
{
    public class EmployeeManager
    {
        public static void AddEmployee(Employee employee)
        {
            using(SchoolDBEntities db= new SchoolDBEntities())
            {
                try{
                    db.Employee.Add(employee);
                    db.SaveChanges();
                }catch(Exception e)
                {
                    String.Compare("","");
                }
            }
        }
    }
}