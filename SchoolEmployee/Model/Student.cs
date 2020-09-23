//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolWeb.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Student
    {
        public Student()
        {
            this.PaymentStudent = new HashSet<PaymentStudent>();
            this.StudentExam = new HashSet<StudentExam>();
        }
    
        public System.Guid ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MotherName { get; set; }
        public string FatherName { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string Discount { get; set; }
        public Nullable<int> ClassRoomId { get; set; }
        public Nullable<bool> BusRegister { get; set; }
        public int GradeId { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    
        public virtual ClassRoom ClassRoom { get; set; }
        public virtual Grade Grade { get; set; }
        public virtual ICollection<PaymentStudent> PaymentStudent { get; set; }
        public virtual ICollection<StudentExam> StudentExam { get; set; }
    }
}
