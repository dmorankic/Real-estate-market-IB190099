using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Text;

namespace Real_estate_market_IB190099.Model.Requests
{
    public class UserInsertRequest
    {
        [MinLength(3)]
        [Required]
        public string FirstName { get; set; }
        [MinLength(3)]
        [Required]
        public string Username { get; set; }
        [MinLength(5)]
        [Required]
        [PasswordPropertyText]
        public string Password { get; set; }
        [MinLength(3)]
        [Required]
        public string LastName { get; set; }
        [MinLength(3)]
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        [Phone]
        [MinLength(12)]
        public string Phone { get; set; }
        [Required]
        public DateTime? DateOfBirth { get; set; }
        [Required]
        [MinLength(4)]
        [MaxLength(6)]
        public string Gender { get; set; }
        [Required]
        [MinLength(3)]
        public string NumberStreet { get; set; }
        [Required]
        [MinLength(3)]
        public string City { get; set; }
        [Required]
        [MinLength(5)]
        [MaxLength(5)]
        public string ZipCode { get; set; }
    }
}
