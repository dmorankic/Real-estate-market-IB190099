using AutoMapper;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class AddressService : BaseCRUDService<Address, Address, BaseSearchObject, AddressInsertRequest, AddressInsertRequest>,
        IAddressService
    {
        public ICityService _cityService;
        public AddressService(Ib190099Context Context, IMapper Mapper,
            ICityService cityService) : base(Context, Mapper)
        {
            _cityService= cityService;
        }
        public override void BeforeInsert(AddressInsertRequest insert, Address entity)
        {
            var context=new ValidationContext(insert,serviceProvider:null,items:null);
            var results=new List<ValidationResult>();
            var validationResult= Validator.TryValidateObject(insert, context, results, true);

            if(validationResult)
            {
                var city = Context.Cities.FirstOrDefault(x => x.Name == insert.CityName
                || x.ZipCode == insert.ZipCode);
                if (city != null)
                {
                    if (!(city.Name == insert.CityName && city.ZipCode == insert.ZipCode))
                    {
                        throw new UserException("City or zip code provided already exists");
                    }
                }
                if (city == null)
                {
                    city = _cityService
                      .Insert(
                       new CityInsertRequest()
                       {
                           Name = insert.CityName,
                           ZipCode = insert.ZipCode
                       }
                       );
                }
                entity.CityId = city.Id;
                base.BeforeInsert(insert, entity);
            } else
            {
               
                throw new UserException(results[0].ErrorMessage);
            }
                

        }

  
    }
}
