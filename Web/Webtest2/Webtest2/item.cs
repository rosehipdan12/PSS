//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Webtest2
{
    using System;
    using System.Collections.Generic;
    
    public partial class item
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public item()
        {
            this.order_product = new HashSet<order_product>();
        }
    
        public int category_id { get; set; }
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<bool> status { get; set; }
        public Nullable<double> pricePerUnit { get; set; }
        public string tags { get; set; }
        public string image { get; set; }
        public string detail { get; set; }
        public Nullable<int> quantity { get; set; }
        public int supplier_id { get; set; }
    
        public virtual category category { get; set; }
        public virtual supplier supplier { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order_product> order_product { get; set; }
    }
}
