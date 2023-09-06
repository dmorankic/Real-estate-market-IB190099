using FluentValidation;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.Validators
{
    public class DemandAdvertiseUpdateFluentValidator : AbstractValidator<DemandAdvertise>
    {
        public DemandAdvertiseUpdateFluentValidator()
        {
            var conditions = new List<string>() { "pending", "approved"};
            RuleFor(x => x.Status)
              .Must(x => conditions.Contains(x))
              .WithMessage("You entered invalid value for status, allowed values are : " + String.Join(",", conditions));
        }
    }
}
