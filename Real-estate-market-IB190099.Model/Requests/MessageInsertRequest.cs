using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class MessageInsertRequest
    {
        public string Content { get; set; }
        public int SenderId { get; set; }

        public DateTime Timestamp { get; set; }
        public int AdvertiseId { get; set; }


    }
}
