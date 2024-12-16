using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class PaymentUpsertRequest
    {
        public PaymentUpsertRequest(double amount, int? userId, int? employeeId, int? advertiseId, DateTime? transactionDate)
        {
            Amount = amount;
            UserId = userId;
            EmployeeId = employeeId;
            AdvertiseId = advertiseId;
            TransactionDate = transactionDate;
        }

        public double Amount { get; set; }

        public int? UserId { get; set; }
        public int? EmployeeId { get; set; }

        public int? AdvertiseId { get; set; }

        public DateTime? TransactionDate { get; set; }
    }
}
