﻿using System.Web.Mvc;
using System.Web.Routing;

namespace Webtest2
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Friend", "Friend/{name}", new{
                    controller = "Friend", action = "Search", name = UrlParameter.Optional
                });
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            
        }
    }
}
