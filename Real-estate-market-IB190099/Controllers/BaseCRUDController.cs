using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Services;

namespace Real_estate_market_IB190099.Controllers
{
    public class BaseCRUDController<T, TSearch, TInsert, TUpdate> : BaseController<T, TSearch>
         where T : class where TInsert : class where TUpdate : class where TSearch : class
    {
        public ICRUDService<T, TSearch, TInsert, TUpdate> _service { get; set; }

        public BaseCRUDController(ICRUDService<T, TSearch, TInsert, TUpdate> service) : base(service)
        {
            _service = service;
        }

        [HttpPost]
        public virtual T Insert([FromBody] TInsert insert)
        {
            return _service.Insert(insert);
        }
        [HttpPut("{id}")]
        public T Update(int id, [FromBody] TUpdate update)
        {
            return _service.Update(id, update);
        }
    }
}
