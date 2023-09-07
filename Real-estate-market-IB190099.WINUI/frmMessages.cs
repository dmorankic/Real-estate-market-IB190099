using Microsoft.IdentityModel.Tokens;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Services.Database;
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
    public partial class frmMessages : Form
    {
        public APIService msgService { get; set; } = new APIService("Message");
        List<MessageModel> messages = null;
        List<dgvMessageModel> displayMessages = new List<dgvMessageModel>();

        public frmMessages()
        {
            InitializeComponent();
            dgvMessages.AutoGenerateColumns = false;

        }

        private async void frmMessages_Load(object sender, EventArgs e)
        {
            await loadMessages();
        }

        private async Task loadMessages()
        {
            var list = await msgService.Get<List<MessageModel>>();
            messages = list;
            displayMessages.Clear();
            list.DistinctBy(x => new { x.SenderId, x.AdvertiseId }).ToList().ForEach(y => {
                displayMessages.Add(new dgvMessageModel()
                {
                    SenderId= y.SenderId,
                    AdvertiseId= y.AdvertiseId,
                    Content = y.Content,
                    PropName = y.Advertise.Property.Name,
                    SenderName = $"{y.Sender.FirstName} {y.Sender.LastName}",
                    Timestamp=y.Timestamp
                }) ;
            });
            displayMessages = displayMessages.OrderByDescending(x => x.Timestamp).ToList();
            dgvMessages.DataSource = displayMessages;
            dgvMessages.Update();
            foreach (DataGridViewColumn column in dgvMessages.Columns) 
            {
                if (column.HeaderText == "SenderName")
                {
                    column.HeaderText = "Sender";
                }
                if (column.HeaderText == "PropName")
                {
                    column.HeaderText = "Property";
                }
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                dgvMessages.DataSource = displayMessages;
            }
            dgvMessages.DataSource = displayMessages.Where(x=>x.PropName.ToLower().Contains(txtSearch.Text.ToLower())
            || x.SenderName.ToLower().Contains(txtSearch.Text.ToLower())).ToList();
        }

        private void dgvMessages_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var selectedMsg = dgvMessages.SelectedRows[0].DataBoundItem as dgvMessageModel;

            var advMessages = messages.Where(x => x.SenderId == selectedMsg.SenderId
            && x.AdvertiseId == selectedMsg.AdvertiseId).ToList();
            frmMessageDetails frm = new frmMessageDetails(advMessages);
            frm.FormClosed += refreshMessages;
            frm.ShowDialog();
        }

        private async void refreshMessages(object? sender, FormClosedEventArgs e)
        {
           await loadMessages();
        }

        private void btnStatistics_Click(object sender, EventArgs e)
        {
            frmStatistics frm = new frmStatistics();
            Hide();
            frm.Show();
        }

        private void btnUsers_Click(object sender, EventArgs e)
        {
            frmUsers frm = new frmUsers();
            Hide();
            frm.Show();
        }

        private void btnDemand_Click(object sender, EventArgs e)
        {
            frmDemand frm = new frmDemand();
            Hide();
            frm.Show();
        }

        private void btnSale_Click(object sender, EventArgs e)
        {
            frmSale frm = new frmSale();
            Hide();
            frm.Show();
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

        private void btnDemandMessages_Click(object sender, EventArgs e)
        {
            frmDemandMessages frm=new frmDemandMessages();
            frm.ShowDialog();
        }
    }


}
