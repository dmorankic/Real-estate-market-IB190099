using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class DemandAdvertise
{
    public int Id { get; set; }

    public string? Status { get; set; }

    public string? Type { get; set; }

    public string? Description { get; set; }

    public double? MinQuadrature { get; set; }

    public double? MaxQuadrature { get; set; }

    public string? Location { get; set; }

    public int? Floors { get; set; }

    public string? PropertyType { get; set; }

    public int? Rooms { get; set; }

    public byte? Parking { get; set; }

    public byte? Water { get; set; }

    public byte? Electricity { get; set; }

    public int? UserId { get; set; }

    public DateTime? DateCreated { get; set; }

    public virtual ICollection<DemandMessage> DemandMessages { get; set; } = new List<DemandMessage>();

    public virtual ICollection<SavedDemandAdvertise> SavedDemandAdvertises { get; set; } = new List<SavedDemandAdvertise>();

    public virtual User? User { get; set; }
}
