using System;
using SchoolWeb.Model;

namespace SchoolWeb.AdminPages
{
    internal class EmployeeManager
    {
        internal static void AddEmployee(Employee employee)
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