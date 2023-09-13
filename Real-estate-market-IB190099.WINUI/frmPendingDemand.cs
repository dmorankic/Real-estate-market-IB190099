using Real_estate_market_IB190099.Model;
using System.Data;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmPendingDemand : Form
    {
        public APIService adService { get; set; } = new APIService("DemandAdvertise");
        List<DemandAdvertiseModel> ads = null;
        public bool dateSelected { get; set; } = false;
        public frmPendingDemand()
        {
            InitializeComponent();
            dgvAds.AutoGenerateColumns = false;

        }

        private async void frmPendingDemand_Load(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            await loadAds();
            customizeDgvAds(ads);
        }

        private async Task<List<DemandAdvertiseModel>> loadAds()
        {
            var list = await adService.Get<List<DemandAdvertiseModel>>("Status=pending");
            ads = list;
            dgvAds.DataSource = list;
            return list;
        }

        private void customizeDgvAds(List<DemandAdvertiseModel> list)
        {

            if (dgvAds.ColumnCount == 3)
            {
                DataGridViewComboBoxColumn cmbType = new DataGridViewComboBoxColumn();

                cmbType.ReadOnly = true;
                cmbType.HeaderText = "Section";
                cmbType.Items.Add("Rent");
                cmbType.Items.Add("Buy");
                cmbType.Name = "cmbType";

                dgvAds.Columns.Add(cmbType);

                DataGridViewButtonColumn btnDetails = new DataGridViewButtonColumn();
                btnDetails.HeaderText = "Action";
                btnDetails.AutoSizeMode=DataGridViewAutoSizeColumnMode.Fill;
                dgvAds.Columns.Add(btnDetails);

            }


            for (int i = 0; i < dgvAds.RowCount; i++)
            {
                DataGridViewComboBoxCell cell = dgvAds.Rows[i].Cells[3] as DataGridViewComboBoxCell;
                cell.Value = list[i].Type;
            }



            foreach (DataGridViewRow row in dgvAds.Rows)
            {
                DataGridViewCell cell = row.Cells[4];
                cell.Value = "Details";
            }
        }

        private void dgvAds_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                DemandAdvertiseModel selectedAd = dgvAds.SelectedRows[0].DataBoundItem as DemandAdvertiseModel;
                frmDemandDetails details = new frmDemandDetails(selectedAd, "",pendingDetails: $"Pending ad request for demand {selectedAd.Type} section");
                details.FormClosed += detailsClose;
                details.ShowDialog();
            }
        }
        private async void detailsClose(object? sender, FormClosedEventArgs e)
        {
            await loadAds();
            customizeDgvAds(filterAll());
        }

        public List<DemandAdvertiseModel> filterAll()
        {
            List<DemandAdvertiseModel> filteredList = ads;
            if (!string.IsNullOrEmpty(txtFilterHeading.Text))
            {
                filteredList = filterAds(filteredList);
            }
            if (dateSelected)
            {
                filteredList = filterDate(filteredList);
            }
            if (comboBox1.SelectedIndex != 0 && comboBox1.SelectedItem != null)
            {
                filteredList = filterSection(filteredList);
            }
            dgvAds.DataSource = filteredList;
            customizeDgvAds(filteredList);
            return filteredList;
        }


        private List<DemandAdvertiseModel> filterAds(List<DemandAdvertiseModel> list)
        {
            var filtered = list.Where(x =>
             x.Location.ToLower().Contains(txtFilterHeading.Text.ToLower())).ToList();
            return filtered;
        }

        private List<DemandAdvertiseModel> filterDate(List<DemandAdvertiseModel> list)
        {
            list = list.Where(x => x.DateCreated.Value.Date == dateTimePicker1.Value.Date).ToList();
            return list;
        }

        private List<DemandAdvertiseModel> filterSection(List<DemandAdvertiseModel> list)
        {
            list = list.Where(x => x.Type.ToLower() == comboBox1.SelectedItem.ToString().ToLower()).ToList();
            return list;
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            dateSelected = true;
            dateTimePicker1.Format = DateTimePickerFormat.Long;
            dateTimePicker1.CustomFormat = null;
            filterAll();
        }

        private void txtFilterHeading_TextChanged(object sender, EventArgs e)
        {
            filterAll();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            filterAll();
        }

        private void dgvAds_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.Cancel = true;

        }
    }
}
