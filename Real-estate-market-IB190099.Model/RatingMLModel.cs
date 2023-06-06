using Microsoft.ML.Data;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class RatingMLModel
    {
        [ColumnName(@"PropertyId")]
        [KeyType(count: 13)]
        public uint PropertyId { get; set; }
        [ColumnName(@"CorrelatedPropertyId")]

        [KeyType(count: 13)]
        public uint CorrelatedPropertyId { get; set; }
        [ColumnName(@"Rating1")]
        public float Rating1 { get; set; }
    }
}
