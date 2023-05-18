using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class SavedAdvertise
{
    public int Id { get; set; }

    public int AdvertiseId { get; set; }

    public int UserId { get; set; }

    public virtual Advertise Advertise { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
