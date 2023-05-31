using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class AdvertiseInsertRequest
    {
        public string Status { get; set; }
        public string Type { get; set; }
        public int PropertyId { get; set; }
        public int UserId { get; set; }
    }
}
