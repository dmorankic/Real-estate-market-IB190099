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
    public partial class frmLogin : Form
    {
        public APIService _api = new APIService("User");
        public frmLogin()
        {
            InitializeComponent();
            txtPassword.PasswordChar= '*';  
        }

        private async void btnLogin_Click(object sender, EventArgs e)
        {
            APIService.username=txtUsername.Text;
            APIService.password=txtPassword.Text;

            try
            {
                var res=await _api.Get<List<UserModel>>();
                List<UserModel> users = res;
                users.ForEach(user =>
                {
                    if (user.Username == APIService.username)
                    {
                        APIService.loggedUser = user;
                        if (user.Role.Name == "User")
                        {
                            throw new UserException("Only employees are allowed to login");
                        }
                    }
                });

                frmUsers frm=new frmUsers();
                Hide();
                frm.Show();

            }catch(Exception ex)
            {
                if(ex is UserException)
                {
                    MessageBox.Show(ex.Message);
                }
                else if(ex.Message.Contains("401"))
                {
                    MessageBox.Show("Wrong username or password");
                }
                else
                {
                    MessageBox.Show("An error occured");

                }
            }
        }
    }
}
