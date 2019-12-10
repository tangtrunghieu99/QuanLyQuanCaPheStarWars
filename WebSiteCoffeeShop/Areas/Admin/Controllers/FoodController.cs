using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;

namespace WebSiteCoffeeShop.Areas.Admin.Controllers
{
    public class FoodController : BaseController
    {
        // GET: Admin/Food
        public ActionResult DSFood(int page = 1, int pagesize = 10)
        {
            var accDao = new FoodDao();
            var model = accDao.ListFoodAll(page, pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Food()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult Food(ThucUong model)
        {
            if (ModelState.IsValid)
            {
                SetViewBag(model.IDCaterogy);
                var kq = new FoodDao().Insert(model);
                if (kq)
                {
                    SetAlert("Thêm món thành công", "success");
                    return Redirect("/Admin/Food/DSFood");
                }
            }
            SetViewBag();
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new FoodDao();
            var food = dao.GetFood(id);
            SetViewBag(food.IDCaterogy);
            return View(food);
        }
        [HttpPost]
        public ActionResult Edit(ThucUong model)
        {
            if (ModelState.IsValid)
            {
                SetViewBag(model.IDCaterogy);
                var kq = new FoodDao().Update(model);
                if (kq)
                {
                    SetAlert("Sửa món thành công", "success");
                    return Redirect("/Admin/Food/DSFood");
                }
            }
            SetViewBag();
            return View(model);
        }
        public void SetViewBag(int? selectedId = null)
        {
            var dao = new CategoryDao();
            ViewBag.IDCaterogy = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            bool result = new FoodDao().Delete(id);
            if (result)
            {
                SetAlert("Xóa món thành công", "success");
                return Redirect("/Admin/Food/DSFood"); ;
            }
            else { ModelState.AddModelError("", "Xóa món thất bại"); }
            return Redirect("/Admin/Food/DSFood"); ;
        }
    }
}