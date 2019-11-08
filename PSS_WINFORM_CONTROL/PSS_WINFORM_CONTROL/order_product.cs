namespace PSS_WINFORM_CONTROL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class order_product
    {
        public int? order_id { get; set; }

        public int? pet_id { get; set; }

        public int? item_id { get; set; }

        public int? quantity { get; set; }

        public int? price { get; set; }

        public int id { get; set; }

        public virtual item item { get; set; }

        public virtual order order { get; set; }

        public virtual pet pet { get; set; }
    }
}
