using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Model.EF;
using PagedList;

namespace Model.Dao
{
    public class AccountDao
    {
        QLCoffeeEntities cf = null;
        public AccountDao()
        {
            cf = new QLCoffeeEntities();
        }
        public int InsertAccount(TaiKhoan tk)
        {
            cf.TaiKhoans.Add(tk);
            cf.SaveChanges();
            return tk.ID;

        }
        public bool UpdateAccount(TaiKhoan tk)
        {
            try
            {
                var user = cf.TaiKhoans.Find(tk.ID);
                user.Username = tk.Username;
                user.Dissplayname = tk.Dissplayname;
                user.Address = tk.Address;
                user.Phone = tk.Phone;
                user.TypeAccount = tk.TypeAccount;
                user.Ngaysinh = tk.Ngaysinh;
                cf.SaveChanges();
                return true;
            }
            catch (Exception)

            {
                return false;
            }
        }
        public IEnumerable<TaiKhoan> ListAccountAll(int page = 1, int pagesize = 10)
        {

            return cf.TaiKhoans.OrderByDescending(x => x.ID).ToPagedList(page, pagesize);
        }
        public TaiKhoan GetAccount(string userName)
        {
            return cf.TaiKhoans.SingleOrDefault(x => x.Username == userName);
        }
        public TaiKhoan ViewDetail(int id)
        {   
            return cf.TaiKhoans.Find(id);
        }
        public int Login(string name, string pass)
        {
            var kq = cf.TaiKhoans.SingleOrDefault(x => x.Username == name);
            if (kq == null)
                return 0;
            else
            {
                if (kq.Password == pass)
                    return 1;
                else
                    return -1;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var user = cf.TaiKhoans.Find(id);
                cf.TaiKhoans.Remove(user);
                cf.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
