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

    public virtual DbSet<Address> Addresses { get; set; }

    public virtual DbSet<Advertise> Advertises { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Location> Locations { get; set; }

    public virtual DbSet<Message> Messages { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<Rating> Ratings { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<SavedAdvertise> SavedAdvertises { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost, 1435;Initial Catalog=IB190099; user=sa; Password=QWEasd123!; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Address>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Address__3214EC070442A09C");

            entity.ToTable("Address");

            entity.Property(e => e.NumberStreet)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.City).WithMany(p => p.Addresses)
                .HasForeignKey(d => d.CityId)
                .HasConstraintName("FK_AddressCity");
        });

        modelBuilder.Entity<Advertise>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Advertis__3214EC0784B5E11B");

            entity.ToTable("Advertise");

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

            entity.HasOne(d => d.User).WithMany(p => p.Advertises)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_AdvertiseUsers");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__City__3214EC07461DB070");

            entity.ToTable("City");

            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ZipCode)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Location>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Location__3214EC07328F495E");

            entity.ToTable("Location");
        });

        modelBuilder.Entity<Message>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Message__3214EC0771273B95");

            entity.ToTable("Message");

            entity.Property(e => e.Content)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Timestamp).HasColumnType("datetime");

            entity.HasOne(d => d.Advertise).WithMany(p => p.Messages)
                .HasForeignKey(d => d.AdvertiseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Message_Advertise");

            entity.HasOne(d => d.Sender).WithMany(p => p.Messages)
                .HasForeignKey(d => d.SenderId)
                .HasConstraintName("FK_MessageSender");
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Property__3214EC076C938934");

            entity.ToTable("Property");

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

            entity.HasOne(d => d.Location).WithMany(p => p.Properties)
                .HasForeignKey(d => d.LocationId)
                .HasConstraintName("FK_Property_Location");
        });

        modelBuilder.Entity<Rating>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Rating__3214EC071832FC3F");

            entity.ToTable("Rating");

            entity.Property(e => e.Rating1).HasColumnName("Rating");

            entity.HasOne(d => d.Property).WithMany(p => p.Ratings)
                .HasForeignKey(d => d.PropertyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Rating_Property");

            entity.HasOne(d => d.User).WithMany(p => p.Ratings)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Rating_User");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Role__3214EC076DADDD58");

            entity.ToTable("Role");

            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SavedAdvertise>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__SavedAdv__3214EC07B6276BA3");

            entity.ToTable("SavedAdvertise");

            entity.HasOne(d => d.Advertise).WithMany(p => p.SavedAdvertises)
                .HasForeignKey(d => d.AdvertiseId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SavedAdvertise_Advertise");

            entity.HasOne(d => d.User).WithMany(p => p.SavedAdvertises)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SavedAdvertise_User");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Users__3214EC077C23D008");

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
            entity.Property(e => e.PasswordHash)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.PasswordSalt)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Phone)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Address).WithMany(p => p.Users)
                .HasForeignKey(d => d.AddressId)
                .HasConstraintName("FK_Users_Address");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Users_Role");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
