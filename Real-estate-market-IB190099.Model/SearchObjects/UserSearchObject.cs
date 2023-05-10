using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.SearchObjects
{
    public class UserSearchObject : BaseSearchObject
    {
        public string FirstName { get; set; }
        public DateTime? DateRegistered { get; set; }
    }
}
