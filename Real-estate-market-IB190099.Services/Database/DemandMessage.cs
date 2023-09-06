using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class DemandMessage
{
    public int Id { get; set; }

    public string Content { get; set; } = null!;

    public int? SenderId { get; set; }

    public int? DemandAdvertiseId { get; set; }

    public byte? IsEmployee { get; set; }

    public DateTime? Timestamp { get; set; }

    public virtual DemandAdvertise? DemandAdvertise { get; set; }

    public virtual User? Sender { get; set; }
}
