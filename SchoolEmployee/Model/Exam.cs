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
    
    public partial class Exam
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Exam()
        {
            this.StudentExam = new HashSet<StudentExam>();
        }
    
        public int ID { get; set; }
        public int Mark { get; set; }
        public System.DateTime PublishDate { get; set; }
        public int SubjectId { get; set; }
        public int ClassRoomId { get; set; }
        public string Name { get; set; }
        public Nullable<int> PeriodId { get; set; }
        public int Year { get; set; }
    
        public virtual ClassRoom ClassRoom { get; set; }
        public virtual Period Period { get; set; }
        public virtual Subject Subject { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentExam> StudentExam { get; set; }
    }
}
