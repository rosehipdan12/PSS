namespace PSS_WINFORM_CONTROL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class species
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public species()
        {
            pets = new HashSet<pet>();
        }

        public int id { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [Column(TypeName = "text")]
        public string description { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<pet> pets { get; set; }
    }
}
