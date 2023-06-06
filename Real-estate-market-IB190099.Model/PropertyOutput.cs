using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class PropertyOutput
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public int? Floors { get; set; }

        public string PropertyType { get; set; }

        public int? Rooms { get; set; }

        public string YearOfConstruction { get; set; }

        public byte? Parking { get; set; }

        public byte? Water { get; set; }

        public byte? Electricity { get; set; }

        public int? Price { get; set; }

        public int? AddressId { get; set; }

        public double? Quadrature { get; set; }

        public int? LocationId { get; set; }

        //public virtual Address Address { get; set; }
    }
}
