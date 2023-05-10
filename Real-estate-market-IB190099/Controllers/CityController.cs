using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class CityController : BaseCRUDController<City, NameSearchObject, NameUpsertRequest, NameUpsertRequest>
    {
        public CityController(ICityService cityService) : base(cityService)
        {

        }
    }
}
