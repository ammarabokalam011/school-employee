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
    
    public partial class Fee
    {
        public Fee()
        {
        }
    
        public int ID { get; set; }
        public int Amount { get; set; }
        public Nullable<System.DateTime> WarrningDate { get; set; }
        public Nullable<System.DateTime> LastDate { get; set; }
        public string Name { get; set; }

        public int GradeId { get; set; }
        public int Year { get; set; }

        public virtual Grade Grade { get; set; }


    }
}
