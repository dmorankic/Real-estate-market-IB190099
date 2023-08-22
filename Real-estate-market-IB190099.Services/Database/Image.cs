using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Image
{
    public int Id { get; set; }

    public DateTime? Date { get; set; }

    public byte[]? Image1 { get; set; }
}
