using AutoMapper;
using Microsoft.EntityFrameworkCore;
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
    public class DemandAdvertiseService : BaseCRUDService<DemandAdvertise,DemandAdvertiseModel, AdvertiseSearchObject, DemandAdvertiseInsertRequest, DemandAdvertiseInsertRequest>
           , IDemandAdvertiseService
    {
        public Ib190099Context _context;
        public IMapper _mapper;
        public DemandAdvertiseService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
            _context= Context;
            _mapper= Mapper;
        }

        public IEnumerable<DemandAdvertiseModel> GetSavedDemandAdvertises(int userId)
        {
            var advertises = Context.SavedDemandAdvertises.Include(x=>x.DemandAdvertise)
               .Where(x => x.UserId == userId).ToList();

            List<DemandAdvertiseModel> mappedAdvertises = new List<DemandAdvertiseModel>();
            advertises.ForEach(x =>
            {
                var advertise = Mapper.Map<DemandAdvertiseModel>(x.DemandAdvertise);
                mappedAdvertises.Add(advertise);
            });
            return mappedAdvertises;
        }
        public override IQueryable<DemandAdvertise> AddInclude(IQueryable<DemandAdvertise> query, AdvertiseSearchObject search = null)
        {
            query = query
                .Include(x => x.User);

            return query;
        }
        public DemandAdvertiseModel Remove(int id)
        {

            List<DemandMessage> messagesToRemove = new List<DemandMessage>();
            var messages = Context.DemandMessages.ToList();
            foreach (var message in messages)
            {
                if (message.DemandAdvertiseId == id)
                {
                    messagesToRemove.Add(message);
                }
            }
            if(messagesToRemove.Count > 0)
            {
                messagesToRemove.ForEach(x => { Context.DemandMessages.Remove(x); });
            }
            List<SavedDemandAdvertise> toRemove= new List<SavedDemandAdvertise>();
            var savedAds = Context.SavedDemandAdvertises.ToList();
            foreach (var advertise in savedAds)
            {
                if (advertise.DemandAdvertiseId == id)
                {
                    toRemove.Add(advertise);
                }
            }
            if(toRemove.Count > 0)
            {
                toRemove.ForEach(x=>{ Context.SavedDemandAdvertises.Remove(x); });
            }
            var entity = Context.DemandAdvertises.Find(id);
            if (entity != null)
            {
                _context.DemandAdvertises.Remove(entity);
                _context.SaveChanges();
                return _mapper.Map<DemandAdvertiseModel>(entity);
            }
            return null;
        }

        public SavedAdvertiseInsertRequest RemoveFromSaved(SavedAdvertiseInsertRequest insert)
        {
            var advertises = Context.SavedDemandAdvertises.ToList();
            bool found = false;
            advertises.ForEach(x =>
            {
                if (x.DemandAdvertiseId == insert.AdvertiseId && x.UserId == insert.UserId) { Context.SavedDemandAdvertises.Remove(x); found = true; }
            });
            if (found == false) { throw new UserException("Given advertise is not saved by this user"); }
            Context.SaveChanges();
            return insert;
        }

        public SavedDemandAdvertiseInsertRequest SaveAdvertise(SavedDemandAdvertiseInsertRequest insert)
        {
            var insertReq = Mapper.Map<SavedDemandAdvertise>(insert);
            var advertises = Context.SavedDemandAdvertises.ToList();
            advertises.ForEach(x =>
            {
                if (x.DemandAdvertiseId == insert.DemandAdvertiseId && x.UserId == insert.UserId) { throw new UserException("You already saved this advertise"); }
            });
            Context.SavedDemandAdvertises.Add(insertReq);
            Context.SaveChanges();
            return insert;
        }

        public override IQueryable<DemandAdvertise> AddFilter(IQueryable<DemandAdvertise> query, AdvertiseSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);
            if (!string.IsNullOrEmpty(search.PropertyName))
            {
                filteredQuery=filteredQuery.Where(x=>x.Location.ToLower().Contains(search.PropertyName.ToLower()));
            }
            if(!string.IsNullOrEmpty(search.Status))
            {
                filteredQuery=filteredQuery.Where(x=>x.Status.ToLower()==search.Status.ToLower());
            }
            return filteredQuery;

        }
    }
}
