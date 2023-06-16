using AutoMapper;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class MappingService
    {
        public IMapper _Mapper { get; set; }
        public MappingService(IMapper Mapper) { 
        _Mapper= Mapper;
        }

        public PropertyOutput Map(Property prop)
        {
            return _Mapper.Map<PropertyOutput>(prop);
        }
    }
}
