using Microsoft.ML.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class RatingMLModel
    {
        [KeyType(count: 2)]
        public uint PropertyId { get; set; }
        [KeyType(count:25)]
        public uint UserId { get; set; }
        public float Rating { get; set; }
    }
}
