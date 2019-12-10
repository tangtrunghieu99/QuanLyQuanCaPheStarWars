using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;
using WebSiteCoffeeShop.Common;
using WebSiteCoffeeShop.Models;
using Model.EF;

namespace WebSiteCoffeeShop.Controllers
{
    public class ClientController : Controller
    {
        // GET: Client
       private string Account_Session = "Account_Session";
        [HttpGet]
        public ActionResult Register()
        {
            SetGender();
            return View();

        }
        [HttpPost]
        public ActionResult Register(Customer model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                if (dao.CheckUserName(model.TenDN))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                
                else
                {
                    model.MatKhau = MaHoa.Instance.Encrypt(model.MatKhau);
                    SetGender(model.GioiTinh);
                    var result = dao.Insert(model);
                    if (result)
                    {
                        return RedirectToAction("LoginCustomer","Client");

                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }

            }
            SetGender(model.GioiTinh); //  set giá trị 
            return View(model);
        }

        public void SetGender(string sl = null)
        {

            var b = new SelectList(new List<SelectListItem>
            {
                new SelectListItem {Text = "Nam",Value="Nam"},
                new SelectListItem {Text = "Nữ",Value="Nữ"},
            }, "Value", "Text", sl);

            ViewBag.GioiTinh = b; // tên này phải trùng với tên lúc khai báo giới tính ở sql
        }
        
        public ActionResult LoginCustomer(LoginCus login)
        {

            if (ModelState.IsValid)
            {

                var acc = new UserDao();
                var kq = acc.LoginCus(login.userName, MaHoa.Instance.Encrypt(login.passWord));
                if (kq == 1)
                {
                    var user = acc.GetCus(login.userName);
                    var accSession = new AccLogin();
                    accSession.UserName = user.TenDN;
                    accSession.AccID = user.ID;

                    Session.Add(CommonConstants.Account_Session, accSession);

                    return RedirectToAction("Index", "Home");
                }
                else if (kq == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else
                {
                    ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu");
                }
            }
            return View("LoginCustomer");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.Account_Session] = null;
            return Redirect("/dang-xuat");
        }
    }
}