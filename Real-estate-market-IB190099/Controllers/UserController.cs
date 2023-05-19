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
    public class UserController : BaseCRUDController<Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>
    {
        IUserService _userService;
        public UserController(IUserService userService) : base(userService)
        {
            _userService = userService;
        }

        [AllowAnonymous]
        public override UserModel Insert([FromBody] UserInsertRequest insert)
        {
            return base.Insert(insert);
        }
        [AllowAnonymous]
        [HttpPatch("{id}")]
        public  IActionResult PatchEmployee([FromRoute] int id, [FromBody] Microsoft.AspNetCore.JsonPatch.JsonPatchDocument<User> userDocument)
        {
            var updatedUser =  _userService.UpdateUserPatchAsync(id, userDocument);
            if (updatedUser == null)
            {
                return NotFound();
            }
            return Ok(updatedUser);
        }
    }
}
