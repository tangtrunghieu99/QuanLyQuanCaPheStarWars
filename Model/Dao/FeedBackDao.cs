using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class FeedBackDao
    {
        QLCoffeeEntities cf = null;

        public FeedBackDao()
        {
            cf = new QLCoffeeEntities();
        }
        public bool SendFeedBack(Feedback feed)
        {
            try
            {
                cf.Feedbacks.Add(feed);
                cf.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public List<Feedback> CustomerFeedBack()
        {
            return cf.Feedbacks.Where(x => x.Type != null && x.Browser == true).OrderByDescending(x => x.ID).Take(5).ToList();
        }
        public IEnumerable<Feedback> GetFeedBack(int page = 1, int pagesize = 10)
        {
            return cf.Feedbacks.Where(x => x.Browser == false).OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
        public bool Duyet(int id)
        {
            try
            {
                var model = cf.Feedbacks.Find(id);
                model.Browser = true;
                cf.SaveChanges();
                return true;
            }
            catch { return false; }
        }
    }
}
