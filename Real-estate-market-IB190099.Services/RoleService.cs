using AutoMapper;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class RoleService : BaseCRUDService<Database.Role, Database.Role, NameSearchObject, NameInsertRequest, NameUpsertRequest>
           , IRoleService
    {
        public RoleService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {

        }
        public override void BeforeInsert(NameInsertRequest insert, Role entity)
        {
            entity.Id = Context.Roles.Count() + 1;
            base.BeforeInsert(insert, entity);
        }
    }
}
