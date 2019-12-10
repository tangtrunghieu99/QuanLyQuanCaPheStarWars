using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class UserDao
    {
        QLCoffeeEntities cf = null;
        public UserDao()
        {
            cf = new QLCoffeeEntities();
        }
        public bool CheckUserName(string userName)
        {
            return cf.Customers.Count(x => x.TenDN == userName) > 0;
        }
        public bool Insert(Customer customer)
        {
            try
            {
                cf.Customers.Add(customer);
                cf.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }

        }
        public int LoginCus(string name,string pass)
        {
            var kq = cf.Customers.SingleOrDefault(x => x.TenDN == name);
            if (kq == null)
                return 0;
            else
            {
                if (kq.MatKhau == pass)
                    return 1;
                else
                    return -1;
            }
        }
        public Customer GetCus(string userName)
        {
            return cf.Customers.SingleOrDefault(x => x.TenDN == userName);
        }
        public Customer GetCustomersByID(int id)
        {
            Customer customer = cf.Customers.Find(id);
            return customer;
        }
        public List<Customer> GetCustomers()
        {
            return cf.Customers.ToList();
        }
    }
    
}
