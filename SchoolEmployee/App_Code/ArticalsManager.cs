using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class ArticalsManager
    {
        internal static List<Article> GetAll()
        {
            List<Article> articales = null;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    articales = db.Article
                        .ToList();

                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return articales;
        }
        internal static Article GetById(int id)
        {
           Article articale = null;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    articale = db.Article.Where(x=>x.ID==id).FirstOrDefault();

                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return articale;
        }
    }
}