using Flurl.Http;
using Real_estate_market_IB190099.Model;
using System.Windows.Forms;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmUsers : Form
    {
        public APIService usersService { get; set; } = new APIService("User");
        public frmUsers()
        {
            InitializeComponent();
        }

        private async void loadUsers(object sender, EventArgs e)
        {
            var list = await usersService.Get<List<UserModel>>();
        }

        private async void button2_Click(object sender, EventArgs e)
        {
            var item = await usersService.GetById<UserModel>(Convert.ToInt32(numInput1.Value));
        }

        private async void frmUsers_Load(object sender, EventArgs e)
        {
            var list = await usersService.Get<List<userDgvModel>>();

            dgvUsers.DataSource = list;

            DataGridViewButtonColumn buttonLogin = new DataGridViewButtonColumn();
            DataGridViewButtonColumn details = new DataGridViewButtonColumn();
            dgvUsers.Columns.Add(details);
            dgvUsers.Columns.Add(buttonLogin);

            for (int i=0;i<dgvUsers.RowCount;i++) 
            {
                DataGridViewCell cell = dgvUsers.Rows[i].Cells[5];

                if (list[i].RoleId == 1)
                {
                    cell.Value = "Make employee";
                }
                else if (list[i].RoleId == 2)
                {
                    cell.Value = "Remove employee permissions";
                }
                else if (list[i].RoleId == 3)
                {
                    cell.Value = "Remove admin permissions";
                }
            }

            foreach (DataGridViewRow row in dgvUsers.Rows)
            {
                DataGridViewCell cell = row.Cells[4];
                 cell.Value = "Details";
            }

            dgvUsers.Columns.RemoveAt(3);
            dgvUsers.AutoSizeColumnsMode= DataGridViewAutoSizeColumnsMode.Fill;

        }

        private void dgvUsers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}