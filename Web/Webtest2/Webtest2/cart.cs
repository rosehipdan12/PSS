using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Webtest2
{
    public class cart
    {
        public item item;
        public pet pet;
        public int quantity;
        public double? price()
        {
            if (item != null)
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
            return item == null;
        }
    }
}