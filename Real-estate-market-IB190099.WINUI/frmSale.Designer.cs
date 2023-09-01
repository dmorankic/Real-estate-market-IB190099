namespace Real_estate_market_IB190099.WINUI
{
    partial class frmSale
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
            this.btnResetDate = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.DateCreated = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnMessages = new System.Windows.Forms.Button();
            this.dgvSale = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FirstName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.btnPending = new System.Windows.Forms.Button();
            this.btnMyprofile = new System.Windows.Forms.Button();
            this.btnSale = new System.Windows.Forms.Button();
            this.btnUsers = new System.Windows.Forms.Button();
            this.btnDemand = new System.Windows.Forms.Button();
            this.btnStatistics = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtFilterUsers = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSale)).BeginInit();
            this.SuspendLayout();
            // 
            // btnResetDate
            // 
            this.btnResetDate.Location = new System.Drawing.Point(533, 51);
            this.btnResetDate.Name = "btnResetDate";
            this.btnResetDate.Size = new System.Drawing.Size(98, 27);
            this.btnResetDate.TabIndex = 45;
            this.btnResetDate.Text = "Reset date";
            this.btnResetDate.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(395, 57);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(95, 20);
            this.label3.TabIndex = 44;
            this.label3.Text = "Date created";
            // 
            // DateCreated
            // 
            this.DateCreated.DataPropertyName = "DateCreated";
            this.DateCreated.HeaderText = "Date created";
            this.DateCreated.MinimumWidth = 6;
            this.DateCreated.Name = "DateCreated";
            this.DateCreated.Width = 125;
            // 
            // Price
            // 
            this.Price.DataPropertyName = "Price";
            this.Price.HeaderText = "Price";
            this.Price.MinimumWidth = 6;
            this.Price.Name = "Price";
            this.Price.Width = 125;
            // 
            // dataGridViewTextBoxColumn6
            // 
            this.dataGridViewTextBoxColumn6.DataPropertyName = "PropName";
            this.dataGridViewTextBoxColumn6.HeaderText = "Article heading";
            this.dataGridViewTextBoxColumn6.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
            this.dataGridViewTextBoxColumn6.Width = 125;
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.DataPropertyName = "Id";
            this.dataGridViewTextBoxColumn5.HeaderText = "ID";
            this.dataGridViewTextBoxColumn5.MinimumWidth = 6;
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            this.dataGridViewTextBoxColumn5.Width = 50;
            // 
            // btnMessages
            // 
            this.btnMessages.Location = new System.Drawing.Point(31, 392);
            this.btnMessages.Name = "btnMessages";
            this.btnMessages.Size = new System.Drawing.Size(94, 29);
            this.btnMessages.TabIndex = 41;
            this.btnMessages.Text = "Messages";
            this.btnMessages.UseVisualStyleBackColor = true;
            // 
            // dgvSale
            // 
            this.dgvSale.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSale.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6,
            this.Price,
            this.DateCreated});
            this.dgvSale.Location = new System.Drawing.Point(144, 113);
            this.dgvSale.Name = "dgvSale";
            this.dgvSale.RowHeadersWidth = 51;
            this.dgvSale.RowTemplate.Height = 29;
            this.dgvSale.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvSale.Size = new System.Drawing.Size(625, 367);
            this.dgvSale.TabIndex = 32;
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
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(395, 80);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(236, 27);
            this.dateTimePicker1.TabIndex = 43;
            // 
            // btnPending
            // 
            this.btnPending.Location = new System.Drawing.Point(31, 325);
            this.btnPending.Name = "btnPending";
            this.btnPending.Size = new System.Drawing.Size(94, 48);
            this.btnPending.TabIndex = 42;
            this.btnPending.Text = "Pending requests";
            this.btnPending.UseVisualStyleBackColor = true;
            // 
            // btnMyprofile
            // 
            this.btnMyprofile.Location = new System.Drawing.Point(31, 438);
            this.btnMyprofile.Name = "btnMyprofile";
            this.btnMyprofile.Size = new System.Drawing.Size(94, 29);
            this.btnMyprofile.TabIndex = 40;
            this.btnMyprofile.Text = "My profile";
            this.btnMyprofile.UseVisualStyleBackColor = true;
            // 
            // btnSale
            // 
            this.btnSale.Location = new System.Drawing.Point(31, 278);
            this.btnSale.Name = "btnSale";
            this.btnSale.Size = new System.Drawing.Size(94, 29);
            this.btnSale.TabIndex = 39;
            this.btnSale.Text = "Sale";
            this.btnSale.UseVisualStyleBackColor = true;
            // 
            // btnUsers
            // 
            this.btnUsers.Location = new System.Drawing.Point(31, 168);
            this.btnUsers.Name = "btnUsers";
            this.btnUsers.Size = new System.Drawing.Size(94, 29);
            this.btnUsers.TabIndex = 38;
            this.btnUsers.Text = "Users";
            this.btnUsers.UseVisualStyleBackColor = true;
            // 
            // btnDemand
            // 
            this.btnDemand.Location = new System.Drawing.Point(31, 223);
            this.btnDemand.Name = "btnDemand";
            this.btnDemand.Size = new System.Drawing.Size(94, 29);
            this.btnDemand.TabIndex = 37;
            this.btnDemand.Text = "Demand";
            this.btnDemand.UseVisualStyleBackColor = true;
            // 
            // btnStatistics
            // 
            this.btnStatistics.Location = new System.Drawing.Point(31, 119);
            this.btnStatistics.Name = "btnStatistics";
            this.btnStatistics.Size = new System.Drawing.Size(94, 29);
            this.btnStatistics.TabIndex = 36;
            this.btnStatistics.Text = "Statistics";
            this.btnStatistics.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(144, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(131, 20);
            this.label2.TabIndex = 35;
            this.label2.Text = "Search by heading";
            // 
            // txtFilterUsers
            // 
            this.txtFilterUsers.Location = new System.Drawing.Point(144, 80);
            this.txtFilterUsers.Name = "txtFilterUsers";
            this.txtFilterUsers.Size = new System.Drawing.Size(219, 27);
            this.txtFilterUsers.TabIndex = 34;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(323, 6);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 39);
            this.label1.TabIndex = 33;
            this.label1.Text = "Sale";
            // 
            // frmSale
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 506);
            this.Controls.Add(this.btnResetDate);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnMessages);
            this.Controls.Add(this.dgvSale);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.btnPending);
            this.Controls.Add(this.btnMyprofile);
            this.Controls.Add(this.btnSale);
            this.Controls.Add(this.btnUsers);
            this.Controls.Add(this.btnDemand);
            this.Controls.Add(this.btnStatistics);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtFilterUsers);
            this.Controls.Add(this.label1);
            this.Name = "frmSale";
            this.Text = "frmSale";
            this.Load += new System.EventHandler(this.frmSale_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvSale)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button btnResetDate;
        private Label label3;
        private DataGridViewTextBoxColumn DateCreated;
        private DataGridViewTextBoxColumn Price;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private Button btnMessages;
        private DataGridView dgvSale;
        private DataGridViewTextBoxColumn ID;
        private DataGridViewTextBoxColumn FirstName;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private DateTimePicker dateTimePicker1;
        private Button btnPending;
        private Button btnMyprofile;
        private Button btnSale;
        private Button btnUsers;
        private Button btnDemand;
        private Button btnStatistics;
        private Label label2;
        private TextBox txtFilterUsers;
        private Label label1;
    }
}