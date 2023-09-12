using Microsoft.ML.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class PropertyRating
    {

        [KeyType(count: 4123)]
        public uint userId { get; set; }
        [KeyType(count: 4123)]
        public uint propertyId { get; set; }
        public float Label { get; set; }
    }
}
