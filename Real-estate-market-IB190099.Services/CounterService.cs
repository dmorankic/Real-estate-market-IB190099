using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class CounterService : ICounterService
    {
        private readonly Ib190099Context _dbContext;

        public CounterService(Ib190099Context dbContext)
        {
            _dbContext = dbContext;
        }

        public int GetCitiesCount()
        {
            return _dbContext.Cities.Count();
        }
        public int GetRolesCount()
        {
            return _dbContext.Roles.Count();
        }
    }
}
