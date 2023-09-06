using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class SavedDemandAdvertise
{
    public int Id { get; set; }

    public int DemandAdvertiseId { get; set; }

    public int UserId { get; set; }

    public virtual DemandAdvertise DemandAdvertise { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
