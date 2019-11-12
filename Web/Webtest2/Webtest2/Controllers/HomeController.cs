using System;
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
            dataModel dm = new dataModel();
            ViewData["Items"] = (from e in ps.items select e).ToList();
            ViewData["Brands"] = (from e in ps.suppliers select e).ToList();

            return View();
        }
        public ActionResult Single(String id) {
            int Item_id = Int32.Parse(id);
            var itemLoad = from e in ps.items where e.id == Item_id select e;          
            ViewData["ItemLoad"] = itemLoad.ToList();
            ViewData["Items"] = (from e in ps.items select e).ToList();

            return View();
        }
        public ActionResult Catalog(String id)
        {
            int cata_id = Int32.Parse(id);
            var itemLoad = from e in ps.items where e.category_id == cata_id  select e;
            ViewData["ItemLoad"] = itemLoad.ToList();
            ViewData["Catalogy_name"] = ps.categories.First(c => c.id == cata_id);
            return View();
        }
      
    }
}