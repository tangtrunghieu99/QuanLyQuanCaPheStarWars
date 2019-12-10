using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class FoodDao
    {
        QLCoffeeEntities cf = null;
        public FoodDao()
        {
            cf = new QLCoffeeEntities();
        }
        public ThucUong GetFood(int id)
        {
            return cf.ThucUongs.Find(id);
        }
        public List<ThucUong> ListFood()
        {
            return cf.ThucUongs.Where(x=>x.IDCaterogy == 1).ToList();
        }
        public List<ThucUong> ListCafe()
        {
            return cf.ThucUongs.Where(x => x.IDCaterogy == 2).ToList();
        }
        public List<ThucUong> ListTea()
        {
            return cf.ThucUongs.Where(x => x.IDCaterogy == 3).ToList();
        }
        public List<ThucUong> ListBlended()
        {
            return cf.ThucUongs.Where(x => x.IDCaterogy == 4).ToList();
        }
        public List<ThucUong> RelatedFood(int id)
        {
            var food = cf.ThucUongs.Find(id);
            return cf.ThucUongs.Where(x => x.ID != id && x.IDCaterogy == food.IDCaterogy).ToList();
        }
        public List<ThucUong> OurFood(int idCategory)
        {
            return cf.ThucUongs.Where(x => x.IDCaterogy == idCategory).OrderBy(x => Guid.NewGuid()).Take(3).ToList();
        }
        public List<string> ListName(string keyword)
        {
            return cf.ThucUongs.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
        //public List<FoodViewModel> Search(string keyword)
        //{

        //    var model = (from a in cf.ThucUong  
        //                 join b in cf.FoodCategory
        //                 on a.IDCategory equals b.ID
        //                 where a.Name.Contains(keyword)
        //                 select new
        //                 {
        //                     ID = a.ID,
        //                     CateName = b.Name,
        //                     UrlTitle = a.UrlTitle,
        //                     Price = a.Price,
        //                     Detail = a.Detail,
        //                     Description = a.Description,
        //                     Name = a.Name,
        //                     Image = a.Image,

        //                 }).AsEnumerable().Select(x => new FoodViewModel()
        //                 {
        //                     ID = x.ID,
        //                     CateName = x.Name,
        //                     UrlTitle = x.UrlTitle,
        //                     Price = x.Price,
        //                     Detail = x.Detail,
        //                     Description = x.Description,
        //                     Name = x.Name,
        //                     Image = x.Image,
        //                 });
        //    //model.OrderByDescending(x => x.ID).Skip((pageIndex - 1) * pageSize).Take(pageSize);
        //    return model.ToList();
        //}
        public bool Insert(ThucUong thucuong)
        {
            try
            {
                cf.ThucUongs.Add(thucuong);
                cf.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public bool Update(ThucUong model)
        {
            try
            {
                var food = cf.ThucUongs.Find(model.ID);
                food.IDCaterogy = model.IDCaterogy;
                food.Name = model.Name;
                food.Price = model.Price;
                
                food.Image = model.Image;
                food.Description = model.Description;
                food.Detail = model.Detail;
                cf.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        public bool Delete(int id)
        {
            try
            {
                var food = cf.ThucUongs.Find(id);
                cf.ThucUongs.Remove(food);
                cf.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<ThucUong> ListFoodAll(int page = 1, int pagesize = 10)
        {

            return cf.ThucUongs.OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
    }
}
