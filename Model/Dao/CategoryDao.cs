using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CategoryDao
    {
        QLCoffeeEntities cf = null;

        public CategoryDao()
        {
            cf = new QLCoffeeEntities();
        }
        public List<LoaiThucUong> ListAll()
        {
            return cf.LoaiThucUongs.ToList();
        }
        public IEnumerable<LoaiThucUong> ListCategoryAll(int page=1,int pagesize=10)
        {
            return cf.LoaiThucUongs.OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
    }
}
