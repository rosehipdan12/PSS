using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
namespace Webtest2.Controllers
{
    public class HomeController : Controller
    {
        Model1 ps = new Model1();
        Function fs = new Function();
        public ActionResult Index()
        {
            ViewData["Items"] = (from e in ps.items select e).ToList();
            ViewData["Brands"] = (from e in ps.suppliers select e).ToList();
            ViewData["Pets"] = (from e in ps.pets select e).ToList();
            return View();
        }
        public ActionResult Singlepet(String id) {
            System.Diagnostics.Debug.WriteLine(id);
            int Pet_id = Int32.Parse(id);
            ViewData["PetsLoad"] = (from e in ps.pets select e).ToList();
            ViewData["Pets"] = ps.pets.Where(c => c.id == Pet_id).FirstOrDefault();
            return View();
        }
        public ActionResult Singleitem(String id)
        {
            System.Diagnostics.Debug.WriteLine(id);
            int Item_id = Int32.Parse(id);
            ViewData["ItemLoad"] = (from e in ps.items select e).ToList();
            ViewData["Items"] = ps.items.Where(c => c.id == Item_id).FirstOrDefault();
            return View();
        }
        public ActionResult Catalog(String id)
        {
            int cata_id = Int32.Parse(id);
            var itemLoad = from e in ps.items where e.category_id == cata_id select e;
            ViewData["ItemLoad"] = itemLoad.ToList();
            ViewData["Catalogy_name"] = ps.categories.First(c => c.id == cata_id);
            return View();
        }
        public ActionResult Checkout()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                int id = Int32.Parse(Session["user"].ToString());
                user us = ps.users.Where(c => c.id == id).FirstOrDefault();
                ViewData["User"] = us;

            }
            return View();
        }
        public ActionResult Login()
        {
            ViewData["ErrorMessage"] = string.Empty;
            ViewData["RegMess"] = string.Empty;
            return View();
        }
        [HttpPost]
        public ActionResult Login(string Username, string Password)
        {
            System.Diagnostics.Debug.WriteLine(Username);
            System.Diagnostics.Debug.WriteLine(Password);
            if (Username.Length > 12 || Username.Length < 8)
            {
                ViewData["ErrorMessage"] = "Username must from 8 to 12 character. Try again";
                return View();
            };
            if (Password.Length > 12 || Password.Length < 8)
            {
                ViewData["ErrorMessage"] = "Password must from 8 to 12 character. Try again";
                return View();
            }
            Password = fs.CreateMD5(Password);
            var s = ps.users.Where(c => c.username.Equals(Username) && c.password.Equals(Password) && c.role_id == 1).FirstOrDefault();
            if (s == null)
            {
                ViewData["ErrorMessage"] = "Username or password is wrong. Try again";
            }
            else
            {
                Session["user"] = s.id;
                return RedirectToAction("Index");
            }
            return View();
        }

       

        [HttpPost]
        public ActionResult CreateAccount(string username, string password, string email, string phone)
        {
            System.Diagnostics.Debug.WriteLine(username);
            System.Diagnostics.Debug.WriteLine(password);
            System.Diagnostics.Debug.WriteLine(email);
            System.Diagnostics.Debug.WriteLine(phone);
            var s = ps.users.Where(c => c.username.Equals(username)).FirstOrDefault();
            if (s == null)
            {
                user us = new user();
                us.username = username;
                us.password = fs.CreateMD5(password);
                us.phone_number = phone;
                us.email = email;
                us.role_id = 1;
                us.status = false;
                ps.users.Add(us);
                ps.SaveChanges();
            }
            else
            {
                ViewData["RegMess"] = "Username is exist. Try again";
            }
            return View("login");
        }
        public ActionResult user()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login");
            }
            int id = Int32.Parse(Session["user"].ToString());
            user us = ps.users.Where(c => c.id == id).FirstOrDefault();
            ViewData["User"] = us;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult user(user user)
        {
            int id = Int32.Parse(Session["user"].ToString());
            user us = ps.users.Where(c => c.id == id).FirstOrDefault();
            us.first_name = user.first_name;
            us.last_name = user.last_name;
            us.phone_number = user.phone_number;
            us.email = user.email;
            us.gender = user.gender;
            ps.SaveChanges();

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }
        

        public ActionResult Payment()
        {
            if (Session["cart"] == null)
            {
                return new EmptyResult();
            }
            return View();
        }
        public ActionResult Placeorder()
        {
            order order = new order();
            order_user os = new order_user();

            int id = Int32.Parse(Session["user"].ToString());
            user us = ps.users.Where(c => c.id == id).FirstOrDefault();

            order.status = false;
            order.date_order = DateTime.Now;

            ps.orders.Add(order);
            ps.SaveChanges();


            order = ps.orders.Where(c => c.id == ps.orders.Max(item => item.id)).FirstOrDefault();
          
            os.user_id = us.id;
            os.order_id = order.id;

            ps.order_user.Add(os);
            item ie = null;
            pet p = null;
            double? priceTotal = 0;
            foreach (var item in (List<cart>)Session["cart"])
            {
                
                order_product od = new order_product();
                if (!item.itemorpet())
                {
                    od.item_id = item.item.id;
                    ie = ps.items.Where(c => c.id == item.item.id).FirstOrDefault();
                    od.order_id = order.id;
                    od.quantity = item.quantity;
                    ie.quantity -= item.quantity;
                    od.price = item.price();
                    priceTotal += item.price();
                    ps.order_product.Add(od);
                }
                else
                {
                    od.pet_id = item.pet.id;
                    od.order_id = order.id;
                    od.quantity = item.quantity;
                    p = ps.pets.Where(c => c.id == item.pet.id).FirstOrDefault();
                    p.price -= item.quantity;
                    od.price = item.price();
                    priceTotal += item.price();
                    ps.order_product.Add(od);
                }
            }
            order.price = priceTotal;
            ps.SaveChanges();
            Session["cart"] = new List<cart>();
            return RedirectToAction("Index");

        }
        public ActionResult orderhistory()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Login");
            }
            int id = Int32.Parse(Session["user"].ToString());
            IEnumerable<order_user> orderHis = ps.order_user.Where(e => e.user_id == id).ToList();
            System.Diagnostics.Debug.WriteLine(orderHis.Count());
            List<order_product> orderProductHis = new List<order_product>();

            foreach (var item in orderHis)
            {
                System.Diagnostics.Debug.WriteLine(item.order_id);
                System.Diagnostics.Debug.WriteLine(item.user_id);
                orderProductHis.AddRange(ps.order_product.Where(c => c.order_id == item.order_id).ToList());
                //System.Diagnostics.Debug.WriteLine(order_product.order_id);
                //System.Diagnostics.Debug.WriteLine(order_product.price);
            }
            ViewData["Order_product"] = orderProductHis;
            return View();
        }
        
        public ActionResult searchresult(string keyword)
        {
            ViewData["itemSearch"] = ps.items.Where(c => c.tags.Contains(keyword)).ToList();
            ViewData["petSearch"] = ps.pets.Where(c => c.name.Contains(keyword)||c.species.name.Contains(keyword)).ToList();
            ViewData["keyword"] = keyword;
            return View();
        }

        public ActionResult petcatalog(string type)
        {
            ViewData["petSearch"] = ps.pets.Where(c => c.species.description.Contains(type)).ToList();
            return View();
        }
        public ActionResult Logout() {
            Session["user"] = null;
            return RedirectToAction("Index");
        }
    }
}
