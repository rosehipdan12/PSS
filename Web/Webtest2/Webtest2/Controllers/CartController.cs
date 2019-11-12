using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Webtest2.Controllers
{
    public class CartController : Controller
    {
        Model1 ps = new Model1();

        // GET: Cart
        public ActionResult Index(string controller, string action)
        {
            return View();
        }
        /**
       * Cart Session controller
       */

        //Action buy
        [HttpPost]
        public ActionResult Buy(string id, string product, string controller, string action)
        {

            int item_id = int.Parse(id);
            //Create cart
            if (Session["cart"] == null)
            {
                List<cart> carts = new List<cart>();
                System.Diagnostics.Debug.WriteLine(carts.Count());
                System.Diagnostics.Debug.WriteLine(Session["cart"]);

                //add product to card 
                if (product.Equals("item"))
                {
                    carts.Add(new cart { item = ps.items.First(c => c.id == item_id), pet = null, quantity = 1 });
                }
                else
                {
                    carts.Add(new cart { item = null, pet = ps.pets.First(c => c.id == item_id), quantity = 1 });

                }
                System.Diagnostics.Debug.WriteLine(carts.Count());

                Session["cart"] = carts;
            }
            else
            {
                // if have card, increase quantity
                List<cart> carts = (List<cart>)Session["cart"];

                int index = isExist(item_id);
                if (index != -1)
                {
                    carts[index].quantity++;
                }
                else
                {
                    if (product.Equals("item"))
                    {
                        carts.Add(new cart { item = ps.items.First(c => c.id == item_id), quantity = 1 });
                    }
                    else
                    {
                        carts.Add(new cart { pet = ps.pets.First(c => c.id == item_id), quantity = 1 });

                    }
                }
                Session["cart"] = carts;
            }
            return RedirectToAction(action, controller);
        }
        //Remove product im cart
        public ActionResult Remove(string id)
        {
            int item_id = int.Parse(id);
            item ie = ps.items.First(c => c.id == item_id);
            List<cart> cart = (List<cart>)Session["cart"];
            int index = isExist(item_id);
            cart.RemoveAt(index);
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }
        //Check if product is exist in cart?
        private int isExist(int id)
        {
            List<cart> cart = (List<cart>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].item != null)
                {
                    if (cart[i].item.id.Equals(id))
                    {
                        return i;
                    };
                }
                else if (cart[i].pet != null)
                {
                    if (cart[i].pet.id.Equals(id))
                    {
                        return i;
                    };
                }
            }
            return -1;
        }
    }
}