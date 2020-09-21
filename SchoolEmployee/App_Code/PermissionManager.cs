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
    }
}