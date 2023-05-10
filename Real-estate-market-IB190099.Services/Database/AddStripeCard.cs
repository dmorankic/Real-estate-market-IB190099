using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class AddStripeCard
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public string? CardNumber { get; set; }

    public string? ExpirationYear { get; set; }

    public string? ExpirationMonth { get; set; }

    public string? Cvc { get; set; }

    public virtual ICollection<AddStripeCustomer> AddStripeCustomers { get; set; } = new List<AddStripeCustomer>();
}
