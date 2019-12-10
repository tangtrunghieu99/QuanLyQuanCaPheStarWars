using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class BrandDao
    {
        QLCoffeeEntities cf = null;

        public BrandDao()
        {
            cf = new QLCoffeeEntities();
        }
        public List<ChiNhanh> ListAll()
        {
            return cf.ChiNhanhs.ToList();
        }
        public IEnumerable<ChiNhanh> ListCategoryAll(int page = 1, int pagesize = 10)
        {
            return cf.ChiNhanhs.OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
        public List<ChiNhanh> DSChiNhanh()
        {
            return cf.ChiNhanhs.OrderBy(x => x.ID).ToList();
        }
        public ChiNhanh GetChiNhanh(int id)
        {
            return cf.ChiNhanhs.Find(id);
        }
        public List<string> ListName(string keyword)
        {
            return cf.ChiNhanhs.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
        public bool Insert(ChiNhanh chinhanh)
        {
            try
            {
               cf.ChiNhanhs.Add(chinhanh);
                cf.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public bool Update(ChiNhanh model)
        {
            try
            {
                var food = cf.ChiNhanhs.Find(model.ID);
                
                food.Name = model.Name;
                

                food.Image = model.Image;
                food.Address = model.Address;

                food.Description = model.Description;
                cf.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public bool Delete(int id)
        {
            try
            {
                var sach = cf.ChiNhanhs.Find(id);
                cf.ChiNhanhs.Remove(sach);
                cf.SaveChanges();   
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<ChiNhanh> ListChiNhanhAll(int page = 1, int pagesize = 10)
        {

            return cf.ChiNhanhs.OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
    }
}
