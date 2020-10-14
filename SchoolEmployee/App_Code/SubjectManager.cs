using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class SubjectManager
    {
        internal static string GetSubjectNames(int id){
            string name = "";
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    name= db.Subject.Where(x => x.ID == id).FirstOrDefault().Name;
                }
                catch (Exception e)
                {
                    String.Compare("", "");
                }
            }
            return name;
        }
    }
}