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
    
    public partial class Period
    {
        public Period()
        {
            this.Schedule = new HashSet<Schedule>();
            this.Exam = new HashSet<Exam>();
        }
    
        public int ID { get; set; }
        public byte Day { get; set; }
        public System.TimeSpan StartTime { get; set; }
        public System.TimeSpan EndTime { get; set; }
    
        public virtual ICollection<Schedule> Schedule { get; set; }
        public virtual ICollection<Exam> Exam { get; set; }
    }
}