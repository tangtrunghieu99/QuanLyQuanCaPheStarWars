using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSiteCoffeeShop.Models
{
    public class LoginCus
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        public string userName { set; get; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập")]
        [DataType(DataType.Password)]
        public string passWord { set; get; }
        public bool rememberMe { set; get; }
    }
}