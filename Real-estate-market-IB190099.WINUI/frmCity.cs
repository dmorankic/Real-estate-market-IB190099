using Real_estate_market_IB190099.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmCity : Form
    {
        public APIService cityService { get; set; } = new APIService("City");

        public frmCity()
        {
            InitializeComponent();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            var list = await cityService.Get<List<CityModel>>();

        }

        private async void button2_Click(object sender, EventArgs e)
        {
            var item = await cityService.GetById<CityModel>(Convert.ToInt32(numInput1.Value));
        }

        private async void button3_Click(object sender, EventArgs e)
        {
            var entity = await cityService.GetById<CityModel>(2);
            entity.Name = "Gracanica";
            var updatedEntity=await cityService.Put<CityModel>(entity.Id,entity);
        }
        private async void post(object sender, EventArgs e)
        {
            NameInsertRequest request = new NameInsertRequest();
            request.Name = txtCity.Text;
            var newCity = await cityService.Post<NameInsertRequest>(request);
        }

        private void frmCity_Load(object sender, EventArgs e)
        {

        }
    }
}
