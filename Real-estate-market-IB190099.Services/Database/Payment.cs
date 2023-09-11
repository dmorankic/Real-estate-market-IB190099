using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Payment
{
    public int Id { get; set; }

    public double Amount { get; set; }

    public int? UserId { get; set; }

    public DateTime? TransactionDate { get; set; }

    public int? AdvertiseId { get; set; }

    public int? EmployeeId { get; set; }

    public virtual Advertise? Advertise { get; set; }

    public virtual User? Employee { get; set; }

    public virtual User? User { get; set; }
}
