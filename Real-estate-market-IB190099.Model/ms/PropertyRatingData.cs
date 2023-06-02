using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.ML.Data;


namespace Real_estate_market_IB190099.Model.ms
{
    public class PropertyRating
    {
        [LoadColumn(0)]
        public float UserId;
        [LoadColumn(1)]
        public float PropertyId;
        [LoadColumn(2)]
        public float Label;
    }

    public class PropertyRatingPrediction
    {
        public float Label;
        public float Score;
    }
}
