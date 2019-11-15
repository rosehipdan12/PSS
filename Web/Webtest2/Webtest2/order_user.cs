namespace Webtest2
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class order_user
    {
        public int user_id { get; set; }

        public int order_id { get; set; }

        public int id { get; set; }

        public virtual order order { get; set; }

        public virtual user user { get; set; }
    }
}
