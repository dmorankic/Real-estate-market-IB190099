using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model
{
    public class ImageModel
    {
        public int Id { get; set; }

        public string ImageUrl { get; set; }

        public int? PropertyId { get; set; }

        //public virtual PropertyOutput Property { get; set; }
    }
}
