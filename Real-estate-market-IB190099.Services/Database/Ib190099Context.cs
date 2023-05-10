using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Real_estate_market_IB190099.Services.Database;

public partial class Ib190099Context : DbContext
{
    public Ib190099Context()
    {
    }

    public Ib190099Context(DbContextOptions<Ib190099Context> options)
        : base(options)
    {
    }

    public virtual DbSet<AddStripeCard> AddStripeCards { get; set; }

    public virtual DbSet<AddStripeCustomer> AddStripeCustomers { get; set; }

    public virtual DbSet<AddStripePayment> AddStripePayments { get; set; }

    public virtual DbSet<Address> Addresses { get; set; }

    public virtual DbSet<Advertise> Advertises { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Message> Messages { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<StripeCustomer> StripeCustomers { get; set; }

    public virtual DbSet<StripePayment> StripePayments { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost, 1435;Initial Catalog=IB190099; user=sa; Password=QWEasd123!; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AddStripeCard>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_AddStripeCard_AddStripeCardId");

            entity.ToTable("AddStripeCard");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.CardNumber)
                .HasMaxLength(19)
                .IsUnicode(false);
            entity.Property(e => e.Cvc)
                .HasMaxLength(4)
                .IsUnicode(false);
            entity.Property(e => e.ExpirationMonth)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.ExpirationYear)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AddStripeCustomer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__AddStrip__3214EC07CBB28453");

            entity.ToTable("AddStripeCustomer");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.String)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("string");

            entity.HasOne(d => d.CreditCardNavigation).WithMany(p => p.AddStripeCustomers)
                .HasForeignKey(d => d.CreditCard)
                .HasConstraintName("FK_AddStripeCustomer_AddStripeCard");
        });

        modelBuilder.Entity<AddStripePayment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__AddStrip__3214EC07D735C9D2");

            entity.ToTable("AddStripePayment");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Currency)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ReceiptEmail)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.AddStripePayments)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_AddStripePayment_AddStripeCustomer");
        });

        modelBuilder.Entity<Address>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Address__3214EC07374ED5DB");

            entity.ToTable("Address");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.NumberStreet)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ZipCode)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.City).WithMany(p => p.Addresses)
                .HasForeignKey(d => d.CityId)
                .HasConstraintName("FK_AddressCity");
        });

        modelBuilder.Entity<Advertise>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Advertis__3214EC0786D90ABA");

            entity.ToTable("Advertise");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.DateCreated).HasColumnType("datetime");
            entity.Property(e => e.Status)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Type)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Property).WithMany(p => p.Advertises)
                .HasForeignKey(d => d.PropertyId)
                .HasConstraintName("FK_AdvertiseProperty");

            entity.HasOne(d => d.SavedUser).WithMany(p => p.AdvertiseSavedUsers)
                .HasForeignKey(d => d.SavedUserId)
                .HasConstraintName("FK_AdvertiseSavedUser");

            entity.HasOne(d => d.User).WithMany(p => p.AdvertiseUsers)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_AdvertiseUsers");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__City__3214EC07F9F9A0ED");

            entity.ToTable("City");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Message>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Message__3214EC07916F381D");

            entity.ToTable("Message");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Content)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.DateTime).HasColumnType("datetime");

            entity.HasOne(d => d.Reciever).WithMany(p => p.MessageRecievers)
                .HasForeignKey(d => d.RecieverId)
                .HasConstraintName("FK_MessageReciever");

            entity.HasOne(d => d.Sender).WithMany(p => p.MessageSenders)
                .HasForeignKey(d => d.SenderId)
                .HasConstraintName("FK_MessageSender");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Payment__3214EC079C7F958F");

            entity.ToTable("Payment");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Amount).HasColumnName("amount");
            entity.Property(e => e.DateTime).HasColumnType("datetime");

            entity.HasOne(d => d.Property).WithMany(p => p.Payments)
                .HasForeignKey(d => d.PropertyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PaymentProperty");

            entity.HasOne(d => d.User).WithMany(p => p.Payments)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PaymentUser");
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Property__3214EC07D49C82FB");

            entity.ToTable("Property");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PropertyType)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.YearOfConstruction)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Address).WithMany(p => p.Properties)
                .HasForeignKey(d => d.AddressId)
                .HasConstraintName("FK_PropertyAddress");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Role__3214EC07A0C3E3A7");

            entity.ToTable("Role");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StripeCustomer>(entity =>
        {
            entity.HasKey(e => e.CustomerId).HasName("PK__StripeCu__A4AE64D8ED4B4B1D");

            entity.ToTable("StripeCustomer");

            entity.Property(e => e.CustomerId).ValueGeneratedNever();
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<StripePayment>(entity =>
        {
            entity.HasKey(e => e.PaymentId).HasName("PK__StripePa__9B556A387DA011BF");

            entity.ToTable("StripePayment");

            entity.Property(e => e.PaymentId).ValueGeneratedNever();
            entity.Property(e => e.Currency)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ReceiptEmail)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Customer).WithMany(p => p.StripePayments)
                .HasForeignKey(d => d.CustomerId)
                .HasConstraintName("FK_StripePayment_StripeCustomer");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Users__3214EC07BA8687F8");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.DateOfBirth).HasColumnType("datetime");
            entity.Property(e => e.DateRegistered).HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Gender)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_UsersRole");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
