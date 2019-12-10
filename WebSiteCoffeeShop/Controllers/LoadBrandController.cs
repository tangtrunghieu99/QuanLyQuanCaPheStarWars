using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace WebSiteCoffeeShop.Controllers
{
    public class LoadBrandController : Controller
    {
        // GET: LoadBrand
        public ActionResult ChiNhanh()
        {
            var product = new BrandDao();
            ViewBag.DSChiNhanh = product.ListAll();
            return View();
        }
    }
   
}