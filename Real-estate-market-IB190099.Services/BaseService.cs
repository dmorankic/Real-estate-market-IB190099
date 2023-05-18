using AutoMapper;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class BaseService<TDb, T, TSearch> where T : class where TDb : class where TSearch : BaseSearchObject
    {
        public Ib190099Context Context { get; set; }
        public IMapper Mapper { get; set; }

        public BaseService(Ib190099Context Context, IMapper Mapper)
        {
            this.Context = Context;
            this.Mapper = Mapper;
        }

        public virtual IEnumerable<T> Get(TSearch search = null)
        {
            var dbModelData = Context.Set<TDb>().AsQueryable();
            dbModelData = AddFilter(dbModelData, search);

            if (search?.PageSize.HasValue == true && search?.Page.HasValue == true)
            {
                dbModelData = dbModelData.Skip((search.Page.Value - 1) * search.PageSize.Value).Take(search.PageSize.Value);

            }
            dbModelData = AddInclude(dbModelData, search);

            var list = dbModelData.ToList();

            return Mapper.Map<IList<T>>(list);
        }

        public virtual IQueryable<TDb> AddFilter(IQueryable<TDb> query, TSearch search = null)
        {
            return query;
        }

        public virtual IQueryable<TDb> AddInclude(IQueryable<TDb> query, TSearch search = null)
        {
            return query;
        }
        public T GetById(int id)
        {
            var dbModelData = Context.Set<TDb>();
            return Mapper.Map<T>(dbModelData.Find(id));
        }


    }
}
