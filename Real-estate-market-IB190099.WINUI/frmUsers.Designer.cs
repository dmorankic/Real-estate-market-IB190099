namespace Real_estate_market_IB190099.WINUI
{
    partial class frmUsers
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgvUsers = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.LastName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Details = new System.Windows.Forms.DataGridViewButtonColumn();
            this.Actions = new System.Windows.Forms.DataGridViewButtonColumn();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FirstName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.txtFilterUsers = new System.Windows.Forms.TextBox();
            this.btnStatistics = new System.Windows.Forms.Button();
            this.btnDemand = new System.Windows.Forms.Button();
            this.btnRent = new System.Windows.Forms.Button();
            this.btnSale = new System.Windows.Forms.Button();
            this.btnMyprofile = new System.Windows.Forms.Button();
            this.btnMessages = new System.Windows.Forms.Button();
            this.btnPending = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsers)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvUsers
            // 
            this.dgvUsers.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvUsers.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6,
            this.LastName,
            this.Details,
            this.Actions});
            this.dgvUsers.Location = new System.Drawing.Point(125, 127);
            this.dgvUsers.Name = "dgvUsers";
            this.dgvUsers.RowHeadersWidth = 51;
            this.dgvUsers.RowTemplate.Height = 29;
            this.dgvUsers.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvUsers.Size = new System.Drawing.Size(625, 367);
            this.dgvUsers.TabIndex = 4;
            this.dgvUsers.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvUsers_CellContentClick);
            this.dgvUsers.DataError += new System.Windows.Forms.DataGridViewDataErrorEventHandler(this.dgvUsers_DataError);
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
            this.dataGridViewTextBoxColumn6.DataPropertyName = "FirstName";
            this.dataGridViewTextBoxColumn6.HeaderText = "First Name";
            this.dataGridViewTextBoxColumn6.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            this.dataGridViewTextBoxColumn6.Width = 125;
            // 
            // LastName
            // 
            this.LastName.DataPropertyName = "LastName";
            this.LastName.HeaderText = "Last Name";
            this.LastName.MinimumWidth = 6;
            this.LastName.Name = "LastName";
            this.LastName.Width = 125;
            // 
            // Details
            // 
            this.Details.HeaderText = "Details";
            this.Details.MinimumWidth = 6;
            this.Details.Name = "Details";
            this.Details.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Details.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Details.Width = 125;
            // 
            // Actions
            // 
            this.Actions.HeaderText = "Actions";
            this.Actions.MinimumWidth = 6;
            this.Actions.Name = "Actions";
            this.Actions.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Actions.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Actions.Width = 250;
            // 
            // ID
            // 
            this.ID.DataPropertyName = "Id";
            this.ID.HeaderText = "ID";
            this.ID.MinimumWidth = 6;
            this.ID.Name = "ID";
            this.ID.Width = 50;
            // 
            // FirstName
            // 
            this.FirstName.DataPropertyName = "FirstName";
            this.FirstName.HeaderText = "First name";
            this.FirstName.MinimumWidth = 6;
            this.FirstName.Name = "FirstName";
            this.FirstName.Width = 125;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn1.HeaderText = "ID";
            this.dataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            this.dataGridViewTextBoxColumn1.Width = 125;
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn2.HeaderText = "ID";
            this.dataGridViewTextBoxColumn2.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            this.dataGridViewTextBoxColumn2.Width = 125;
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn3.HeaderText = "ID";
            this.dataGridViewTextBoxColumn3.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            this.dataGridViewTextBoxColumn3.Width = 125;
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.DataPropertyName = "FirstName";
            this.dataGridViewTextBoxColumn4.HeaderText = "First Name";
            this.dataGridViewTextBoxColumn4.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            this.dataGridViewTextBoxColumn4.Width = 125;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(304, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(106, 39);
            this.label1.TabIndex = 5;
            this.label1.Text = "Users";
            // 
            // txtFilterUsers
            // 
            this.txtFilterUsers.Location = new System.Drawing.Point(125, 94);
            this.txtFilterUsers.Name = "txtFilterUsers";
            this.txtFilterUsers.PlaceholderText = "Search by first and/or last name";
            this.txtFilterUsers.Size = new System.Drawing.Size(254, 27);
            this.txtFilterUsers.TabIndex = 6;
            this.txtFilterUsers.TextChanged += new System.EventHandler(this.txtFilterUsers_TextChanged);
            // 
            // btnStatistics
            // 
            this.btnStatistics.Location = new System.Drawing.Point(12, 133);
            this.btnStatistics.Name = "btnStatistics";
            this.btnStatistics.Size = new System.Drawing.Size(94, 29);
            this.btnStatistics.TabIndex = 8;
            this.btnStatistics.Text = "Statistics";
            this.btnStatistics.UseVisualStyleBackColor = true;
            this.btnStatistics.Click += new System.EventHandler(this.btnStatistics_Click);
            // 
            // btnDemand
            // 
            this.btnDemand.Location = new System.Drawing.Point(12, 237);
            this.btnDemand.Name = "btnDemand";
            this.btnDemand.Size = new System.Drawing.Size(94, 29);
            this.btnDemand.TabIndex = 9;
            this.btnDemand.Text = "Demand";
            this.btnDemand.UseVisualStyleBackColor = true;
            this.btnDemand.Click += new System.EventHandler(this.btnDemand_Click);
            // 
            // btnRent
            // 
            this.btnRent.Location = new System.Drawing.Point(12, 182);
            this.btnRent.Name = "btnRent";
            this.btnRent.Size = new System.Drawing.Size(94, 29);
            this.btnRent.TabIndex = 10;
            this.btnRent.Text = "Rent";
            this.btnRent.UseVisualStyleBackColor = true;
            this.btnRent.Click += new System.EventHandler(this.btnRent_Click);
            // 
            // btnSale
            // 
            this.btnSale.Location = new System.Drawing.Point(12, 292);
            this.btnSale.Name = "btnSale";
            this.btnSale.Size = new System.Drawing.Size(94, 29);
            this.btnSale.TabIndex = 11;
            this.btnSale.Text = "Sale";
            this.btnSale.UseVisualStyleBackColor = true;
            this.btnSale.Click += new System.EventHandler(this.btnSale_Click);
            // 
            // btnMyprofile
            // 
            this.btnMyprofile.Location = new System.Drawing.Point(12, 452);
            this.btnMyprofile.Name = "btnMyprofile";
            this.btnMyprofile.Size = new System.Drawing.Size(94, 29);
            this.btnMyprofile.TabIndex = 12;
            this.btnMyprofile.Text = "My profile";
            this.btnMyprofile.UseVisualStyleBackColor = true;
            // 
            // btnMessages
            // 
            this.btnMessages.Location = new System.Drawing.Point(12, 406);
            this.btnMessages.Name = "btnMessages";
            this.btnMessages.Size = new System.Drawing.Size(94, 29);
            this.btnMessages.TabIndex = 13;
            this.btnMessages.Text = "Messages";
            this.btnMessages.UseVisualStyleBackColor = true;
            this.btnMessages.Click += new System.EventHandler(this.btnMessages_Click);
            // 
            // btnPending
            // 
            this.btnPending.Location = new System.Drawing.Point(12, 339);
            this.btnPending.Name = "btnPending";
            this.btnPending.Size = new System.Drawing.Size(94, 48);
            this.btnPending.TabIndex = 14;
            this.btnPending.Text = "Pending requests";
            this.btnPending.UseVisualStyleBackColor = true;
            this.btnPending.Click += new System.EventHandler(this.btnPending_Click);
            // 
            // frmUsers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(776, 566);
            this.Controls.Add(this.btnPending);
            this.Controls.Add(this.btnMessages);
            this.Controls.Add(this.btnMyprofile);
            this.Controls.Add(this.btnSale);
            this.Controls.Add(this.btnRent);
            this.Controls.Add(this.btnDemand);
            this.Controls.Add(this.btnStatistics);
            this.Controls.Add(this.txtFilterUsers);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvUsers);
            this.Name = "frmUsers";
            this.Text = "Real estate market";
            this.Load += new System.EventHandler(this.frmUsers_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsers)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button button1;
        private Button button2;
        private NumericUpDown numInput1;
        private DataGridView dgvUsers;
        private DataGridViewTextBoxColumn FirstName;
        private DataGridViewTextBoxColumn ID;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private Label label1;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private DataGridViewTextBoxColumn LastName;
        private DataGridViewButtonColumn Details;
        private DataGridViewButtonColumn Actions;
        private TextBox txtFilterUsers;
        private Button btnStatistics;
        private Button btnDemand;
        private Button btnRent;
        private Button btnSale;
        private Button btnMyprofile;
        private Button btnMessages;
        private Button btnPending;
    }
}