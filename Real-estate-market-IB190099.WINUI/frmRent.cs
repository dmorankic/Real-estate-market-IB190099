using Real_estate_market_IB190099.Model;


namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmRent : Form
    {

        public APIService adService { get; set; } = new APIService("Advertise");
        List<AdvertiseModel> ads = null;
        public bool dateSelected { get; set; } = false;
        public frmRent()
        {
            InitializeComponent();
            dgvRent.AutoGenerateColumns = false;

        }

        private async void frmRent_Load(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            await loadAds();
            customizeDgvAds();
        }

        private void customizeDgvAds()
        {

            if (dgvRent.ColumnCount ==4)
            {    
                DataGridViewButtonColumn btnDetails = new DataGridViewButtonColumn();
                btnDetails.HeaderText = "Action";
                btnDetails.AutoSizeMode= DataGridViewAutoSizeColumnMode.Fill;

                dgvRent.Columns.Add(btnDetails);
                foreach (DataGridViewRow row in dgvRent.Rows)
                {
                    AdvertiseModel obj = row.DataBoundItem as AdvertiseModel;
                    obj.Price = $"${obj.Price} per month";
                }
            }

            foreach (DataGridViewRow row in dgvRent.Rows)
            {
                DataGridViewCell cell = row.Cells[4];
                cell.Value = "Details";           
            }
        }


        private async Task<List<AdvertiseModel>> loadAds()
        {
            var list = await adService.Get<List<AdvertiseModel>>("Type=rent&Status=approved");
            ads = list;
            dgvRent.DataSource = list;
            return list;
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
           
            dgvRent.DataSource = filteredList;
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

        private void btnResetDate_Click(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            dateSelected = false;
            filterAll();
        }

        private void txtFilterUsers_TextChanged(object sender, EventArgs e)
        {
            filterAll();
        }

        private void dgvRent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 4)
            {
                AdvertiseModel selectedAd = dgvRent.SelectedRows[0].DataBoundItem as AdvertiseModel;
                frmAdDetails details = new frmAdDetails(selectedAd,"Rent");
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

        private void dgvRent_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.Cancel = true;
        }

        private void btnStatistics_Click(object sender, EventArgs e)
        {
            Hide();
            frmStatistics frm = new frmStatistics();
            frm.Show();
        }

        private void btnUsers_Click(object sender, EventArgs e)
        {
            Hide();
            frmUsers frm = new frmUsers();
            frm.Show();
        }

        private void btnDemand_Click(object sender, EventArgs e)
        {
            Hide();
            frmDemand frm = new frmDemand();
            frm.Show();
        }

        private void btnSale_Click(object sender, EventArgs e)
        {
            Hide();
            frmSale frm = new frmSale();
            frm.Show();
        }

        private void btnPending_Click(object sender, EventArgs e)
        {
            Hide();
            frmPending frm = new frmPending();
            frm.Show();
        }

        private void btnMessages_Click(object sender, EventArgs e)
        {
            Hide();
            frmMessages frm = new frmMessages();
            frm.Show();
        }

        private void btnMyprofile_Click(object sender, EventArgs e)
        {
            frmUserUpsert frm = new frmUserUpsert(APIService.loggedUser, true);
            frm.ShowDialog();
        }
    }
}
