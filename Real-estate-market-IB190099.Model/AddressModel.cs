using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class AddressModel
    {
        public string NumberStreet { get; set; }
        public virtual CityModel City { get; set; }
    }
}
