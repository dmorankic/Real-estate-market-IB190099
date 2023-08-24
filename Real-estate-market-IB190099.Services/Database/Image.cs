using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Image
{
    public int Id { get; set; }

    public string? ImageUrl { get; set; }

    public int? PropertyId { get; set; }

    public virtual Property? Property { get; set; }
}
