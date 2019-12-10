using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

namespace WebSiteCoffeeShop.Areas.Admin.Controllers
{
    public class BrowserFeedBackController : BaseController
    {
        // GET: Admin/BrowserFeedBack
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BrowserFB(int page = 1, int pagesize = 5)
        {
            var model = new FeedBackDao().GetFeedBack(page, pagesize);
            return View(model);
        }

        public ActionResult Browser(int idFeed)
        {
            bool kq = new FeedBackDao().Duyet(idFeed);
            if (!kq)
                ModelState.AddModelError("", "Có lỗi xảy ra");
            return Redirect("/Admin/BrowserFeedBack/BrowserFB");
        }
    }
}