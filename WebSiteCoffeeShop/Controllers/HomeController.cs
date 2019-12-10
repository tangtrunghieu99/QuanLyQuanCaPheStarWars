using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace WebSiteCoffeeShop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult MainMeNu()
        {
            var model = new MenuDao().ListByGroupID();
            return PartialView(model);
        }
    }
}