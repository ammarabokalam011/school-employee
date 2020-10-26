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
                Payment payment = db.Payment.Where(x => id == x.ID).FirstOrDefault();
                result = db.Payment.AsEnumerable().Where(x => DateTime.Compare(x.PayDate, payment.PayDate) < 0 && x.StudentId == payment.StudentId)
                    .Select(x => x.Amount).DefaultIfEmpty(0).Sum();
                result += payment.Amount;

            }
            return result;
        }
        public static int GetTheRestOfTheStudentPayment(Guid id)
        {
            int result = 0;
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                result = db.Payment.Where(x => id == x.StudentId).ToList().Select(x => x.Amount).DefaultIfEmpty(0).Sum();
                

            }
            return result;
        }

        internal static void AddRegisterPayment(int feeId, Guid studentId)
        {
            Payment payment = new Payment();
            payment.Creditor = "System";
            payment.Debtor = "Student Register";
            payment.FeeId = feeId;
            payment.PayDate = DateTime.Now;
            payment.StudentId = studentId;
            payment.Amount = GetFeeById(feeId)
                ;
            AddPayment(payment);
        }

        internal static int GetFeeById(int feeId)
        {
            using (SchoolDBEntities db = new SchoolDBEntities())
            {
                try
                {
                    return -1* db.Fee.Where(x => feeId == x.ID).FirstOrDefault().Amount;
                }
                catch (Exception e)
                {
                    e.ToString();
                }
            }
            return 0;
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