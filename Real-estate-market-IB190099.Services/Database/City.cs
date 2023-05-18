using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class City
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? ZipCode { get; set; }

    public virtual ICollection<Address> Addresses { get; set; } = new List<Address>();
}
