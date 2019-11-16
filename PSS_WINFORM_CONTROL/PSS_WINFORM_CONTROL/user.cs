namespace PSS_WINFORM_CONTROL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("user")]
    public partial class user
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public user()
        {
            order_user = new HashSet<order_user>();
        }

        public int id { get; set; }

        [StringLength(50)]
        public string first_name { get; set; }

        [StringLength(50)]
        public string last_name { get; set; }

        [StringLength(50)]
        public string phone_number { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [StringLength(50)]
        public string address { get; set; }

        [StringLength(50)]
        public string city { get; set; }

        [StringLength(50)]
        public string password { get; set; }

        public bool? status { get; set; }

        public int? role_id { get; set; }

        [StringLength(50)]
        public string gender { get; set; }

        [StringLength(50)]
        public string username { get; set; }

        public virtual role role { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order_user> order_user { get; set; }
    }
}
