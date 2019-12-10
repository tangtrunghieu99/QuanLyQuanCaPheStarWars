using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace WebSiteCoffeeShop.Controllers
{
    public class LoadFoodController : Controller
    {
        // GET: Food
        public ActionResult Cookies()
        {
            var product = new FoodDao();
            ViewBag.DS_Banh = product.ListFood();
            return View();
        }
        public ActionResult Coffee()
        {
            var product = new FoodDao();
            ViewBag.DS_Cafe = product.ListCafe();
            return View();
        }
        public ActionResult Tea()
        {
            var product = new FoodDao();
            ViewBag.DS_Tea = product.ListTea();
            return View();
        }
        public ActionResult Blended()
        {
            var product = new FoodDao();
            ViewBag.DS_Blended = product.ListBlended();
            return View();
        }

        public ActionResult Food(int id)
        {
            var food = new FoodDao().GetFood(id);
            ViewBag.RelatedFood = new FoodDao().RelatedFood(id);
            return View(food);
        }
        public JsonResult ListName(string q)
        {
            var data = new FoodDao().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}