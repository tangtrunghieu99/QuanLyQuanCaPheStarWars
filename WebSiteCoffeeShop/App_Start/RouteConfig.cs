using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebSiteCoffeeShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
               name: "SignOut",
               url: "ThoatRa",
               defaults: new { controller = "Login", action = "Logout", id = UrlParameter.Optional },
               namespaces: new[] { "WebSiteCoffeeShop.Controllers" }).DataTokens = new RouteValueDictionary(new { Area = "Admin" });
            routes.MapRoute(
            name: "Banh",
            url: "banh",
            defaults: new { controller = "LoadFood", action = "Cookies", id = UrlParameter.Optional }
        );
            routes.MapRoute(
           name: "Coffee",
           url: "ca-phe",
           defaults: new { controller = "LoadFood", action = "Coffee", id = UrlParameter.Optional }
        );
            routes.MapRoute(
          name: "Tea",
          url: "tra",
          defaults: new { controller = "LoadFood", action = "Tea", id = UrlParameter.Optional }
         );
            routes.MapRoute(
        name: "Blended",
        url: "da-xay",
        defaults: new { controller = "LoadFood", action = "Blended", id = UrlParameter.Optional }
        );
            routes.MapRoute(
             name: "Đăng Nhập",
             url: "dang-nhap",
            defaults: new { controller = "Client", action = "LoginCustomer", id = UrlParameter.Optional }
            );
            routes.MapRoute(
            name: "Đăng Ký",
            url: "dang-ky",
           defaults: new { controller = "Client", action = "Register", id = UrlParameter.Optional }
           );
            routes.MapRoute(
            name: "Đăng Xuất",
            url: "dang-xuat",
           defaults: new { controller = "Client", action = "LoginCustomer", id = UrlParameter.Optional }
           );
            routes.MapRoute(
            name: "Thanh Toán",
            url: "thanh-toan",
           defaults: new { controller = "Cart", action = "ThanhToan", id = UrlParameter.Optional }
           );
            routes.MapRoute(
            name: "Trang chủ",
            url: "trang-chu",
           defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
           );
            routes.MapRoute(
         name: "Chinhanh",
         url: "chi-nhanh",
         defaults: new { controller = "LoadBrand", action = "ChiNhanh", id = UrlParameter.Optional }
        );
            routes.MapRoute(
         name: "Di Sản",
         url: "di-san",
         defaults: new { controller = "VeChungToi", action = "DiSan", id = UrlParameter.Optional }
        );
            routes.MapRoute(
         name: "Cơ Hội Nghề Nghiệp",
         url: "co-hoi-nghe-nghiep",
         defaults: new { controller = "VeChungToi", action = "CoHoiNgheNghiep", id = UrlParameter.Optional }
        );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
