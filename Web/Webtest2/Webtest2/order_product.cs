namespace Webtest2
{
    public partial class order_product
    {
        public int? order_id { get; set; }

        public int? pet_id { get; set; }

        public int? item_id { get; set; }

        public int? quantity { get; set; }

        public int id { get; set; }

        public int? price { get; set; }

        public virtual item item { get; set; }

        public virtual order order { get; set; }

        public virtual pet pet { get; set; }
    }
}
