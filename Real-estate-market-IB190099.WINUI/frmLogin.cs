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
    public partial class frmLogin : Form
    {
        public APIService _api = new APIService("User");
        public frmLogin()
        {
            InitializeComponent();
        }

        private async void btnLogin_Click(object sender, EventArgs e)
        {
            APIService.username=txtUsername.Text;
            APIService.password=txtPassword.Text;

            try
            {
                var res=await _api.Get<dynamic>();

                frmUsers frm=new frmUsers();
                this.Hide();
                frm.Show();

            }catch(Exception ex)
            {
                MessageBox.Show("Wrong username or password");
            }
        }
    }
}
