//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolWeb.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class EmployeeLog
    {
        public int ID { get; set; }
        public System.Guid UserId { get; set; }
        public string EventName { get; set; }
        public string Details { get; set; }
        public System.DateTime EventDate { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}
