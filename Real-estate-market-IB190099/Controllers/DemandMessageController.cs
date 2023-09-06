using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Services;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DemandMessageController : BaseCRUDController<DemandMessageModel, IdSearchObject, DemandMessageInsertRequest, DemandMessageInsertRequest>
    {
        public DemandMessageController(IDemandMessageService service) : base(service)
        {
        }
    }
}
