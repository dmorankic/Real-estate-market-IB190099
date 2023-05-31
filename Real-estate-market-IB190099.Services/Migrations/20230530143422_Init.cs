using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Real_estate_market_IB190099.Services.Migrations
{
    /// <inheritdoc />
    public partial class Init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "City",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    ZipCode = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__City__3214EC07461DB070", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Location",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Latitude = table.Column<double>(type: "float", nullable: false),
                    Longitude = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Location__3214EC07328F495E", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Role__3214EC076DADDD58", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Address",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NumberStreet = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    CityId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Address__3214EC070442A09C", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AddressCity",
                        column: x => x.CityId,
                        principalTable: "City",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Property",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Description = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Floors = table.Column<int>(type: "int", nullable: true),
                    PropertyType = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Rooms = table.Column<int>(type: "int", nullable: true),
                    YearOfConstruction = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Parking = table.Column<byte>(type: "tinyint", nullable: true),
                    Water = table.Column<byte>(type: "tinyint", nullable: true),
                    Electricity = table.Column<byte>(type: "tinyint", nullable: true),
                    Price = table.Column<int>(type: "int", nullable: true),
                    AddressId = table.Column<int>(type: "int", nullable: true),
                    Quadrature = table.Column<double>(type: "float", nullable: true),
                    LocationId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Property__3214EC076C938934", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PropertyAddress",
                        column: x => x.AddressId,
                        principalTable: "Address",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Property_Location",
                        column: x => x.LocationId,
                        principalTable: "Location",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    Username = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    PasswordHash = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    PasswordSalt = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    RoleId = table.Column<int>(type: "int", nullable: true),
                    LastName = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Email = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Phone = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    DateOfBirth = table.Column<DateTime>(type: "datetime", nullable: true),
                    DateRegistered = table.Column<DateTime>(type: "datetime", nullable: true),
                    Gender = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    AddressId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Users__3214EC077C23D008", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_Address",
                        column: x => x.AddressId,
                        principalTable: "Address",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Users_Role",
                        column: x => x.RoleId,
                        principalTable: "Role",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Advertise",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Status = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Type = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    PropertyId = table.Column<int>(type: "int", nullable: true),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    DateCreated = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Advertis__3214EC0784B5E11B", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AdvertiseProperty",
                        column: x => x.PropertyId,
                        principalTable: "Property",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_AdvertiseUsers",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Message",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Content = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    SenderId = table.Column<int>(type: "int", nullable: true),
                    RecieverId = table.Column<int>(type: "int", nullable: true),
                    Timestamp = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Message__3214EC0771273B95", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MessageReciever",
                        column: x => x.RecieverId,
                        principalTable: "Users",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MessageSender",
                        column: x => x.SenderId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "SavedAdvertise",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AdvertiseId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__SavedAdv__3214EC07B6276BA3", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SavedAdvertise_Advertise",
                        column: x => x.AdvertiseId,
                        principalTable: "Advertise",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_SavedAdvertise_User",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Address_CityId",
                table: "Address",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_Advertise_PropertyId",
                table: "Advertise",
                column: "PropertyId");

            migrationBuilder.CreateIndex(
                name: "IX_Advertise_UserId",
                table: "Advertise",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Message_RecieverId",
                table: "Message",
                column: "RecieverId");

            migrationBuilder.CreateIndex(
                name: "IX_Message_SenderId",
                table: "Message",
                column: "SenderId");

            migrationBuilder.CreateIndex(
                name: "IX_Property_AddressId",
                table: "Property",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Property_LocationId",
                table: "Property",
                column: "LocationId");

            migrationBuilder.CreateIndex(
                name: "IX_SavedAdvertise_AdvertiseId",
                table: "SavedAdvertise",
                column: "AdvertiseId");

            migrationBuilder.CreateIndex(
                name: "IX_SavedAdvertise_UserId",
                table: "SavedAdvertise",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_AddressId",
                table: "Users",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_RoleId",
                table: "Users",
                column: "RoleId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Message");

            migrationBuilder.DropTable(
                name: "SavedAdvertise");

            migrationBuilder.DropTable(
                name: "Advertise");

            migrationBuilder.DropTable(
                name: "Property");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "Location");

            migrationBuilder.DropTable(
                name: "Address");

            migrationBuilder.DropTable(
                name: "Role");

            migrationBuilder.DropTable(
                name: "City");
        }
    }
}
