using AutoMapper;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class MappingProfile : Profile
    {

        public MappingProfile()
        {
            var _counterService = new CounterService(new Ib190099Context());

            CreateMap<NameUpsertRequest, City>().AfterMap((src, dest) =>
            {
                dest.Id = _counterService.GetCitiesCount() + 1;
            });
            CreateMap<NameUpsertRequest, Role>().AfterMap((src, dest) =>
            {
                dest.Id = _counterService.GetRolesCount() + 1;
            });




        }
    }
}
