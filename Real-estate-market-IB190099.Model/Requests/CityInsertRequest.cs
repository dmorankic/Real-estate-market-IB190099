using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public  class CityInsertRequest
    {
        [Required(AllowEmptyStrings =false)]
        public string ZipCode { get; set; }
        [Required(AllowEmptyStrings = false)]

        public string Name { get; set; }

    }
}
