using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class UserService : BaseCRUDService<Database.User, Model.UserModel, UserSearchObject, UserInsertRequest, UserUpdateRequest>, IUserService
    {
        public IAddressService _AddresService;
        Ib190099Context _context;
        public UserService(Ib190099Context Context, IMapper Mapper,
            IAddressService AddresService) : base(Context, Mapper)
        {
            _AddresService= AddresService;
            _context= Context;
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
            entity.DateRegistered = DateTime.Now;
            var salt = GenerateSalt();
            entity.PasswordSalt = salt;
            entity.PasswordHash = GenerateHash(salt, insert.Password);
            var address = Context.Addresses
                .FirstOrDefault(x => x.NumberStreet == insert.NumberStreet &&
                x.City.ZipCode==insert.ZipCode && x.City.Name==insert.City);
            if (address == null) 
            {
                address = _AddresService
                  .Insert(
                   new AddressInsertRequest()
                   {
                       CityName = insert.City,
                       NumberStreet = insert.NumberStreet,
                       ZipCode = insert.ZipCode
                   });
            }
            entity.AddressId = address.Id;

            base.BeforeInsert(insert, entity);
        }


        public override UserModel Update(int id, UserUpdateRequest update)
        {
            var user=Context.Users.Include(x=>x.Address.City).FirstOrDefault(x => x.Id == id);
            if (user == null)
            {
                return null;
            }
            var address = Context.Addresses.FirstOrDefault(x => x.NumberStreet == update.NumberStreet &&
               x.City.ZipCode == update.ZipCode && x.City.Name==update.CitytName);

            if (address == null)
            {
                address = _AddresService
                  .Insert(
                   new AddressInsertRequest()
                   {
                       CityName = update.CitytName,
                       NumberStreet = update.NumberStreet,
                       ZipCode = update.ZipCode
                   } );
            }
            user.AddressId = address.Id;

            return base.Update(id, update);
        }
        public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);


            return Convert.ToBase64String(byteArray);
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
        public override IQueryable<User> AddInclude(IQueryable<User> query, UserSearchObject search = null)
        {
            query=query.Include(x => x.Role)
                .Include(x=>x.Address)
                .Include(x => x.Address.City)
                ;

            return query;
        }

        public UserModel UpdateUserPatchAsync(int id, Microsoft.AspNetCore.JsonPatch.JsonPatchDocument<User> user)
        {

            var userQuery = _context.Users.Include(x=>x.Address.City).FirstOrDefault(x => x.Id == id);
            if (userQuery == null)
            {
                return Mapper.Map<UserModel>(userQuery);
            }

            user.ApplyTo(userQuery);
            Context.SaveChanges();

            return Mapper.Map<UserModel>(userQuery);
        }
        //public override void BeforeUpdate(UserUpdateRequest update, User entity)
        //{
        //    entity.Address = entity.Address;
        //    entity.Address.City=entity.Address.City;
        //    base.BeforeUpdate(update, entity);
        //}
        public override UserModel GetById(int id)
        {

            var user = _context.Users.Include(x => x.Address.City).FirstOrDefault(x => x.Id == id);
            return Mapper.Map<UserModel>(user);

        }
        public override IEnumerable<UserModel> Get(UserSearchObject search = null)
        {

            var query = Context.Users.Include(x=>x.Address).Include(x=>x.Address.City).ToList();
            var mappedQuery=Mapper.Map<List<UserModel>>(query);
            var savedAds = Context.SavedAdvertises.Include(x=>x.Advertise).ToList();
            for(int i=0; i<mappedQuery.Count;i++)
            {
                savedAds.ForEach(x => {
                    if (x.UserId == mappedQuery[i].Id)
                    {
                        mappedQuery[i].SavedAdvertisesIds.Add(x.Advertise.Id);
                    }
                });
                
            }
            return mappedQuery;
        }
    }
}
