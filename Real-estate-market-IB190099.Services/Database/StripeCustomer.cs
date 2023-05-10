using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class StripeCustomer
{
    public string? Name { get; set; }

    public string? Email { get; set; }

    public int CustomerId { get; set; }

    public virtual ICollection<AddStripePayment> AddStripePayments { get; set; } = new List<AddStripePayment>();

    public virtual ICollection<StripePayment> StripePayments { get; set; } = new List<StripePayment>();
}
