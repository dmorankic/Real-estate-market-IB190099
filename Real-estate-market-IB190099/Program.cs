using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Services;
using Real_estate_market_IB190099.Services.Database;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<ICityService, CityService>();
builder.Services.AddTransient<IRoleService, RoleService>();



builder.Services.AddAutoMapper(typeof(ICityService));
builder.Services.AddDbContext<Ib190099Context>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
