using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSiteCoffeeShop.Areas.Admin.Models;
using WebSiteCoffeeShop.Common;

namespace WebSiteCoffeeShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult LoginAcc()
        {
            return View();
        }
        public ActionResult Login(LoginModel loginModel)
        {
            if (ModelState.IsValid)
            {

                var acc = new AccountDao();
                var kq = acc.Login(loginModel.userName, MaHoa.Instance.Encrypt(loginModel.passWord));
                if (kq == 1)
                {
                    var user = acc.GetAccount(loginModel.userName);
                    var accSession = new AccLogin();
                    accSession.UserName = user.Username;
                    accSession.AccID = user.ID;
                    accSession.Dissplayname = user.Dissplayname;
                   
                    
                    

                    Session.Add(CommonConstants.Admin_Session, accSession);

                    return RedirectToAction("AdminIndex", "Index");
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
            return View("LoginAcc");
        }
        public ActionResult Logout()
        {
            Session["Account_Session"]=null;
            return RedirectToAction("LoginAcc");
        }
    }
        
    }
