using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.Dao;

using WebSiteCoffeeShop.Common;
using WebSiteCoffeeShop.Models;
using System.Web.Script.Serialization;
using Model.EF;
using System.Configuration;

namespace WebSiteCoffeeShop.Controllers
{
    public class CartController : Controller
    {
        public const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Cart()
        {
            var Cart = Session[CartSession];
            var list = new List<CartItem>();
            if(Cart!=null)
            {
                list = (List<CartItem>)Cart;
            }
            return View(list);
        }
        public ActionResult AddItem(int maDoUong, int SoLuong)
        {
            var douong = new FoodDao().GetFood(maDoUong);
            var Cart = Session[CartSession];
            if(Cart!=null)
            {
                var list = (List<CartItem>)Cart;
                if(list.Exists(x=>x.Monan.ID==maDoUong))
                {
                    foreach(var item in list)
                    {
                        if(item.Monan.ID==maDoUong)
                        {
                            item.SoLuong += SoLuong;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Monan = douong;
                    item.SoLuong = SoLuong;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                var item = new CartItem();
                item.Monan = douong;
                item.SoLuong = SoLuong;
                var list = new List<CartItem>();
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Cart","Cart");
        }
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Monan.ID == item.Monan.ID);
                if (jsonItem != null)
                {
                    item.SoLuong = jsonItem.SoLuong;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        //xóa tất cả trong gio3 hàng
        public JsonResult DeleteAll()
        {
            Session[CartSession] = null;
            return Json(new
            {
                status = true
            });
        }

        //xóa 1 mặt hàng trong giỏ h
        public JsonResult Delete(int id)
        {
            var sessionCart = (List<CartItem>)Session[CartSession];
            sessionCart.RemoveAll(x => x.Monan.ID == id);
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
        public ActionResult ThanhToan()
        {

            if (Session[CommonConstants.Account_Session] == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                var cart = Session[CartSession];
                var list = new List<CartItem>();
                if (cart != null)
                {
                    list = (List<CartItem>)cart;
                }
                return View(list);
            }
        }

        [HttpPost]
        public ActionResult ThanhToan(string shipName, string address, string mobile, string httt, string htgh)
        {
            var od = new OrderDao();
            var session = (AccLogin)Session[CommonConstants.Account_Session];
            var dondathang = new DatHang();
            dondathang.CustomerID = new UserDao().GetCus(session.UserName).ID;
            dondathang.CreateDate = DateTime.Now;
            dondathang.LastName = shipName;
            dondathang.Address = address;
            dondathang.Phone = mobile;
            dondathang.Papyment = httt;


            try
            {
                var soDH = od.Insert(dondathang);
                var cart = (List<CartItem>)Session[CartSession];
                var chitietDao = new OrderDetailDao();
                decimal total = 0;
                string tenmonan = null, gia = null;
                foreach (var item in cart)
                {
                    decimal thanhtien = 0;
                    var chitiet = new ThongTinDatHang();
                    chitiet.OrderID = soDH;
                    chitiet.FoodID = item.Monan.ID;
                    chitiet.Price = item.Monan.Price;
                    chitiet.Quantity = item.SoLuong;
                    thanhtien += item.Monan.Price.Value * item.SoLuong;
                    od.InsertSLBan(item.Monan.ID, item.SoLuong);
                    chitietDao.Insert(chitiet);

                    total += (item.Monan.Price.GetValueOrDefault(0) * item.SoLuong);
                    tenmonan += item.Monan.Name + "<br />";
                    gia += item.Monan.Price.GetValueOrDefault(0).ToString("N0") + "<br />";
                }
                Session[CartSession] = null;
                
            }
            catch(Exception)
            {
                return Redirect("/loi-thanh-toan");
            }
            return RedirectToAction("DatHangThanhCong","Cart");
            }
        public ActionResult DatHangThanhCong()
        {
            return View();
        }
    }
}