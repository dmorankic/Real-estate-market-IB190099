using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class SavedAdvertiseModel
    {
        public int Id { get; set; }

        public int AdvertiseId { get; set; }

        public int UserId { get; set; }

        public  AdvertiseModel Advertise { get; set; }

        public virtual UserModel User { get; set; }
    }
}
