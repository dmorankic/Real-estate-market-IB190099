using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class User
{
    public int Id { get; set; }

    public string? FirstName { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? LastName { get; set; }

    public string? Email { get; set; }

    public string? Phone { get; set; }

    public DateTime? DateOfBirth { get; set; }

    public DateTime? DateRegistered { get; set; }

    public string? Gender { get; set; }

    public int? RoleId { get; set; }

    public virtual ICollection<Advertise> AdvertiseSavedUsers { get; set; } = new List<Advertise>();

    public virtual ICollection<Advertise> AdvertiseUsers { get; set; } = new List<Advertise>();

    public virtual ICollection<Message> MessageRecievers { get; set; } = new List<Message>();

    public virtual ICollection<Message> MessageSenders { get; set; } = new List<Message>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Role? Role { get; set; }
}
