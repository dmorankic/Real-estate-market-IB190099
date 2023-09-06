using Microsoft.AspNetCore.Mvc;
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
    public interface IDemandAdvertiseService:ICRUDService<DemandAdvertiseModel, AdvertiseSearchObject, DemandAdvertiseInsertRequest, DemandAdvertiseInsertRequest>
    {
       
        public SavedDemandAdvertiseInsertRequest SaveAdvertise(SavedDemandAdvertiseInsertRequest insert);
        public SavedAdvertiseInsertRequest RemoveFromSaved(SavedAdvertiseInsertRequest insert);
        public IEnumerable<DemandAdvertiseModel> GetSavedDemandAdvertises(int userId);
        public DemandAdvertiseModel Remove(int id);
    }
}
