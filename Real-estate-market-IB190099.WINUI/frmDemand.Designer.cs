namespace Real_estate_market_IB190099.WINUI
{
    partial class frmDemand
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.btnPending = new System.Windows.Forms.Button();
            this.btnMyprofile = new System.Windows.Forms.Button();
            this.btnSale = new System.Windows.Forms.Button();
            this.btnUsers = new System.Windows.Forms.Button();
            this.btnRent = new System.Windows.Forms.Button();
            this.btnStatistics = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FirstName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnMessages = new System.Windows.Forms.Button();
            this.dgvDemand = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.DateCreated = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnResetDate = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.txtFilterUsers = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDemand)).BeginInit();
            this.SuspendLayout();
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(395, 94);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(236, 27);
            this.dateTimePicker1.TabIndex = 57;
            this.dateTimePicker1.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
            // 
            // btnPending
            // 
            this.btnPending.Location = new System.Drawing.Point(31, 339);
            this.btnPending.Name = "btnPending";
            this.btnPending.Size = new System.Drawing.Size(94, 48);
            this.btnPending.TabIndex = 56;
            this.btnPending.Text = "Pending requests";
            this.btnPending.UseVisualStyleBackColor = true;
            this.btnPending.Click += new System.EventHandler(this.btnPending_Click);
            // 
            // btnMyprofile
            // 
            this.btnMyprofile.Location = new System.Drawing.Point(31, 452);
            this.btnMyprofile.Name = "btnMyprofile";
            this.btnMyprofile.Size = new System.Drawing.Size(94, 29);
            this.btnMyprofile.TabIndex = 54;
            this.btnMyprofile.Text = "My profile";
            this.btnMyprofile.UseVisualStyleBackColor = true;
            // 
            // btnSale
            // 
            this.btnSale.Location = new System.Drawing.Point(31, 292);
            this.btnSale.Name = "btnSale";
            this.btnSale.Size = new System.Drawing.Size(94, 29);
            this.btnSale.TabIndex = 53;
            this.btnSale.Text = "Sale";
            this.btnSale.UseVisualStyleBackColor = true;
            this.btnSale.Click += new System.EventHandler(this.btnSale_Click);
            // 
            // btnUsers
            // 
            this.btnUsers.Location = new System.Drawing.Point(31, 182);
            this.btnUsers.Name = "btnUsers";
            this.btnUsers.Size = new System.Drawing.Size(94, 29);
            this.btnUsers.TabIndex = 52;
            this.btnUsers.Text = "Users";
            this.btnUsers.UseVisualStyleBackColor = true;
            this.btnUsers.Click += new System.EventHandler(this.btnUsers_Click);
            // 
            // btnRent
            // 
            this.btnRent.Location = new System.Drawing.Point(31, 237);
            this.btnRent.Name = "btnRent";
            this.btnRent.Size = new System.Drawing.Size(94, 29);
            this.btnRent.TabIndex = 51;
            this.btnRent.Text = "Rent";
            this.btnRent.UseVisualStyleBackColor = true;
            this.btnRent.Click += new System.EventHandler(this.btnRent_Click);
            // 
            // btnStatistics
            // 
            this.btnStatistics.Location = new System.Drawing.Point(31, 133);
            this.btnStatistics.Name = "btnStatistics";
            this.btnStatistics.Size = new System.Drawing.Size(94, 29);
            this.btnStatistics.TabIndex = 50;
            this.btnStatistics.Text = "Statistics";
            this.btnStatistics.UseVisualStyleBackColor = true;
            this.btnStatistics.Click += new System.EventHandler(this.btnStatistics_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(323, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(146, 39);
            this.label1.TabIndex = 47;
            this.label1.Text = "Demand";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.DataPropertyName = "FirstName";
            this.dataGridViewTextBoxColumn4.HeaderText = "First Name";
            this.dataGridViewTextBoxColumn4.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            this.dataGridViewTextBoxColumn4.Width = 125;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn3.HeaderText = "ID";
            this.dataGridViewTextBoxColumn3.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            this.dataGridViewTextBoxColumn3.Width = 125;
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn2.HeaderText = "ID";
            this.dataGridViewTextBoxColumn2.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.Width = 125;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn1.HeaderText = "ID";
            this.dataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.Width = 125;
            // 
            // FirstName
            // 
            this.FirstName.DataPropertyName = "FirstName";
            this.FirstName.HeaderText = "First name";
            this.FirstName.MinimumWidth = 6;
            this.FirstName.Name = "FirstName";
            this.FirstName.Width = 125;
            // 
            // ID
            // 
            this.ID.DataPropertyName = "Id";
            this.ID.HeaderText = "ID";
            this.ID.MinimumWidth = 6;
            this.ID.Name = "ID";
            this.ID.Width = 50;
            // 
            // btnMessages
            // 
            this.btnMessages.Location = new System.Drawing.Point(31, 406);
            this.btnMessages.Name = "btnMessages";
            this.btnMessages.Size = new System.Drawing.Size(94, 29);
            this.btnMessages.TabIndex = 55;
            this.btnMessages.Text = "Messages";
            this.btnMessages.UseVisualStyleBackColor = true;
            this.btnMessages.Click += new System.EventHandler(this.btnMessages_Click);
            // 
            // dgvDemand
            // 
            this.dgvDemand.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDemand.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6,
            this.Price,
            this.DateCreated});
            this.dgvDemand.Location = new System.Drawing.Point(144, 127);
            this.dgvDemand.Name = "dgvDemand";
            this.dgvDemand.RowHeadersWidth = 51;
            this.dgvDemand.RowTemplate.Height = 29;
            this.dgvDemand.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDemand.Size = new System.Drawing.Size(625, 367);
            this.dgvDemand.TabIndex = 46;
            this.dgvDemand.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvDemand_DataError);
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn5.HeaderText = "ID";
            this.dataGridViewTextBoxColumn5.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            this.dataGridViewTextBoxColumn5.Width = 50;
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.DataPropertyName = "PropName";
            this.dataGridViewTextBoxColumn6.HeaderText = "Article heading";
            this.dataGridViewTextBoxColumn6.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            this.dataGridViewTextBoxColumn6.Width = 125;
            // 
            // Price
            // 
            this.Price.DataPropertyName = "Price";
            this.Price.HeaderText = "Price";
            this.Price.MinimumWidth = 6;
            this.Price.Name = "Price";
            this.Price.Width = 125;
            // 
            // DateCreated
            // 
            this.DateCreated.DataPropertyName = "DateCreated";
            this.DateCreated.HeaderText = "Date created";
            this.DateCreated.MinimumWidth = 6;
            this.DateCreated.Name = "DateCreated";
            this.DateCreated.Width = 125;
            // 
            // btnResetDate
            // 
            this.btnResetDate.Location = new System.Drawing.Point(533, 65);
            this.btnResetDate.Name = "btnResetDate";
            this.btnResetDate.Size = new System.Drawing.Size(98, 27);
            this.btnResetDate.TabIndex = 59;
            this.btnResetDate.Text = "Reset date";
            this.btnResetDate.UseVisualStyleBackColor = true;
            this.btnResetDate.Click += new System.EventHandler(this.btnResetDate_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(395, 71);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(95, 20);
            this.label3.TabIndex = 58;
            this.label3.Text = "Date created";
            // 
            // txtFilterUsers
            // 
            this.txtFilterUsers.Location = new System.Drawing.Point(144, 94);
            this.txtFilterUsers.Name = "txtFilterUsers";
            this.txtFilterUsers.PlaceholderText = "Search by heading";
            this.txtFilterUsers.Size = new System.Drawing.Size(219, 27);
            this.txtFilterUsers.TabIndex = 48;
            this.txtFilterUsers.TextChanged += new System.EventHandler(this.txtFilterUsers_TextChanged);
            // 
            // frmDemand
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 515);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.btnPending);
            this.Controls.Add(this.btnMyprofile);
            this.Controls.Add(this.btnSale);
            this.Controls.Add(this.btnUsers);
            this.Controls.Add(this.btnRent);
            this.Controls.Add(this.btnStatistics);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnMessages);
            this.Controls.Add(this.dgvDemand);
            this.Controls.Add(this.btnResetDate);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtFilterUsers);
            this.Name = "frmDemand";
            this.Text = "frmDemand";
            this.Load += new System.EventHandler(this.frmDemand_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDemand)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DateTimePicker dateTimePicker1;
        private Button btnPending;
        private Button btnMyprofile;
        private Button btnSale;
        private Button btnUsers;
        private Button btnRent;
        private Button btnStatistics;
        private Label label1;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn FirstName;
        private DataGridViewTextBoxColumn ID;
        private Button btnMessages;
        private DataGridView dgvDemand;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private DataGridViewTextBoxColumn Price;
        private DataGridViewTextBoxColumn DateCreated;
        private Button btnResetDate;
        private Label label3;
        private TextBox txtFilterUsers;
    }
}