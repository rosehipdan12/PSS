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
            var item = (from e in ps.categories select e).ToList();
    
            return View(item);
        }

    }
}