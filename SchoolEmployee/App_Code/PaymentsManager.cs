using Microsoft.EntityFrameworkCore;
using SchoolWeb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
namespace SchoolWeb.App_Code
{
    public class PaymentsManager
    {
        public static double GetTheRestOfTheFee(int id)
        {
            double result = 0;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                Payment payment= db.Payment.Where(x => id == x.ID).FirstOrDefault();
                result = payment.Fee.Amount-(payment.Fee.Amount * (payment.Student.Discount.GetValueOrDefault(0)/ 100.0));
                result -= db.Payment.AsEnumerable().Where(x =>  DateTime.Compare(x.PayDate , payment.PayDate) < 0 && x.FeeId ==payment.FeeId && x.StudentId==payment.StudentId)
                    .Select(x => x.Amount).DefaultIfEmpty(0).Sum();
                result -= payment.Amount;
                
            }
            return result;
        }

        internal static void AddPayment(Payment payment)
        {
            using (SchoolDBEntities db = new SchoolDBEntities()){
                try
                {
                    db.Payment.Add(payment);
                    db.SaveChanges();
                }catch(Exception e)
                {
                    e.ToString();
                }
            }
        }
    }
}