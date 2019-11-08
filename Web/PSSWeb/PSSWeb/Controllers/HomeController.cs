using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PSSWeb.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index(String name)
        {
            var input = Server.HtmlEncode(name);

            return Content(name);
        }
    }
    public class FriendController : Controller
    {
        public ActionResult Search(String name)
        {
            var input = Server.HtmlEncode(name);
            return Content(input);
        }
            
    }
}