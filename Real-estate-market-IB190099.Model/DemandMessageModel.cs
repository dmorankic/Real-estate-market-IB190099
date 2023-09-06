using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class DemandMessageModel
    {
        public int Id { get; set; }
        public string Content { get; set; }
  
        public UserModel Sender { get; set; }
        public int SenderId { get; set; }
        public DateTime? Timestamp { get; set; }
        public byte? IsEmployee { get; set; }
        public int DemandAdvertiseId { get; set; }
        public virtual DemandAdvertiseModel DemandAdvertise { get; set; } 

    }
}
