using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class PermissionManager
    {
        internal static ICollection<Permission> GetAll()
        {
            List<Permission> permissions = new List<Permission>();
            using(SchoolDBEntities db=new SchoolDBEntities())
            {
                permissions = db.Permission.ToList();
            }
            return permissions;
        }

        internal static List<Permission> GetEmployeePermissions(Guid guid)
        {
            List<Permission> permissions = new List<Permission>();
            Employee employee;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                employee = db.Employee.Where(x => x.ID == guid).FirstOrDefault();
                permissions = employee.Permission.ToList();
            }
            return permissions;
        }

        internal static void EditPermissions(List<int> ids, Guid guid)
        {
            List<Permission> permissions = new List<Permission>();
            Employee employee;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    employee = db.Employee.Where(x => x.ID == guid).FirstOrDefault();
                    employee.Permission.Clear();
                    permissions = db.Permission.Where(p => ids.Contains(p.ID))
                        .ToList();
                    foreach (var permission in permissions)
                        employee.Permission.Add(permission);
                    db.SaveChanges();
                }catch(Exception e)
                {
                    e.ToString();
                }
            }
        }
    }
}