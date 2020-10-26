using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class NewsManager
    {
        internal static List<News> GetAllNewsAsString()
        {
            List<News> news = new List<News>();
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    news = db.News.Where(x => (x.Visible.HasValue ? x.Visible.Value : true) && x.FinishedDate > DateTime.Today).ToList();
                }
                catch (Exception e)
                {

                }
            }
            return news;
        }
    }
}