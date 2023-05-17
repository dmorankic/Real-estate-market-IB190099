using AutoMapper;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class UserService : BaseCRUDService<Database.User, Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>, IUserService
    {
        public UserService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {

        }

        public override IQueryable<Database.User> AddFilter(IQueryable<Database.User> query, UserSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.FirstName))
            {
                filteredQuery = filteredQuery.Where(x => x.FirstName == search.FirstName);
            }

            return filteredQuery;
        }
        public override void BeforeInsert(UserInsertRequest insert, User entity)
        {
            entity.RoleId = 1;
            entity.Id = Context.Users.Count() + 1;
            var salt = GenerateSalt();
            entity.PasswordSalt = salt;
            entity.PasswordHash = GenerateHash(salt, insert.Password);
            base.BeforeInsert(insert, entity);
        }
        public static string GenerateSalt()
        {
            return Convert.ToBase64String(new byte[16]);

            //var buf = new byte[16];
            //object p = (new RSACryptoServiceProvider()).GetBytes(buf);
            //return Convert.ToBase64String(buf);
        }
        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }

        public UserModel Login(string username, string password)
        {
           var entity=Context.Users.FirstOrDefault(x=>x.Username== username);
            if (entity == null)
            {
                return null;
            }
            var hash=GenerateHash(entity.PasswordSalt, password);
            if(entity.PasswordHash!=hash)
            {
                return null;
            }

            return Mapper.Map<UserModel>(entity);

        }
    }
}
