using AutoMapper;
using Flurl.Http;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using Microsoft.AspNetCore.JsonPatch.Internal;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmUsers : Form
    {

        public APIService usersService { get; set; } = new APIService("User");
        List<UserModel> users = null;
        List<UserModel> temporaryUsers = null;

        public frmUsers()
        {
            InitializeComponent();
            dgvUsers.AutoGenerateColumns = false;

        }

        private async void frmUsers_Load(object sender, EventArgs e)
        {
            await loadUsers();
            customizeDgvUsers();
        }

        private async Task<List<UserModel>> loadUsers()
        {
            var list = await usersService.Get<List<UserModel>>();
            users = list;
            dgvUsers.DataSource = list;
            temporaryUsers= list;
            return list;
        }

        private void customizeDgvUsers()
        {
            for (int i = 0; i < dgvUsers.RowCount; i++)
            {
                DataGridViewCell cell = dgvUsers.Rows[i].Cells[4];

                if (temporaryUsers[i].RoleId == 1)
                {
                    cell.Value = "Make employee";
                }
                else if (temporaryUsers[i].RoleId == 2)
                {
                    cell.Value = "Remove employee permissions";
                }
                else if (temporaryUsers[i].RoleId == 3)
                {
                    cell.Value = "Admin";
                    cell.ReadOnly = true;                                       
                }
            }

            foreach (DataGridViewRow row in dgvUsers.Rows)
            {
                DataGridViewCell cell = row.Cells[3];
                cell.Value = "Details";
            }
        }
       

        private async void dgvUsers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var selectedUser = dgvUsers.SelectedRows[0].DataBoundItem as UserModel;
            if (e.ColumnIndex == 3)
            {
                frmUserUpsert frm=new frmUserUpsert(selectedUser);
                frm.FormClosed += frm_FormClosed;
                frm.ShowDialog();
            }
            if(e.ColumnIndex == 4)
            {
                if(selectedUser.RoleId==3)
                {
                    return;
                }
                if(selectedUser.RoleId == 1)
                {
                    selectedUser.RoleId = 2;
                }
                else if(selectedUser.RoleId== 2)
                {
                    selectedUser.RoleId = 1;
                }
                PatchObject[] updateReq = new PatchObject[1]
                {
                    new PatchObject()
                    {
                        path = "/RoleId",
                        op = "replace",
                        value = selectedUser.RoleId
                    }
                };
                await usersService.Patch<UserModel>(selectedUser.Id, updateReq);
                await loadUsers();
                filterUsers();
            }
        }

        private async void frm_FormClosed(object sender, FormClosedEventArgs e)
        {
            await loadUsers();
            customizeDgvUsers();
        }


        private void txtFilterUsers_TextChanged(object sender, EventArgs e)
        {
           filterUsers();
        }

        private void filterUsers()
        {
           temporaryUsers = users.Where(x =>
            x.FirstName.ToLower().Contains(txtFilterUsers.Text.ToLower())
            || x.LastName.ToLower().Contains(txtFilterUsers.Text.ToLower())).ToList();
            dgvUsers.DataSource = temporaryUsers;

            customizeDgvUsers();
        }

        private void btnPending_Click(object sender, EventArgs e)
        {
            frmPending frm = new frmPending();
            Hide();
            frm.Show();
        }

        private void btnRent_Click(object sender, EventArgs e)
        {
            frmRent frm = new frmRent();
            Hide();
            frm.Show();
        }

        private void btnStatistics_Click(object sender, EventArgs e)
        {
            Hide();
            frmStatistics frm=new frmStatistics();
            frm.Show();
        }

        private void btnSale_Click(object sender, EventArgs e)
        {
            frmSale frm = new frmSale();
            Hide();
            frm.Show();
        }

        private void btnDemand_Click(object sender, EventArgs e)
        {
            frmDemand frm = new frmDemand();
            Hide();
            frm.Show();

        }

        private void dgvUsers_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.Cancel = true;
        }

        private void btnMessages_Click(object sender, EventArgs e)
        {
            frmMessages frm = new frmMessages();
            Hide();
            frm.Show();
        }
    }
}