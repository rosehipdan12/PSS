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
            ViewData["Pet"] = (from e in ps.pets select e).ToList();

            return View();
        }
        public ActionResult Single(string id)
        {
            int Item_id = int.Parse(id);
            var itemLoad = from e in ps.items where e.id == Item_id select e;
            ViewData["ItemLoad"] = itemLoad.ToList();
            ViewData["Items"] = (from e in ps.items select e).ToList();

            return View();
        }
        public ActionResult Catalog(string id)
        {
            int cata_id = int.Parse(id);
            var itemLoad = from e in ps.items where e.category_id == cata_id select e;
            ViewData["ItemLoad"] = itemLoad.ToList();
            ViewData["Catalogy_name"] = ps.categories.First(c => c.id == cata_id);
            return View();
        }
        public ActionResult Checkout()
        {
            return View();
        }

    }
}