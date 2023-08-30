using FluentValidation;
using Microsoft.AspNetCore.Authentication;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Real_estate_market_IB190099;
using Real_estate_market_IB190099.Filters;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Validators;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers(
    x=> x.Filters.Add<ErrorFilter>()

    )
    .AddNewtonsoftJson().AddDataAnnotationsLocalization(); 

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("basicAuth", new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.Http,
        Scheme = "basic"
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "basicAuth" }
            },
            new string[]{}
        }
    });
});



builder.Services.AddTransient<ICityService, CityService>();
builder.Services.AddTransient<IRoleService, RoleService>();
builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddTransient<IAddressService, AddressService>();
builder.Services.AddTransient<IAdvertiseService, AdvertiseService>();
builder.Services.AddTransient<IMessageService, MessageService>();
builder.Services.AddTransient<IImageService, ImageService>();
builder.Services.AddTransient<IImageWriter, ImageWriter>();
builder.Services.AddTransient<IPaymentService, PaymentService>();



builder.Services.AddTransient<IValidator<User>,UserUpdateFluentValidator>();




builder.Services.AddAutoMapper(typeof(ICityService));

builder.Services.AddAuthentication("BasicAuthentication")
    .AddScheme<AuthenticationSchemeOptions, BasicAuthenticationHandler>("BasicAuthentication", null);

builder.Services.AddDbContext<Ib190099Context>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();
app.UseStaticFiles();


if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

//using (var scope = app.Services.CreateScope())
//{
//    var dataContext = scope.ServiceProvider.GetRequiredService<Ib190099Context>();
//    dataContext.Database.Migrate();
//}

app.Run();
