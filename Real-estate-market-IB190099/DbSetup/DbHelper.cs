using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Services.Database;

namespace Real_estate_market_IB190099.DbHelper
{
    public class DbHelper
    {
        public void Init(Ib190099Context context)
        {
            context.Database.Migrate();
        }

        public void InsertData(Ib190099Context context)
        {
            var path = Path.Combine(Directory.GetCurrentDirectory(), "DbSetup", "database.sql");
            var query = File.ReadAllText(path);
            context.Database.ExecuteSqlRaw(query);
        }
    }
}
