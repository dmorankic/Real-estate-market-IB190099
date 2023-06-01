using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Rating
{
    public int Id { get; set; }

    public int PropertyId { get; set; }

    public int UserId { get; set; }

    public double Rating1 { get; set; }

    public virtual Property Property { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
