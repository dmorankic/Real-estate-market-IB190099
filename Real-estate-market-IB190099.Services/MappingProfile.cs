using AutoMapper;
using Real_estate_market_IB190099.Model;
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
            CreateMap<NameInsertRequest, City>();
            CreateMap<NameInsertRequest, Database.Role>();
            CreateMap<NameUpsertRequest, City>();
            CreateMap<NameUpsertRequest, Database.Role>();
            CreateMap<Database.Role,RoleModel>();
            CreateMap<UserInsertRequest, Database.User>();
            CreateMap<UserUpdateRequest, Database.User>();
            CreateMap<Database.User, UserModel>();
            CreateMap<Database.Address, AddressModel>();
            CreateMap<Database.City, CityModel>();
            CreateMap<AddressInsertRequest, Database.Address>();
            CreateMap<Database.Address, Database.Address>();
            CreateMap<CityInsertRequest, City>();
            CreateMap<UserModel, UserUpdateRequest>();
            CreateMap<AdvertiseInsertRequest, Advertise>();




        }
    }
}
