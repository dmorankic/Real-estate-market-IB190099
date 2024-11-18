using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Real_estate_market_IB190099.Services.Migrations
{
    /// <inheritdoc />
    public partial class sponsored : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Sponsored",
                table: "Advertise",
                type: "bit",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Sponsored",
                table: "Advertise");
        }
    }
}
