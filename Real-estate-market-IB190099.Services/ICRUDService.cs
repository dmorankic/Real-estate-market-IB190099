using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public interface ICRUDService<T, TSearch, TInsert, Tupdate> : IService<T, TSearch>
     where T : class where TSearch : class where TInsert : class where Tupdate : class
    {
        T Insert(TInsert insert);
        T Update(int id, Tupdate insert);
    }
}
