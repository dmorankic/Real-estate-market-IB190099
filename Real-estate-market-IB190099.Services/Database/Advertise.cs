using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Advertise
{
    public int Id { get; set; }

    public string? Status { get; set; }

    public string? Type { get; set; }

    public int? PropertyId { get; set; }

    public int? UserId { get; set; }

    public DateTime? DateCreated { get; set; }

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual Property? Property { get; set; }

    public virtual ICollection<SavedAdvertise> SavedAdvertises { get; set; } = new List<SavedAdvertise>();

    public virtual User? User { get; set; }
}
