using Flurl.Http;
using Real_estate_market_IB190099.WINUI.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.WINUI
{
    public class APIService
    {
        public string _url = Settings.Default.ApiURLSecondary;
        public string _resource = null;
        public static string username ;
        public static string password;

        public APIService(string resource) 
        {
            _resource= resource;
        }

        public async Task<T> Get<T>()
        {
            var list = await $"{_url}{_resource}".WithBasicAuth(username,password).GetJsonAsync<T>();
            return list;
        }

        public async Task<T> GetById<T>(int id)
        {
            var item = await $"{_url}{_resource}/{id}".WithBasicAuth(username, password).GetJsonAsync<T>();
            return item;
        }
        public async Task<T> Post<T>(object request)
        {
            var result = await $"{_url}{_resource}".WithBasicAuth(username, password).PostJsonAsync(request).ReceiveJson<T>();

            return result;
        }
        public async Task<T> Put<T>(int id,object request)
        {
            try
            {
                var result = await $"{_url}{_resource}/{id}".WithBasicAuth(username, password).PutJsonAsync(request).ReceiveJson<T>();
                return result;
            }catch(FlurlHttpException ex)
            {
                var errors=await ex.GetResponseJsonAsync<Dictionary<string, string[]>>();
                var stringBuilder=new StringBuilder();

                foreach(var error in errors)
                {
                    stringBuilder.AppendLine($"{error.Key}, {string.Join(",",error.Value)}");
                }
                MessageBox.Show(stringBuilder.ToString(),"Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return default(T);
            }
        }
        public async Task<T> Patch<T>(int id, object request)
        {
            try
            {
                var result = await $"{_url}{_resource}/{id}".WithBasicAuth(username, password).PatchJsonAsync(request).ReceiveJson<T>();
                return result;
            }catch(FlurlHttpException ex)
            {
                var errors = await ex.GetResponseJsonAsync<Dictionary<string, string[]>>();
                var stringBuilder = new StringBuilder();

                KeyValuePair < string,string[]> error = errors.First();
                
                stringBuilder.AppendLine($"{error.Key}, {string.Join(",", error.Value)}");
                

                MessageBox.Show(stringBuilder.ToString(), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return default(T);
            }
        }

    }
}
