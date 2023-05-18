using Flurl.Http;
using Real_estate_market_IB190099.Model;
using System.Windows.Forms;

namespace Real_estate_market_IB190099.WINUI
{
    public partial class frmUsers : Form
    {
        public APIService usersService { get; set; } = new APIService("User");
        List<UserModel> users = null;
        public frmUsers()
        {
            InitializeComponent();
            dgvUsers.AutoGenerateColumns = false;
            //label1.Size = new Size(100, 50);

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
            var list = await usersService.Get<List<UserModel>>();
            users = list;
            dgvUsers.DataSource = list;

            customizeDgvUsers();

            //dgvUsers.AutoSizeColumnsMode= DataGridViewAutoSizeColumnsMode.Fill;
        }
        private void customizeDgvUsers()
        {
            for (int i = 0; i < dgvUsers.RowCount; i++)
            {
                DataGridViewCell cell = dgvUsers.Rows[i].Cells[4];

                if (users[i].RoleId == 1)
                {
                    cell.Value = "Make employee";
                }
                else if (users[i].RoleId == 2)
                {
                    cell.Value = "Remove employee permissions";
                }
                else if (users[i].RoleId == 3)
                {
                    cell.Value = "Remove admin permissions";
                }
            }

            foreach (DataGridViewRow row in dgvUsers.Rows)
            {
                DataGridViewCell cell = row.Cells[3];
                cell.Value = "Details";
            }
        }
       

        private void dgvUsers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                var selectedUser = dgvUsers.SelectedRows[0].DataBoundItem as UserModel;
                //MessageBox.Show(selectedUser.Id.ToString());
                frmUserUpsert frm=new frmUserUpsert(selectedUser);
                frm.Show();
            }
        }

        private void dgvUsers_Paint(object sender, PaintEventArgs e)
        {
            ////Offsets to adjust the position of the merged Header.
            //int heightOffset = -5;
            //int widthOffset = -2;
            //int xOffset = 0;
            //int yOffset = 4;

            ////Index of Header column from where the merging will start.
            //int columnIndex =3;

            ////Number of Header columns to be merged.
            //int columnCount = 2;

            ////Get the position of the Header Cell.
            //Rectangle headerCellRectangle = dgvUsers.GetCellDisplayRectangle(columnIndex, 0, true);

            ////X coordinate of the merged Header Column.
            //int xCord = headerCellRectangle.Location.X + xOffset;

            ////Y coordinate of the merged Header Column.
            //int yCord = headerCellRectangle.Location.Y - headerCellRectangle.Height + yOffset;

            ////Calculate Width of merged Header Column by adding the widths of all Columns to be merged.
            //int mergedHeaderWidth = dgvUsers.Columns[columnIndex].Width + dgvUsers.Columns[columnIndex + columnCount - 1].Width + widthOffset;

            ////Generate the merged Header Column Rectangle.
            //Rectangle mergedHeaderRect = new Rectangle(xCord, yCord, mergedHeaderWidth, headerCellRectangle.Height + heightOffset);

            ////Draw the merged Header Column Rectangle.
            //e.Graphics.FillRectangle(new SolidBrush(Color.White), mergedHeaderRect);

            ////Draw the merged Header Column Text.
            //e.Graphics.DrawString("Actions", dgvUsers.ColumnHeadersDefaultCellStyle.Font, Brushes.Black, xCord + 2, yCord + 3);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtFilterUsers_TextChanged(object sender, EventArgs e)
        {
           dgvUsers.DataSource=users.Where(x=>
           x.FirstName.ToLower().Contains(txtFilterUsers.Text.ToLower())
           || x.LastName.ToLower().Contains(txtFilterUsers.Text.ToLower())).ToList();

            customizeDgvUsers();
        }

        private void dgvUsers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
          
        }
    }
}