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
    public partial class frmSale : Form
    {
        public APIService adService { get; set; } = new APIService("Advertise");
        List<AdvertiseModel> ads = null;
        public bool dateSelected { get; set; } = false;
        public frmSale()
        {
            InitializeComponent();
            dgvSale.AutoGenerateColumns = false;

        }

        private async void frmSale_Load(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            await loadAds();
            customizeDgvAds();
        }


        private async Task<List<AdvertiseModel>> loadAds()
        {
            var list = await adService.Get<List<AdvertiseModel>>("Type=sale&Status=approved");
            ads = list;
            dgvSale.DataSource = list;
            return list;
        }

        private void customizeDgvAds()
        {

            if (dgvSale.ColumnCount == 4)
            {
                DataGridViewButtonColumn btnDetails = new DataGridViewButtonColumn();
                btnDetails.HeaderText = "Action";

                dgvSale.Columns.Add(btnDetails);
                
            }

            foreach (DataGridViewRow row in dgvSale.Rows)
            {
                DataGridViewCell cell = row.Cells[4];
                cell.Value = "Details";
            }
        }
    }
}
