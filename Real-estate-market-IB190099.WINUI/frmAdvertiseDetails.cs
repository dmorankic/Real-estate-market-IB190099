using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
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
    public partial class frmAdDetails : Form
    {
        public AdvertiseModel _advertise { get; set; }
        public List<String> arr =new List<String>() {"Sale" ,"Rent"};
        public int imgIndex { get; set; } = 0;
        public string _url = Settings.Default.ApiURLSecondary;
        public string _mode { get; set; }
        public string _pendingDetails { get; set; }

        public APIService adService { get; set; } = new APIService("Advertise");

        public frmAdDetails(AdvertiseModel advertise,string mode="",string pendingDetails="")
        {
            InitializeComponent();
            _advertise = advertise;
            _mode = mode;
            _pendingDetails= pendingDetails;
            populateForm();
        }

        private void populateForm()
        {
            if(arr.Contains(_mode))
            {
                lblCaption.Text = $"{_mode} details";
            }else
            {
                lblCaption.Text = _pendingDetails;
            }

            lblHeading.Text = _advertise.PropName;
            lblAddress.Text +=_advertise.Property.Address ==null? "not provided": _advertise.Property.Address.NumberStreet + ", " + _advertise.Property.Address.City.Name;
            lblDateCreated.Text += _advertise.DateCreated.ToString();
            lblUser.Text += _advertise.User.Username;
            lblYearConst.Text += _advertise.Property.YearOfConstruction.ToString();
            lblWater.Text += _advertise.Property.Water==0? "No":"Yes";
            lblParking.Text += _advertise.Property.Parking == 0 ? "No" : "Yes";
            lblElectricity.Text += _advertise.Property.Electricity == 0 ? "No" : "Yes";
            lblFloors.Text += _advertise.Property.Floors.ToString();
            lblPrice.Text+= $"$ {_advertise.Property.Price}";
            if (_mode == "Rent")
            {
                lblPrice.Text += " per month";
            }
            lblRooms.Text += _advertise.Property.Rooms.ToString();
            lblQuad.Text += $"{ _advertise.Property.Quadrature} m²";
            lblType.Text += _advertise.Property.PropertyType;
            lblDesc.Text = _advertise.Property.Description;
            if(_advertise.Property.Images!= null && _advertise.Property.Images.Count > 0)
            {
                pictureBox1.ImageLocation = $"{_url}{_advertise.Property.Images.ToArray()[imgIndex].ImageUrl}";
                btnImgBack.Enabled = false;
                if (!hasNext())
                {
                    btnImgFwd.Enabled = false;  
                }
            }
            else
            {
                pictureBox1.ImageLocation = $"{_url}images/NoImage.png";

                btnImgFwd.Enabled = false;
                btnImgBack.Enabled = false; 
            }

            if (!arr.Contains(_mode))
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
           
            if (arr.Contains(_mode))
            {
                await changeAdStatus("pending", "Advertise removed from site, now it is in pending requests");
            }
            else
            {
                await deleteAd();
            }
            
     
       
        }

        private async Task changeAdStatus(string newStatus,string message)
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
                _advertise = await adService.Patch<AdvertiseModel>(_advertise.Id, updateReq);
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
           if(arr.Contains(_mode))
            {
                await deleteAd();
            }
            else
            {
                await changeAdStatus("approved", "Advertise approved.");
            }
        }

        private async Task<AdvertiseModel> deleteAd()
        {
            try
            {
                var removed = await adService.Delete<AdvertiseModel>(_advertise.Id);
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


        private void btnImgFwd_Click(object sender, EventArgs e)
        {
           
            imgIndex++;
            if (hasPrevious())
            {
                btnImgBack.Enabled = true;
            }
            pictureBox1.ImageLocation = $"{_url}{_advertise.Property.Images.ToArray()[imgIndex].ImageUrl}";
            if (!hasNext())
            {
               btnImgFwd.Enabled = false;  
            }
        }

        private void btnImgBack_Click(object sender, EventArgs e)
        {
           
            imgIndex--;
            if (hasNext())
            {
                btnImgFwd.Enabled = true;
            }
            pictureBox1.ImageLocation = $"{_url}{_advertise.Property.Images.ToArray()[imgIndex].ImageUrl}";
            if (!hasPrevious())
            {
              btnImgBack.Enabled = false;
            }

        }
        private bool hasNext()
        {
            return !(imgIndex + 1 == _advertise.Property.Images.Count);
        }

        private bool hasPrevious()
        {
            return !(imgIndex == 0);
        }
    }
}
