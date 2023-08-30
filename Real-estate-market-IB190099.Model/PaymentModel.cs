﻿using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class PaymentModel
    {
        public int Id { get; set; }

        public double Amount { get; set; }

        public DateTime? TransactionDate { get; set; }
    }
}
