﻿using System;
using System.Collections.Generic;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Message
{
    public int Id { get; set; }

    public string Content { get; set; } = null!;

    public int? SenderId { get; set; }

    public int? RecieverId { get; set; }

    public DateTime DateTime { get; set; }

    public virtual User? Reciever { get; set; }

    public virtual User? Sender { get; set; }
}