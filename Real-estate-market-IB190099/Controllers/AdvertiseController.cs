using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AdvertiseController : BaseCRUDController<AdvertiseModel, AdvertiseSearchObject, AdvertiseInsertRequest, AdvertiseInsertRequest>
    {
        IAdvertiseService _service;
        public AdvertiseController(IAdvertiseService service) : base(service)
        {
            _service= service;
        }
        [AllowAnonymous]
        [HttpGet("recommendations")]
        public ActionResult<IEnumerable<PropertyOutput>> GetRecommendations(int userId)
        {
            var recommendations = _service.Recommend(userId);

            return Ok(recommendations);
        }
        [AllowAnonymous]
        public override IEnumerable<AdvertiseModel> Get([FromQuery] AdvertiseSearchObject search = null)
        {
            return base.Get(search);

        }
    }
}
