using System;
using System.Collections.Generic;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class UserInsertRequest
    {
        public string FirstName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string Gender { get; set; }
    }
}
