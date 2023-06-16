using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public interface IAdvertiseService:ICRUDService<AdvertiseModel, AdvertiseSearchObject, AdvertiseInsertRequest, AdvertiseInsertRequest>
    {
        List<PropertyOutput> Recommend(int userId);
        
    }
}
