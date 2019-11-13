namespace Webtest2
{
    public class cart
    {
        public item item;
        public pet pet;
        public int quantity;
        public double? price()
        {
            if (this.item != null)
            {
                return item.pricePerUnit * quantity;
            }
            else
            {
                return pet.price * quantity;
            }
        }
        public bool itemorpet()
        {
            return item != null;
        }
    }

}