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
    public partial class frmDemandMessages : Form
    {
        public APIService msgService { get; set; } = new APIService("DemandMessage");
        List<DemandMessageModel> messages = null;
        List<dgvMessageModel> displayMessages = new List<dgvMessageModel>();
        public frmDemandMessages()
        {
            InitializeComponent();
            dgvMessages.AutoGenerateColumns = false;

        }

        private async void frmDemandMessages_Load(object sender, EventArgs e)
        {
            await loadMessages();

        }

        private async Task loadMessages()
        {
            var list = await msgService.Get<List<DemandMessageModel>>();
            messages = list;
            displayMessages.Clear();
            list.DistinctBy(x => new { x.SenderId, x.DemandAdvertiseId }).ToList().ForEach(y => {
                displayMessages.Add(new dgvMessageModel()
                {
                    SenderId = y.SenderId,
                    AdvertiseId = y.DemandAdvertiseId,
                    Content = y.Content,
                    PropName = y.DemandAdvertise.Location,
                    SenderName = $"{y.Sender.FirstName} {y.Sender.LastName}",
                    Timestamp = y.Timestamp
                });
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
                    column.HeaderText = "Location";
                }
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                dgvMessages.DataSource = displayMessages;
            }
            dgvMessages.DataSource = displayMessages.Where(x => x.PropName.ToLower().Contains(txtSearch.Text.ToLower())
            || x.SenderName.ToLower().Contains(txtSearch.Text.ToLower())).ToList();
        }

        private void dgvMessages_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            var selectedMsg = dgvMessages.SelectedRows[0].DataBoundItem as dgvMessageModel;

            var advMessages = messages.Where(x => x.SenderId == selectedMsg.SenderId
            && x.DemandAdvertiseId == selectedMsg.AdvertiseId).ToList();
            frmDemandMessageDetails frm = new frmDemandMessageDetails(advMessages);
            frm.FormClosed += refreshMessages;
            frm.ShowDialog();
        }

        private async void refreshMessages(object? sender, FormClosedEventArgs e)
        {
            await loadMessages();
        }
    }
}
