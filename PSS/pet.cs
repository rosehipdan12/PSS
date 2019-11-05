namespace test7
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("pet")]
    public partial class pet
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public pet()
        {
            order_product = new HashSet<order_product>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [Column(TypeName = "text")]
        public string description { get; set; }

        [StringLength(50)]
        public string gender { get; set; }

        [Column(TypeName = "date")]
        public DateTime? birth { get; set; }

        public double? price { get; set; }

        [StringLength(50)]
        public string color { get; set; }

        [StringLength(10)]
        public string vaccine { get; set; }

        public bool? status { get; set; }

        public int species_id { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order_product> order_product { get; set; }

        public virtual species species { get; set; }
    }
}
