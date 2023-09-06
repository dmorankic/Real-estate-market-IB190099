using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Validators;
using AutoMapper;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DemandAdvertiseController : BaseCRUDController<DemandAdvertiseModel, AdvertiseSearchObject, DemandAdvertiseInsertRequest, DemandAdvertiseInsertRequest>
    {
        public IDemandAdvertiseService _service;
        public Ib190099Context _context;
        public IMapper _mapper;
        public DemandAdvertiseController(IDemandAdvertiseService service, Ib190099Context context,
          IMapper mapper) : base(service)
        {
            _service = service;
            _context = context;
            _mapper = mapper;
        }

        [HttpDelete]
        [Route("Remove")]
        public IActionResult Remove([FromQuery] int id)
        {
            DemandAdvertiseModel removed = _service.Remove(id);
            if (removed != null)
            {
                return Ok(removed);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost]
        [Route("Save")]
        public SavedDemandAdvertiseInsertRequest SaveAdvertise([FromBody] SavedDemandAdvertiseInsertRequest savedAdvertise)
        {
            return _service.SaveAdvertise(savedAdvertise);
        }

        [HttpDelete]
        public SavedAdvertiseInsertRequest RemoveFromSaved([FromBody] SavedAdvertiseInsertRequest savedAdvertise)
        {
            return _service.RemoveFromSaved(savedAdvertise);
        }

        [Route("SavedAdv")]
        [HttpGet]
        public IEnumerable<DemandAdvertiseModel> GetSavedAdvertises(int userId)
        {
            return _service.GetSavedDemandAdvertises(userId);
        }

        [HttpPatch("{id}")]
        public IActionResult PatchAdvertise([FromRoute] int id, [FromBody] Microsoft.AspNetCore.JsonPatch.JsonPatchDocument<DemandAdvertise> adDocument)
        {
            var adQuery = _context.DemandAdvertises.Find(id);
            if (adQuery == null)
            {
                return BadRequest(_mapper.Map<DemandAdvertiseModel>(adQuery));
            }

            adDocument.ApplyTo(adQuery);
            var validationResult = new DemandAdvertiseUpdateFluentValidator().Validate(adQuery);

            if (!validationResult.IsValid)
            {
                throw new UserException(validationResult.Errors[0].ErrorMessage);
            }
            _context.SaveChanges();

            var updatedAd = _mapper.Map<DemandAdvertiseModel>(adQuery);

            if (updatedAd == null)
            {
                return NotFound();
            }
            return Ok(updatedAd);
        }
    }
}
