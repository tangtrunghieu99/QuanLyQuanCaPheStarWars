using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSiteCoffeeShop.Areas.Admin.Controllers
{
    public class IndexController : Controller
    {
        // GET: Admin/Test
        public ActionResult AdminIndex()
        {
            return View();
        }
    }
}