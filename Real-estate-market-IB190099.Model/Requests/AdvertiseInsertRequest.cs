using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class AdvertiseInsertRequest
    {
        public string Status { get; set; }
        public string Type { get; set; }
       // public PropertyInputRequest Property { get; set; }
        public int UserId { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public int Floors { get; set; }

        public string PropertyType { get; set; }

        public int? Rooms { get; set; }

        public int? YearOfConstruction { get; set; }

        public byte? Parking { get; set; }

        public byte? Water { get; set; }

        public byte? Electricity { get; set; }

        public int? Price { get; set; }

        // public int? AddressId { get; set; }

        public double? Quadrature { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }


        //public int? LocationId { get; set; }

        //public virtual Address? Address { get; set; }

        //public virtual ICollection<Advertise> Advertises { get; set; } = new List<Advertise>();

        public virtual ICollection<int> Images { get; set; } = new List<int>();
        public string CitytName { get; set; }

        public string NumberStreet { get; set; }

        public int ZipCode { get; set; }
    }
}
