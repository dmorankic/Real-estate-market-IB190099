﻿using AutoMapper;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Services.Database;


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
            CreateMap<Rating, PropertyRating>();
            CreateMap<Property,PropertyOutput>();
            CreateMap<Advertise, AdvertiseModel>();
            CreateMap<SavedAdvertiseInsertRequest, SavedAdvertise>();   
            CreateMap<SavedAdvertise,SavedAdvertiseModel>();  
            CreateMap<MessageInsertRequest, Message>();
            CreateMap<Message, MessageModel>();
            CreateMap<ImageUpsertRequest, Image>();
            CreateMap<Image, ImageModel>();
            CreateMap<Location, LocationModel>();
            CreateMap<Payment, PaymentModel>();
            CreateMap<PaymentUpsertRequest, Payment>();
            CreateMap<DemandAdvertiseInsertRequest, DemandAdvertise>();
            CreateMap<DemandAdvertise, DemandAdvertiseModel>();
            CreateMap<DemandMessage, DemandMessageModel>();
            CreateMap<DemandMessageInsertRequest, DemandMessage>();
            CreateMap<SavedDemandAdvertiseInsertRequest, SavedDemandAdvertise>();
            CreateMap<SavedDemandAdvertise, SavedDemandAdvertiseModel>();
            CreateMap<RatingUpsertRequest, Rating>();
            CreateMap<Rating, RatingModel>();
        }
    }
}
