//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PSS
{
    using System;
    using System.Collections.Generic;
    
    public partial class pet
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public pet()
        {
            this.order_product = new HashSet<order_product>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string gender { get; set; }
        public Nullable<System.DateTime> birth { get; set; }
        public Nullable<double> price { get; set; }
        public string color { get; set; }
        public string vaccine { get; set; }
        public string status { get; set; }
        public int species_id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order_product> order_product { get; set; }
        public virtual species species { get; set; }
    }
}
