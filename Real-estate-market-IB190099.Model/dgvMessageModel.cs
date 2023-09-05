using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class dgvMessageModel
    {
        public int SenderId { get; set; }
        public int AdvertiseId { get; set; }

        public string SenderName { get; set; }
        public string PropName { get; set; }
        public DateTime? Timestamp { get; set; }
        public string Content { get; set; }


    }
}
