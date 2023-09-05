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
    public partial class frmMessageDetails : Form
    {
        public List<MessageModel> _messages;
        public List<dgvMessageModel> displayMessages=new List<dgvMessageModel>();
        public APIService msgService { get; set; } = new APIService("Message");


        public frmMessageDetails(List<MessageModel> messages)
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            dataGridView1.ReadOnly= true;
            _messages = messages;
            mapMessages();
            lblHeading.Text = $"{displayMessages[0].SenderName} for article {displayMessages[0].PropName}";
        }

        private void mapMessages()
        {
            displayMessages.Clear();    
            _messages.ForEach(y => {
                displayMessages.Add(new dgvMessageModel()
                {
                    SenderId = y.SenderId,
                    AdvertiseId = y.AdvertiseId,
                    Content = $"{(y.IsEmployee == 1 ? "Real estate market" : y.Sender.FirstName)} : {y.Content}",
                    PropName = y.Advertise.Property.Name,
                    SenderName = $"{y.Sender.FirstName} {y.Sender.LastName}",
                    Timestamp = y.Timestamp
                });
            });
            displayMessages = displayMessages.OrderByDescending(x => x.Timestamp).ToList();

            dataGridView1.DataSource = displayMessages;
            dataGridView1.Update();
        }


        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private async void btnSend_Click(object sender, EventArgs e)
        {
            MessageInsertRequest newMsg = new MessageInsertRequest()
            {
                AdvertiseId = _messages[0].AdvertiseId,
                Content = textBox1.Text,
                IsEmployee = 1,
                SenderId= _messages[0].SenderId,    
                Timestamp=DateTime.Now,
            };


            try
            {
                await msgService.Post<MessageInsertRequest>(newMsg);
                MessageBox.Show("Message sent");
                textBox1.Text = "";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
            
            await loadMessages();
            mapMessages();

        }

        private async Task loadMessages()
        {
            try
            {
                _messages = await msgService.Get<List<MessageModel>>();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);

            }

        }
        
    }
}
