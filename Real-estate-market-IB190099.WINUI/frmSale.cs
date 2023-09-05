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


                AdvertiseModel obj = row.DataBoundItem as AdvertiseModel;
                if (!obj.Price.Contains("$"))
                {
                    obj.Price = $"${obj.Price}";
                }
            }
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            dateSelected = true;
            dateTimePicker1.Format = DateTimePickerFormat.Long;
            dateTimePicker1.CustomFormat = null;
            filterAll();
        }

        public void filterAll()
        {
            List<AdvertiseModel> filteredList = ads;
            if (!string.IsNullOrEmpty(txtFilterUsers.Text))
            {
                filteredList = filterAds(filteredList);
            }
            if (dateSelected)
            {
                filteredList = filterDate(filteredList);
            }

            dgvSale.DataSource = filteredList;
            customizeDgvAds();
        }


        private List<AdvertiseModel> filterAds(List<AdvertiseModel> list)
        {
            var filtered = list.Where(x =>
             x.PropName.ToLower().Contains(txtFilterUsers.Text.ToLower())).ToList();
            return filtered;
        }

        private List<AdvertiseModel> filterDate(List<AdvertiseModel> list)
        {
            list = list.Where(x => x.DateCreated.Value.Date == dateTimePicker1.Value.Date).ToList();
            return list;
        }

        private void txtFilterUsers_TextChanged(object sender, EventArgs e)
        {
            filterAll();
        }

        private void btnResetDate_Click(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            dateSelected = false;
            filterAll();
        }

        private void dgvSale_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.Cancel= true; 
        }

        private void dgvSale_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                AdvertiseModel selectedAd = dgvSale.SelectedRows[0].DataBoundItem as AdvertiseModel;
                frmAdDetails details = new frmAdDetails(selectedAd, "Sale");
                details.FormClosed += detailsClose;
                details.ShowDialog();
            }
        }
        private async void detailsClose(object? sender, FormClosedEventArgs e)
        {
            await loadAds();
            filterAll();
            customizeDgvAds();
        }

        private void btnPending_Click(object sender, EventArgs e)
        {
            frmPending frm = new frmPending();
            Hide();
            frm.Show();
        }

        private void btnStatistics_Click(object sender, EventArgs e)
        {
            frmStatistics frm = new frmStatistics();
            Hide();
            frm.Show();
        }

        private void btnUsers_Click(object sender, EventArgs e)
        {
            frmUsers frm = new frmUsers();
            Hide();
            frm.Show();
        }

        private void btnDemand_Click(object sender, EventArgs e)
        {
            frmDemand frm = new frmDemand();
            Hide();
            frm.Show();
        }

        private void btnRent_Click(object sender, EventArgs e)
        {
            frmRent frm = new frmRent();
            Hide();
            frm.Show();
        }

        private void btnMessages_Click(object sender, EventArgs e)
        {
            frmMessages frm = new frmMessages();
            Hide();
            frm.Show();
        }
    }
}
