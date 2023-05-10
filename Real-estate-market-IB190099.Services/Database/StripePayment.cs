using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class StripePayment
{
    public int PaymentId { get; set; }

    public int? CustomerId { get; set; }

    public string? ReceiptEmail { get; set; }

    public string? Description { get; set; }

    public string? Currency { get; set; }

    public double? Amount { get; set; }

    public virtual StripeCustomer? Customer { get; set; }
}
