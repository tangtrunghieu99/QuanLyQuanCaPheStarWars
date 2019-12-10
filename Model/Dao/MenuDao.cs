using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class MenuDao
    {
        QLCoffeeEntities cf = null;
        public MenuDao()
        {
            cf = new QLCoffeeEntities();
        }
        public List<ThucDon> ListByGroupID()
        {
            return cf.ThucDons.ToList();
        }
        public List<LoaiThucDon> GetList()
        {
            return cf.LoaiThucDons.ToList();
        }
        public List<ThucDon> MeNuChinh()
        {
            return cf.ThucDons.Where(x => x.Submenu == null && x.Multilevel == true).ToList();
        }
        public bool InsertMenu(ThucDon menu)
        {
            try
            {
                cf.ThucDons.Add(menu);
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
