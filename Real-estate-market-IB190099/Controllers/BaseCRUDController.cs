using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services;
using System.Collections.Generic;

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
            if(ModelState.IsValid)
            {
                return _service.Insert(insert);

            }
            else
            {
                throw new UserException("DATA VALIDATON");
            }
        }
        [HttpPut("{id}")]
        public T Update(int id, [FromBody] TUpdate update)
        {
           

            if (ModelState.IsValid)
            {
                return _service.Update(id, update);

            }
            else
            {
                throw new UserException("DATA VALIDATON");
            }
        }
    }
}
