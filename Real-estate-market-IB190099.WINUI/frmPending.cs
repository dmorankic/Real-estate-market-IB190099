using Real_estate_market_IB190099.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmPending : Form
    {
        public APIService adService { get; set; } = new APIService("Advertise");
        List<AdvertiseModel> ads = null;
        public bool dateSelected { get; set; } = false;
        public frmPending()
        {
            InitializeComponent();
            dgvAds.AutoGenerateColumns = false;        
        }

        private async void frmPending_Load(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            await loadAds();
            customizeDgvAds(ads);
        }


        private async Task<List<AdvertiseModel>> loadAds()
        {
            var list = await adService.Get<List<AdvertiseModel>>("Status=pending");
            ads = list;
            dgvAds.DataSource = list;
            return list;
        }

        private void dgvAds_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }


        private void customizeDgvAds(List<AdvertiseModel> list)
        {

            if (dgvAds.ColumnCount == 3)
            {
                DataGridViewComboBoxColumn cmbType = new DataGridViewComboBoxColumn();
                
                cmbType.ReadOnly = true;
                cmbType.HeaderText = "Section";
                cmbType.Items.Add("Rent");
                cmbType.Items.Add("Sale");
                cmbType.Items.Add("Demand");
                cmbType.Name = "cmbType";

                dgvAds.Columns.Add(cmbType);

                DataGridViewButtonColumn btnDetails = new DataGridViewButtonColumn();
                btnDetails.HeaderText = "Action";

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

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            dateSelected= true;
            dateTimePicker1.Format = DateTimePickerFormat.Long;
            dateTimePicker1.CustomFormat = null;
            filterAll();
        }

        private void txtFilterHeading_TextChanged(object sender, EventArgs e)
        {
            filterAll();
        }
        public void filterAll()
        {
        List<AdvertiseModel> filteredList = ads;
            if(!string.IsNullOrEmpty(txtFilterHeading.Text))
            {
                filteredList=filterAds(filteredList);
            }
            if (dateSelected)
            {
                filteredList = filterDate(filteredList);
            }
            if (comboBox1.SelectedIndex != 0 && comboBox1.SelectedItem!=null)
            {
                filteredList = filterSection(filteredList);
            }
            dgvAds.DataSource = filteredList;
            customizeDgvAds(filteredList);
        }
        private List<AdvertiseModel> filterAds(List<AdvertiseModel> list)
        {
            var filtered = list.Where(x =>
             x.PropName.ToLower().Contains(txtFilterHeading.Text.ToLower())).ToList();
            return filtered;
        }

        private List<AdvertiseModel> filterDate(List<AdvertiseModel> list)
        {
            list = list.Where(x => x.DateCreated.Value.Date == dateTimePicker1.Value.Date).ToList();
            return list;
        }

        private List<AdvertiseModel> filterSection(List<AdvertiseModel> list)
        {
            list=list.Where(x=>x.Type==comboBox1.SelectedItem.ToString()).ToList(); 
            return list;
        }

        private void btnResetDate_Click(object sender, EventArgs e)
        {
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            dateSelected = false;
            filterAll();    
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
           filterAll();
        }
    }
}
