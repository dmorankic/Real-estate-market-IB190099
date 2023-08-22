using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Real_estate_market_IB190099.Services.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Real_estate_market_IB190099.Services
{
    public interface IImageService : ICRUDService<Image, BaseSearchObject, ImageUpsertRequest, ImageUpsertRequest>
    {
        Task<IActionResult> UploadImage(IFormFile file);

    }
}
