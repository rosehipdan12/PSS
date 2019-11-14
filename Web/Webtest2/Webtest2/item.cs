namespace Webtest2
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class item
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public item()
        {
            order_product = new HashSet<order_product>();
        }

        public int category_id { get; set; }

        public int id { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        public bool? status { get; set; }

        public double? pricePerUnit { get; set; }

        [StringLength(50)]
        public string tags { get; set; }

        [Column(TypeName = "text")]
        public string detail { get; set; }

        public int? quantity { get; set; }

        public int supplier_id { get; set; }

        public byte[] image { get; set; }

        public virtual category category { get; set; }

        public virtual supplier supplier { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order_product> order_product { get; set; }
    }
}
