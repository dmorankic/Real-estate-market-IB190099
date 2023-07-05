using FluentValidation;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.Validators
{
    public class UserUpdateFluentValidator : AbstractValidator<User>
    {
        public UserUpdateFluentValidator()
        {
            RuleFor(d => d.FirstName)
                .Length(1, 15);
            RuleFor(d => d.LastName)
                .Length(1, 15);
            RuleFor(d => d.Email)
                .EmailAddress(FluentValidation.Validators.EmailValidationMode.Net4xRegex);
            RuleFor(d => d.DateOfBirth)
                .NotEmpty();
            RuleFor(d => d.DateRegistered)
                .NotEmpty();
            RuleFor(d => d.Phone)
                .Matches(@"^\d{3}\s\d{8,9}$");
            RuleFor(d=>d.Username)
                .Length(1, 15);
            RuleFor(d => d.Gender)
                .Matches($"^(?:Fem|M)ale$");
        }
    }
}
