using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Real_estate_market_IB190099.Services
{
    public class ImageWriter : IImageWriter
    {
        public async Task<string> UploadImage(IFormFile file)
        {
            if (checkIfImageFile(file))
            {
                return await WriteFile(file);
            }
            return "Invalid image file";
        }

        private async Task<string> WriteFile(IFormFile file)
        {
            string fileName;
            try
            {
                var extension = new StringBuilder(".").Append(file.FileName.Split('.')[file.FileName.Split('.').Length - 1]);
                fileName = new StringBuilder(Guid.NewGuid().ToString()).Append(extension).ToString();
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\images", fileName);
                using (var bits = new FileStream(path, FileMode.Create))
                    await file.CopyToAsync(bits);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return fileName;
        }

        private bool checkIfImageFile(IFormFile file)
        {
            byte[] fileBytes;
            using (var ms = new MemoryStream())
            {
                file.CopyTo(ms);
                fileBytes = ms.ToArray();
            }
            return WriteHelper.GetImageFormat(fileBytes) != WriteHelper.ImageFormat.unknown;
        }
    }
}
