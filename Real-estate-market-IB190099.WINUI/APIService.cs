﻿using Flurl.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.WINUI
{
    public class APIService
    {
        public string _url = "https://localhost:44306/";
        public string _resource = null;
        public static string username = null;
        public static string password = null;

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
            var result = await $"{_url}{_resource}/{id}".WithBasicAuth(username, password).PutJsonAsync(request).ReceiveJson<T>();

            return result;
        }

    }
}