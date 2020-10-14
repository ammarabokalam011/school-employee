using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace SchoolWeb.App_Code
{
    public class Helper
    {
        public static string HashSHA256(String rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString().ToUpper();
            }
        }

        internal static Dictionary<int,string> GetDaysNames()
        {
            Dictionary<int, string> daysName = new Dictionary<int, string>();
            daysName.Add(0,"Saturday");
            daysName.Add(1,"Sunday");
            daysName.Add(2,"Monday");
            daysName.Add(3,"Tuesday");
            daysName.Add(4,"Wednesday");
            daysName.Add(5,"Thursday");
            daysName.Add(6,"Friday");
            return daysName;
        }
    }
}