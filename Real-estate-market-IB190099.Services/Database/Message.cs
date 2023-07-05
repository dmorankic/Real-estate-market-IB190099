using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Message
{
    public int Id { get; set; }

    public string Content { get; set; } = null!;

    public int? SenderId { get; set; }

    public DateTime? Timestamp { get; set; }

    public int AdvertiseId { get; set; }

    public virtual Advertise Advertise { get; set; } = null!;

    public virtual User? Sender { get; set; }
}
