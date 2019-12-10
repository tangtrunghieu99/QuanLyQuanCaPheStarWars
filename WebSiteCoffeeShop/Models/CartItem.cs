using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model.EF;

namespace WebSiteCoffeeShop.Models
{
    [Serializable]
    
    public class CartItem
    {
        public ThucUong Monan { set; get; }
        public int SoLuong { set; get; }
    }
}