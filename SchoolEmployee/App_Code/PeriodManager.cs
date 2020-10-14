using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class PeriodManager
    {
        public static List<Period> GetPeriods()
        {
            List<Period> periods = null;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    periods = db.Period
                        .ToList();

                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return periods;
        }
    }
}