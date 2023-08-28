using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;


namespace Real_estate_market_IB190099.Model
{
    public class AdvertiseModel
    {
        public int Id { get; set; }

        public string Status { get; set; }

        public string Type { get; set; }

        public int? PropertyId { get; set; }

        public int? UserId { get; set; }
        public virtual UserModel User { get; set; }

        public DateTime? DateCreated { get; set; }

        public virtual PropertyOutput Property { get; set; }

        public virtual ICollection<ImageModel> Images  { get; set; }=new List<ImageModel>();


    }
}
