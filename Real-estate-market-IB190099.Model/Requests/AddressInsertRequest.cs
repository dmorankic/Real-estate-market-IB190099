using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;
namespace Real_estate_market_IB190099.Model.Requests
{
    public class AddressInsertRequest
    {
        [Required(AllowEmptyStrings =false)]
        public string NumberStreet { get; set; }
        [Required(AllowEmptyStrings = false)]
        public string ZipCode { get; set; }
        [Required(AllowEmptyStrings = false)]
        public string CityName { get; set; }

    }
}
