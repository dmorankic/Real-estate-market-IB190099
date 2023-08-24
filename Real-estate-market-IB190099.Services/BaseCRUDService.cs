using AutoMapper;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class BaseCRUDService<TDb, T, TSearch, TInsert, TUpdate> : BaseService<TDb, T, TSearch>, ICRUDService<T, TSearch, TInsert, TUpdate>
         where TDb : class where TSearch : BaseSearchObject where TInsert : class where TUpdate : class where T : class
    {
        public BaseCRUDService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
        }

        public virtual T Insert(TInsert insert)
        {
            var set = Context.Set<TDb>();
            TDb insertEntity = Mapper.Map<TDb>(insert);
            set.Add(insertEntity);
            BeforeInsert(insert, insertEntity);
            Context.SaveChanges();
            return Mapper.Map<T>(insertEntity);
        }

        public virtual void BeforeInsert(TInsert insert, TDb entity)
        {
            
        }

        public virtual void BeforeUpdate(TUpdate update, TDb entity)
        {

        }

        public virtual T Update(int id, TUpdate update)
        {
            var set = Context.Set<TDb>();
            var entity = set.Find(id);
            if (entity != null)
            {
                Mapper.Map(update, entity);
            }
            else
            {
                return null;
            }
            BeforeUpdate(update, entity);
            Context.SaveChanges();
            return Mapper.Map<T>(entity);
        }
    }
}
