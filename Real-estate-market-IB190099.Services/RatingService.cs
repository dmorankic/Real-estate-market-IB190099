﻿using AutoMapper;
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
    public class RatingService : BaseCRUDService<Rating, RatingModel, NameSearchObject, RatingUpsertRequest, RatingUpsertRequest>
        , IRatingService
    {
        public RatingService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
        }
    }
}
