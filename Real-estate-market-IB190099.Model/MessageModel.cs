using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class MessageModel
    {
        public int Id { get; set; }
        public string Content { get; set; }
  
        public UserModel Sender { get; set; }
        public int SenderId { get; set; }
        public DateTime? Timestamp { get; set; }
        public int AdvertiseId { get; set; }
        public virtual AdvertiseModel Advertise { get; set; } 

    }
}
