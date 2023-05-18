using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class AddressInsertRequest
    {
        public string NumberStreet { get; set; }

        public string ZipCode { get; set; }
        public string CityName { get; set; }

    }
}
