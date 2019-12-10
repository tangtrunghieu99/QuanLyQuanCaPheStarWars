using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class OrderDao
    {
        QLCoffeeEntities cf = null;
        public OrderDao()    //khởi tạo OrderDao khởi tạo luôn biến db
        {
            cf = new QLCoffeeEntities();
        }
        public int Insert(DatHang dondathang)
        {
            cf.DatHangs.Add(dondathang);
            cf.SaveChanges();
            return dondathang.ID;
        }

        public void InsertTotal(int ID, decimal total)
        {
            var don_dh = cf.DatHangs.Find(ID);
            don_dh.TotalPrice = total;
            cf.SaveChanges();
        }

        public void InsertSLBan(int maMonAn, int soluong)
        {
            var monan = cf.ThucUongs.Find(maMonAn);
            monan.Quality += soluong;
            cf.SaveChanges();
        }
    }
}
