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
    
    public partial class Employee
    {
        public Employee()
        {
            this.Permission = new HashSet<Permission>();
            this.EmployeeLog = new HashSet<EmployeeLog>();
        }
    
        public System.Guid ID { get; set; }
        public string FirstName { get; set; }
        public string LastNmae { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string Role { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    
        public virtual ICollection<Permission> Permission { get; set; }
        public virtual ICollection<EmployeeLog> EmployeeLog { get; set; }
    }
}
