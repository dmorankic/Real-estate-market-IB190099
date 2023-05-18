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
    public partial class frmUserUpsert : Form
    {
        public UserModel _user = null;
        public frmUserUpsert(UserModel user=null)
        {
            InitializeComponent();
            _user= user;    
        }

        private void frmUserUpsert_Load(object sender, EventArgs e)
        {
            if(_user != null ) 
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
                txtRole.Text=_user.Role.Name;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
