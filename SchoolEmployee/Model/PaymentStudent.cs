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
    
    public partial class PaymentStudent
    {
        public int PaymentID { get; set; }
        public System.Guid StudentID { get; set; }
        public int Amount { get; set; }
    
        public virtual Payment Payment { get; set; }
        public virtual Student Student { get; set; }
    }
}
