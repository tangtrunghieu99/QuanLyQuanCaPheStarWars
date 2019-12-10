using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class OrderDetailDao
    {
        QLCoffeeEntities cf = null;
        public OrderDetailDao()    //khởi tạo OrderDetailDao khởi tạo luôn biến db
        {
            cf = new QLCoffeeEntities();
        }
        public bool Insert(ThongTinDatHang chitiet)
        {
            try
            {
                cf.ThongTinDatHangs.Add(chitiet);
                cf.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
