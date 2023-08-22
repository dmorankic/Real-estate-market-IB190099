using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Services;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class BaseController<T, TSearch> : ControllerBase where T : class where TSearch : class
    {
        public IService<T, TSearch> _service { get; set; }
        public BaseController(IService<T, TSearch> service)
        {
            _service = service;
        }
        [AllowAnonymous]
        [HttpGet]
        public virtual IEnumerable<T> Get([FromQuery] TSearch search = null)
        {
            return _service.Get(search);
        }
        [HttpGet("{id}")]
        public virtual T GetById(int id) { return _service.GetById(id); }
    }
}
