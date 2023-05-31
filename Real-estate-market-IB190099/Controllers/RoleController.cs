using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Model;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RoleController : BaseCRUDController<RoleModel, NameSearchObject, NameInsertRequest, NameUpsertRequest>
    {
        public RoleController(IRoleService roleService) : base(roleService)
        {

        }
    }
}
