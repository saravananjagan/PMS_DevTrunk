//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PMS_WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using PMS_WebApp.Constants;
    
    public partial class ExaminationType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ExaminationType()
        {
            this.ExaminationSchedules = new HashSet<ExaminationSchedule>();
        }
        [Key]
        public System.Guid ExaminationTypeId { get; set; } = Guid.NewGuid();
        public string ExaminationType1 { get; set; }
        public System.TimeSpan duration { get; set; }
        public int totalmarks { get; set; }
        public System.Guid CustomerId { get; set; } = new Guid(CustomerConstants.CustomerId);
        public System.DateTime AddedOn { get; set; } = DateTime.Now;
        public System.Guid AddedBy { get; set; } = new Guid(CustomerConstants.AddedById);
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<System.Guid> UpdatedBy { get; set; }
        public bool Status { get; set; }
        public string displayDuration { get; set; }
        public virtual Customer Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExaminationSchedule> ExaminationSchedules { get; set; }
    }
}
