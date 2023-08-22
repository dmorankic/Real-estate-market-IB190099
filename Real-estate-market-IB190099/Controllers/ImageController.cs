using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.Services;
using Microsoft.Identity.Client;

namespace Real_estate_market_IB190099.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ImageController : BaseCRUDController<Image, BaseSearchObject, ImageUpsertRequest, ImageUpsertRequest>
    {
        private readonly IImageService _imageService;
        public ImageController(IImageService service) : base(service)
        {
            _imageService= service;
        }
        [HttpPost]
        [Route("UploadImage")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            return await _imageService.UploadImage(file);
        }
    }
}
