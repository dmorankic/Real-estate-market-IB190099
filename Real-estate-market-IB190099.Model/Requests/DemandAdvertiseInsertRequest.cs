using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class DemandAdvertiseInsertRequest
    {
        public string Status { get; set; }
        public string Type { get; set; }
        public int UserId { get; set; }
        public string Description { get; set; }
        public int Floors { get; set; }
        public double MinQuadrature { get; set; }
                     
        public double MaxQuadrature { get; set; }
        public string Location { get; set; }
        public string PropertyType { get; set; }
        public int? Rooms { get; set; }

        public byte? Parking { get; set; }

        public byte? Water { get; set; }

        public byte? Electricity { get; set; }
        public DateTime? DateCreated { get; set; }



    }
}
