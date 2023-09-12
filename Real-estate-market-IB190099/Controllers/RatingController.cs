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
    public class RatingController : BaseCRUDController<RatingModel, NameSearchObject, RatingUpsertRequest, RatingUpsertRequest>
    {
        public RatingController(IRatingService ratingService) : base(ratingService)
        {

        }
    }
}
