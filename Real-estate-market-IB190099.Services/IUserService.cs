using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public interface IUserService : ICRUDService<Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>
    {
        UserModel Login(string username, string password);
    }
}
