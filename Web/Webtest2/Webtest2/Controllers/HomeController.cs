using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Webtest2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            PSSEntities ps = new PSSEntities();
            dataModel dm = new dataModel();
            ViewData["Category"] = (from e in ps.categories select e).ToList();
            ViewData["Items"] = (from e in ps.items select e).ToList();
            ViewData["Brands"] = (from e in ps.suppliers select e).ToList();

            return View();
        }

    }
}