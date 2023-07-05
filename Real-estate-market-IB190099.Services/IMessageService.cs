using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.Services
{
    public interface IMessageService : ICRUDService<MessageModel, NameSearchObject, MessageInsertRequest, MessageInsertRequest>
    {

    }
}
