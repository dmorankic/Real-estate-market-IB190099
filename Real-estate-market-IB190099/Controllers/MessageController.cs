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
    public class MessageController : BaseCRUDController<MessageModel, MessageSearchObject, MessageInsertRequest, MessageInsertRequest>
    {
        public MessageController(IMessageService service) : base(service)
        {
        }
    }
}
