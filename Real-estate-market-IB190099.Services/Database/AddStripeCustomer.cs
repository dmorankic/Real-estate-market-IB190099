using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class AddStripeCustomer
{
    public int Id { get; set; }

    public string? Email { get; set; }

    public string? String { get; set; }

    public int? CreditCard { get; set; }

    public virtual AddStripeCard? CreditCardNavigation { get; set; }
}
