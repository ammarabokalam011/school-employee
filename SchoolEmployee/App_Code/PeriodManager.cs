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

        internal static string GetPeriodAsString(int periodId)
        {
            
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    Period period = db.Period.Where(x => x.ID == periodId).FirstOrDefault();
                    return period.StartTime+" - " +period.EndTime;

                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return "";
        }
    }
}