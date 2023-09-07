using Microsoft.EntityFrameworkCore.Metadata;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
using Real_estate_market_IB190099.WINUI.Properties;
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
    public partial class frmDemandDetails : Form
    {
        public DemandAdvertiseModel _advertise { get; set; }
        public List<String> arr = new List<String>() { "Buy", "Rent" };
       
        public string _url = Settings.Default.ApiURLSecondary;
        public string _mode { get; set; }
        public string _pendingDetails { get; set; }

        public APIService adService { get; set; } = new APIService("DemandAdvertise");
        public frmDemandDetails(DemandAdvertiseModel advertise, string mode = "", string pendingDetails = "")
        {
            InitializeComponent();
            _advertise = advertise;
            _mode = mode;
            _pendingDetails= pendingDetails;
            populateForm();
        }

        private void populateForm()
        {
            if (arr.Contains(_mode))
            {
                lblHeader.Text = $"Demand {_advertise.Location} details";
            }
            else
            {
                lblHeader.Text = _pendingDetails;
            }
    
            lblAddress.Text +=_advertise.Location == null ? "not provided" : _advertise.Location;
            lblDateCreated.Text += _advertise.DateCreated.ToString();
            lblUser.Text += _advertise.User.Username;
 
            lblWater.Text += _advertise.Water == 0 ? "No" : "Yes";
            lblParking.Text += _advertise.Parking == 0 ? "No" : "Yes";
            lblElectricity.Text += _advertise.Electricity == 0 ? "No" : "Yes";
            lblFloors.Text += _advertise.Floors.ToString();
      
            lblRooms.Text += _advertise.Rooms.ToString();
            lblMinQuad.Text += $"{_advertise.MinQuadrature} m²";
            lblMaxQuad.Text += $"{_advertise.MaxQuadrature} m²";

            lblType.Text += _advertise.PropertyType;
            lblDesc.Text = _advertise.Description;

            if (_advertise.Status=="pending")
            {
                btnRemove.Text = "Decline";
                btnDelete.Text = "Accept";
            }
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            Close();
        }

        private async void btnRemove_Click(object sender, EventArgs e)
        {
            if (_advertise.Status=="approved")
            {
                await changeAdStatus("pending", "Advertise removed from site, now it is in pending requests");
            }
            else
            {
                await deleteAd();
            }
        }

        private async Task<DemandAdvertiseModel> deleteAd()
        {
            try
            {
                var removed = await adService.Delete<DemandAdvertiseModel>(_advertise.Id);
                if (removed != null)
                {
                    MessageBox.Show("Advertise removed");
                }
                Close();
                return removed;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }
        }

        private async Task changeAdStatus(string newStatus, string message)
        {
            PatchObject[] updateReq = new PatchObject[]
             {
                    new PatchObject()
                    {
                        path = "/Status",
                        op = "replace",
                        value = newStatus
                    } };

            try
            {
                _advertise = await adService.Patch<DemandAdvertiseModel>(_advertise.Id, updateReq);
                if (_advertise != null)
                {
                    MessageBox.Show(message);
                }

                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void btnDelete_Click(object sender, EventArgs e)
        {
            if (_advertise.Status == "approved")
            {
                await deleteAd();
            }
            else
            {
                await changeAdStatus("approved", "Advertise approved.");
            }
        }
    }
}
