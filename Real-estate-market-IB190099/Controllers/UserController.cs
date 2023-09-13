using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
    public class UserController : BaseCRUDController<Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>
    {
        public Ib190099Context _context;
        public IMapper _mapper;
        public UserController(IUserService userService, IMapper Mapper,
            Ib190099Context Context) : base(userService)
        {
            _context = Context;
            _mapper= Mapper;
        }

        [AllowAnonymous]
        public override UserModel Insert([FromBody] UserInsertRequest insert)
        {
            return base.Insert(insert);
        }
        [HttpPatch("{id}")]
        public  IActionResult PatchEmployee([FromRoute] int id, [FromBody] Microsoft.AspNetCore.JsonPatch.JsonPatchDocument<User> userDocument)
        {
            var userQuery = _context.Users.Include(x=>x.Address.City).Include(x=>x.Role).FirstOrDefault(x=>x.Id==id);
            
            if (userQuery == null)
            {
                return BadRequest(_mapper.Map<UserModel>(userQuery));
            }

            userDocument.ApplyTo(userQuery);
            var validationResult = new UserUpdateFluentValidator().Validate(userQuery);

            if (!validationResult.IsValid)
            {
                throw new UserException(validationResult.Errors[0].ErrorMessage);
            }
            _context.SaveChanges();

            var updatedUser= _mapper.Map<UserModel>(userQuery);

            if (updatedUser == null)
            {
                return NotFound();
            }
            return Ok(updatedUser);
        }
    }
}
