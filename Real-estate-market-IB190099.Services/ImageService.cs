using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class ImageService : BaseCRUDService<Image, Image, BaseSearchObject, ImageUpsertRequest, ImageUpsertRequest>, IImageService
    {
        public IImageService _ImageService;
        private readonly IImageWriter _imageWriter;

        public ImageService(Ib190099Context Context, IMapper Mapper, IImageWriter imageWritter) : base(Context, Mapper)
        {
            _imageWriter = imageWritter;
        }

        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            var result=await _imageWriter.UploadImage(file);
            return new ObjectResult(result);
        }
    }
}
