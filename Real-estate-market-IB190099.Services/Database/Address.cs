using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Address
{
    public int Id { get; set; }

    public string? NumberStreet { get; set; }

    public string? ZipCode { get; set; }

    public int? CityId { get; set; }

    public virtual City? City { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
