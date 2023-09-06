using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class User
{
    public int Id { get; set; }

    public string? FirstName { get; set; }

    public string? Username { get; set; }

    public string? PasswordHash { get; set; }

    public string? PasswordSalt { get; set; }

    public int? RoleId { get; set; }

    public string? LastName { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public DateTime? DateOfBirth { get; set; }

    public DateTime? DateRegistered { get; set; }

    public string? Gender { get; set; }

    public int? AddressId { get; set; }

    public virtual Address? Address { get; set; }

    public virtual ICollection<Advertise> Advertises { get; set; } = new List<Advertise>();

    public virtual ICollection<DemandAdvertise> DemandAdvertises { get; set; } = new List<DemandAdvertise>();

    public virtual ICollection<DemandMessage> DemandMessages { get; set; } = new List<DemandMessage>();

    public virtual ICollection<Message> Messages { get; set; } = new List<Message>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();

    public virtual Role? Role { get; set; }

    public virtual ICollection<SavedAdvertise> SavedAdvertises { get; set; } = new List<SavedAdvertise>();

    public virtual ICollection<SavedDemandAdvertise> SavedDemandAdvertises { get; set; } = new List<SavedDemandAdvertise>();
}
