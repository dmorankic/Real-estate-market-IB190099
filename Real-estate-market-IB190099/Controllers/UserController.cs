using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : BaseCRUDController<Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>
    {
        public UserController(IUserService userService) : base(userService)
        {
       
        }

        [AllowAnonymous]
        public override UserModel Insert([FromBody] UserInsertRequest insert)
        {
            return base.Insert(insert);
        }
    }
}
