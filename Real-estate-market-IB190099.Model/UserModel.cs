using System;
using System.Collections.Generic;
using System.Data;
using System.Text;


namespace Real_estate_market_IB190099.Model
{
    public class UserModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string Username { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime DateRegistered { get; set; }
        public string Gender { get; set; }
        public int? RoleId { get; set; }
        public virtual RoleModel Role { get; set; }
        public virtual AddressModel Address { get; set; }
        public virtual ICollection<int> SavedAdvertisesIds  { get; set; } = new List<int>();

    }
}
