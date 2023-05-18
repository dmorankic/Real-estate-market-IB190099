using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Location
{
    public int Id { get; set; }

    public double Latitude { get; set; }

    public double Longitude { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
