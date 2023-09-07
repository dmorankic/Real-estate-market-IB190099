using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class DemandMessageService : BaseCRUDService<DemandMessage, DemandMessageModel, IdSearchObject, DemandMessageInsertRequest, DemandMessageInsertRequest>
        , IDemandMessageService
    {
        public DemandMessageService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {

        }

        public override IQueryable<DemandMessage> AddFilter(IQueryable<DemandMessage> query, IdSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (search?.id != null)
            {
                filteredQuery = filteredQuery.Where(x => x.SenderId == search.id);
            }

            return filteredQuery;
        }
        public override IQueryable<DemandMessage> AddInclude(IQueryable<DemandMessage> query, IdSearchObject search = null)
        {
            query = query
                .Include(x => x.Sender).Include(x=>x.DemandAdvertise).OrderByDescending(x => x.Timestamp);

            return base.AddInclude(query, search);
        }
    }
}
