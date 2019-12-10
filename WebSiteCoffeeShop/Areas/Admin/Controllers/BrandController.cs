using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using Model.EF;
namespace WebSiteCoffeeShop.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        // GET: Admin/Brand
        public ActionResult DSChiNhanh(int page = 1, int pagesize = 10)
        {
            var accDao = new BrandDao();
            var model = accDao.ListChiNhanhAll(page, pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult ChiNhanh()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult ChiNhanh(ChiNhanh model)
        {
            if (ModelState.IsValid)
            {
                SetViewBag(model.ID);
                
                var kq = new BrandDao().Insert(model);
                if (kq)
                {
                    
                    return Redirect("/Admin/Brand/DSChiNhanh");
                }
            }
            SetViewBag();
            
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var dao = new BrandDao();
            var sach = dao.GetChiNhanh(id);
           
            SetViewBag(sach.ID);
            return View(sach);
        }
        [HttpPost]
        public ActionResult Edit(ChiNhanh model)
        {
            if (ModelState.IsValid)
            {
                
                SetViewBag(model.ID);
                var kq = new BrandDao().Update(model);
                if (kq)

                {
                    
                    return Redirect("/Admin/Brand/DSChiNhanh");
                }
            }
            SetViewBag();
            return View(model);
        }
        public void SetViewBag(int? selectedId = null)
        {
            var dao = new BrandDao();
            
            ViewBag.MaCD = new SelectList(dao.ListAll(), "ID", "Name", selectedId);
           

        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            bool result = new BrandDao().Delete(id);
            if (result)
            {
                
                return Redirect("/Admin/Brand/DSChiNhanh"); ;
            }
            else { ModelState.AddModelError("", "Xóa món thất bại"); }
            return Redirect("/Admin/Brand/DSChiNhanh"); ;
        }
    }
}