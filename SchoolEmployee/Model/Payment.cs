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
    
    public partial class Payment
    {
        public Payment()
        {
            this.PaymentStudent = new HashSet<PaymentStudent>();
        }
    
        public int ID { get; set; }
        public System.DateTime PayDate { get; set; }
        public int Amount { get; set; }
        public string Creditor { get; set; }
        public string Debtor { get; set; }
    
        public virtual ICollection<PaymentStudent> PaymentStudent { get; set; }
    }
}
