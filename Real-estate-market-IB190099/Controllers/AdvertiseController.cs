using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Validators;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AdvertiseController : BaseCRUDController<AdvertiseModel, AdvertiseSearchObject, AdvertiseInsertRequest, AdvertiseInsertRequest>
    {
        IAdvertiseService _service;
        Ib190099Context _context;
        public IMapper _mapper;

        public AdvertiseController(IAdvertiseService service, Ib190099Context context,
       IMapper Mapper) : base(service)
        {
            _service = service;
            _context = context;
            _mapper = Mapper;
        }
        [AllowAnonymous]
        [HttpGet("recommendations")]
        public ActionResult<IEnumerable<PropertyOutput>> GetRecommendations(int userId, string type)
        {
            var recommendations = _service.Recommend(userId,type);

            return Ok(recommendations);
        }

        public override IEnumerable<AdvertiseModel> Get([FromQuery] AdvertiseSearchObject search = null)
        {
            return base.Get(search);

        }

        public override AdvertiseModel GetById(int id)
        {
            return base.GetById(id);
        }
        [HttpPost]
        [Route("Save")]
        public SavedAdvertiseInsertRequest SaveAdvertise([FromBody] SavedAdvertiseInsertRequest savedAdvertise)
        {
            return _service.SaveAdvertise(savedAdvertise);
        }
        [HttpDelete]
        public SavedAdvertiseInsertRequest RemoveFromSaved([FromBody] SavedAdvertiseInsertRequest savedAdvertise)
        {
            return _service.RemoveFromSaved(savedAdvertise);
        }
        [HttpDelete]
        [Route("Remove")]
        public IActionResult Remove([FromQuery] int id)
        {
            AdvertiseModel removed = _service.Remove(id);
           if(removed != null)
            {
                return Ok(removed);
            }
            else
            {
                return NotFound();
            }
        }
        [Route("SavedAdv")]
        [HttpGet]
        public IEnumerable<AdvertiseModel> GetSavedAdvertises(int userId)
        {
            return _service.GetSavedAdvertises(userId);
        }

        [HttpPatch("{id}")]
        public IActionResult PatchAdvertise([FromRoute] int id, [FromBody] Microsoft.AspNetCore.JsonPatch.JsonPatchDocument<Advertise> adDocument)
        {
            var adQuery = _context.Advertises.Find(id);
            if (adQuery == null)
            {
                return BadRequest(_mapper.Map<AdvertiseModel>(adQuery));
            }

            adDocument.ApplyTo(adQuery);
            var validationResult = new AdvertiseUpdateFluentValidator().Validate(adQuery);

            if (!validationResult.IsValid)
            {
                throw new UserException(validationResult.Errors[0].ErrorMessage);
            }
            _context.SaveChanges();

            var updatedAd = _mapper.Map<AdvertiseModel>(adQuery);

            if (updatedAd == null)
            {
                return NotFound();
            }
            return Ok(updatedAd);
        }

    }
}
