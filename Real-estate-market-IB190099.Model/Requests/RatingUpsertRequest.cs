using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class RatingUpsertRequest
    {
        public int PropertyId { get; set; }
        public int UserId { get; set; }
        public double Rating1 { get; set; }
    }
}
