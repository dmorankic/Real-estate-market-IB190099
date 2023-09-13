using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using System.Data;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmDemandMessageDetails : Form
    {
        public List<DemandMessageModel> _messages;
        public List<dgvMessageModel> displayMessages = new List<dgvMessageModel>();
        public APIService msgService { get; set; } = new APIService("DemandMessage");
        public frmDemandMessageDetails(List<DemandMessageModel> messages)
        {
            InitializeComponent();
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            dataGridView1.ReadOnly = true;
            _messages = messages;
            mapMessages();
            lblHeading.Text = $"{displayMessages[0].SenderName} for article demand {displayMessages[0].PropName}";
        }


        private void mapMessages()
        {
            displayMessages.Clear();
            _messages.ForEach(y => {
                displayMessages.Add(new dgvMessageModel()
                {
                    SenderId = y.SenderId,
                    AdvertiseId = y.DemandAdvertiseId,
                    Content = $"{(y.IsEmployee == 1 ? "Real estate market" : y.Sender.FirstName)} : {y.Content}",
                    PropName = y.DemandAdvertise.Location,
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
            DemandMessageInsertRequest newMsg = new DemandMessageInsertRequest()
            {
                DemandAdvertiseId = _messages[0].DemandAdvertiseId,
                Content = textBox1.Text,
                IsEmployee = 1,
                SenderId = _messages[0].SenderId,
                Timestamp = DateTime.Now,
            };


            try
            {
                await msgService.Post<DemandMessageInsertRequest>(newMsg);
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
                _messages = await msgService.Get<List<DemandMessageModel>>();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }

        }
    }



}
