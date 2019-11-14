﻿using System;
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
            var s = ps.users.Where(c => c.username.Equals(Username) && c.password.Equals(Password)).FirstOrDefault();
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
                us.password = password;
                us.phone_number = phone;
                us.email = email;
                us.role_id = 3;
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
            return View();
        }
       
    }
}
