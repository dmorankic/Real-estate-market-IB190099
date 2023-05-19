using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
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
    public partial class frmUserUpsert : Form
    {
        public UserModel _user = null;
        public APIService usersService { get; set; } = new APIService("User");
        public frmUserUpsert(UserModel user=null)
        {
            InitializeComponent();
            _user= user;    
        }

        private void frmUserUpsert_Load(object sender, EventArgs e)
        {
            loadUserData();
        }

        private void loadUserData()
        {
            if (_user != null)
            {
                lblHeading.Text = "User ID " + _user.Id + " details";
                txtFirstName.Text = _user.FirstName;
                txtLastName.Text = _user.LastName;
                txtEmail.Text = _user.Email;
                txtPhone.Text = _user.Phone;
                dtBirth.Value = _user.DateOfBirth;
                txtGender.Text = _user.Gender;
                dtRegistered.Value = _user.DateRegistered;
                txtCity.Text = _user.Address.City.Name;
                txtZip.Text = _user.Address.City.ZipCode;
                txtStreet.Text = _user.Address.NumberStreet;
                txtRole.Text = _user.Role.Name;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtBirth_ValueChanged(object sender, EventArgs e)
        {

        }

        private async void btnUpdate_Click(object sender, EventArgs e)
        {
            if(_user!= null )
            {
                PatchObject[] updateReq = new PatchObject[]
                {
                    new PatchObject()
                    {
                        path = "/FirstName",
                        op = "replace",
                        value = txtFirstName.Text
                    },
                      new PatchObject()
                    {
                        path = "/LastName",
                        op = "replace",
                        value = txtLastName.Text
                    },
                      new PatchObject()
                    {
                        path = "/Email",
                        op = "replace",
                        value = txtEmail.Text
                    },
                      new PatchObject()
                    {
                        path = "/Phone",
                        op = "replace",
                        value = txtPhone.Text
                    },
                      new PatchObject()
                    {
                        path = "/DateOfBirth",
                        op = "replace",
                        value = dtBirth.Value
                    },
                      new PatchObject()
                    {
                        path = "/Gender",
                        op = "replace",
                        value = txtGender.Text
                    }
                };

                try
                {
                    _user = await usersService.Patch<UserModel>(_user.Id, updateReq);
                    MessageBox.Show("User data updated");
                }catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                
                
            }
        }
    }
}
