using AutoMapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class PaymentService : BaseCRUDService<Payment, PaymentModel, IdSearchObject, PaymentUpsertRequest, PaymentUpsertRequest>, IPaymentService
    {
        public PaymentService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
           
        }
        public override IQueryable<Payment> AddFilter(IQueryable<Payment> query, IdSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (search?.id != null)
            {
                filteredQuery = filteredQuery.Where(x => x.UserId == search.id);
            }

            return filteredQuery;
        }

        public override IQueryable<Payment> AddInclude(IQueryable<Payment> query, IdSearchObject search = null)
        {

            query = query.Include(x => x.Advertise).Include(x=>x.Employee);
            return query;
        }


    }
}
