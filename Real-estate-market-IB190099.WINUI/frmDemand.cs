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
    public partial class frmDemand : Form
    {
        public APIService adService { get; set; } = new APIService("DemandAdvertise");
        List<DemandAdvertiseModel> ads = null;
        public bool dateSelected { get; set; } = false;
        public frmDemand()
        {
            InitializeComponent();
            dgvDemand.AutoGenerateColumns = false;
        }

        private async void frmDemand_Load(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            await loadAds();
            customizeDgvAds();
        }


        private async Task<List<DemandAdvertiseModel>> loadAds()
        {
            var list = await adService.Get<List<DemandAdvertiseModel>>("Status=approved");
            ads = list;
            dgvDemand.DataSource = list;
            return list;
        }

        private void customizeDgvAds()
        {

            if (dgvDemand.ColumnCount == 3)
            {
                DataGridViewButtonColumn btnDetails = new DataGridViewButtonColumn();
                btnDetails.HeaderText = "Action";

                dgvDemand.Columns.Add(btnDetails);

            }

            foreach (DataGridViewRow row in dgvDemand.Rows)
            {
                DataGridViewCell cell = row.Cells[3];
                cell.Value = "Details";
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
            List<DemandAdvertiseModel> filteredList = ads;
            if (!string.IsNullOrEmpty(txtFilterUsers.Text))
            {
                filteredList = filterAds(filteredList);
            }
            if (dateSelected)
            {
                filteredList = filterDate(filteredList);
            }

            dgvDemand.DataSource = filteredList;
            customizeDgvAds();
        }


        private List<DemandAdvertiseModel> filterAds(List<DemandAdvertiseModel> list)
        {
            var filtered = list.Where(x =>
             x.Location.ToLower().Contains(txtFilterUsers.Text.ToLower())).ToList();
            return filtered;
        }

        private List<DemandAdvertiseModel> filterDate(List<DemandAdvertiseModel> list)
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

        private void btnPending_Click(object sender, EventArgs e)
        {
            frmPending frm = new frmPending();
            Hide();
            frm.Show();
        }

        private void dgvDemand_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.Cancel = true;
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

        private void btnRent_Click(object sender, EventArgs e)
        {
            frmRent frm = new frmRent();
            Hide();
            frm.Show();
        }

        private void btnSale_Click(object sender, EventArgs e)
        {
            frmSale frm = new frmSale();
            Hide();
            frm.Show();
        }

        private void btnMessages_Click(object sender, EventArgs e)
        {

            frmMessages frm = new frmMessages();
            Hide();
            frm.Show();
        }

        private void dgvDemand_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                DemandAdvertiseModel selectedAd = dgvDemand.SelectedRows[0].DataBoundItem as DemandAdvertiseModel;
                frmDemandDetails details = new frmDemandDetails(selectedAd,selectedAd.Type);
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
    }
}
