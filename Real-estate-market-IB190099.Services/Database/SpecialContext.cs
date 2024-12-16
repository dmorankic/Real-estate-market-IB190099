using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Real_estate_market_IB190099.Services.Database;

public partial class SpecialContext : Ib190099Context
{
    public SpecialContext()
    {
    }

    public SpecialContext(DbContextOptions<Ib190099Context> options)
        : base(options)
    {
    }

    public override DbSet<Payment> Payments { get; set; }

    //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    //{
    //    if (!optionsBuilder.IsConfigured)
    //    {
    //        optionsBuilder.UseSqlServer("Data Source=localhost, 1434;Initial Catalog=IB190099; user=sa; Password=QWEdsa132!; TrustServerCertificate=True");
    //    }
    //}

}
