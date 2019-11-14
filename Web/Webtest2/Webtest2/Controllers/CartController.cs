using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Webtest2.Controllers
{
    public class CartController : Controller
    {
        Model1 ps = new Model1();

        // GET: Cart
        public ActionResult Index(String controller,String action)
        {
            return View();
        }
        /**
       * Cart Session controller
       */

        //Action buy
        [HttpPost]
        public ActionResult Buy(string id, string product,string controller,string action)
        {
            int item_id = Int32.Parse(id);
            //Create cart
            if (Session["cart"] == null)
            {
                List<cart> cart = new List<cart>();
                //add product to card 
                if (product.Equals("item"))
                {
                    cart.Add(new cart { item = ps.items.First(c => c.id == item_id), quantity = 1 });
                }
                else
                {
                    cart.Add(new cart { pet = ps.pets.First(c => c.id == item_id), quantity = 1 });

                }
                Session["cart"] = cart;
            }
            else
            {
                // if have card, increase quantity
                List<cart> cart = new List<cart>();
                int index = isExist(item_id);
                if (index != -1)
                {
                    cart[index].quantity++;
                }
                else
                {
                    if (product.Equals("item"))
                    {
                        cart.Add(new cart { item = ps.items.First(c => c.id == item_id), quantity = 1 });
                    }
                    else
                    {
                        cart.Add(new cart { pet = ps.pets.First(c => c.id == item_id), quantity = 1 });

                    }
                }
                Session["cart"] = cart;
            }
            return RedirectToAction(action, controller);
        }
        //Remove product im cart
        public ActionResult Remove(string id)
        {
            int item_id = Int32.Parse(id);
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