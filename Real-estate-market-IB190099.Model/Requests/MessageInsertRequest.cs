using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class MessageInsertRequest
    {
        [Required]
        [MinLength(1)]
        public string Content { get; set; }
        [Required]
        public int SenderId { get; set; }
        [Required]
        public DateTime Timestamp { get; set; }
        [Required]
        public byte? IsEmployee { get; set; }

        public int AdvertiseId { get; set; }


    }
}
