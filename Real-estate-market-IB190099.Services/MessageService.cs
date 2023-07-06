﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class MessageService : BaseCRUDService<Message, MessageModel, MessageSearchObject, MessageInsertRequest, MessageInsertRequest>
        , IMessageService
    {
        public MessageService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
           
        }

        public override IQueryable<Message> AddFilter(IQueryable<Message> query, MessageSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (search?.userId!=null)
            {
                filteredQuery = filteredQuery.Where(x => x.SenderId == search.userId);
            }

            return filteredQuery;
        }
        public override IQueryable<Message> AddInclude(IQueryable<Message> query, MessageSearchObject search = null)
        {
            query = query.Include(x => x.Advertise.Property).OrderByDescending(x => x.Timestamp);
            
            return base.AddInclude(query, search);
        }
    }
}