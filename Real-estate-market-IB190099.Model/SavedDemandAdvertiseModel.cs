using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class SavedDemandAdvertiseModel
    {
        public int Id { get; set; }

        public int DemandAdvertiseId { get; set; }

        public int UserId { get; set; }

        public DemandAdvertiseModel AdvertiseDemand { get; set; }

        public virtual UserModel User { get; set; }
    }
}
