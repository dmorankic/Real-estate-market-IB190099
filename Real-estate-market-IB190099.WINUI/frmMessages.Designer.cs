namespace Real_estate_market_IB190099.WINUI
{
    partial class frmMessages
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
            this.btnRent = new System.Windows.Forms.Button();
            this.btnPending = new System.Windows.Forms.Button();
            this.btnMyprofile = new System.Windows.Forms.Button();
            this.btnSale = new System.Windows.Forms.Button();
            this.btnUsers = new System.Windows.Forms.Button();
            this.btnDemand = new System.Windows.Forms.Button();
            this.btnStatistics = new System.Windows.Forms.Button();
            this.dgvMessages = new System.Windows.Forms.DataGridView();
            this.Sender = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Property = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Timestamp = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Content = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMessages)).BeginInit();
            this.SuspendLayout();
            // 
            // btnRent
            // 
            this.btnRent.Location = new System.Drawing.Point(23, 318);
            this.btnRent.Name = "btnRent";
            this.btnRent.Size = new System.Drawing.Size(94, 29);
            this.btnRent.TabIndex = 48;
            this.btnRent.Text = "Rent";
            this.btnRent.UseVisualStyleBackColor = true;
            this.btnRent.Click += new System.EventHandler(this.btnRent_Click);
            // 
            // btnPending
            // 
            this.btnPending.Location = new System.Drawing.Point(23, 251);
            this.btnPending.Name = "btnPending";
            this.btnPending.Size = new System.Drawing.Size(94, 48);
            this.btnPending.TabIndex = 49;
            this.btnPending.Text = "Pending requests";
            this.btnPending.UseVisualStyleBackColor = true;
            this.btnPending.Click += new System.EventHandler(this.btnPending_Click);
            // 
            // btnMyprofile
            // 
            this.btnMyprofile.Location = new System.Drawing.Point(23, 371);
            this.btnMyprofile.Name = "btnMyprofile";
            this.btnMyprofile.Size = new System.Drawing.Size(94, 29);
            this.btnMyprofile.TabIndex = 47;
            this.btnMyprofile.Text = "My profile";
            this.btnMyprofile.UseVisualStyleBackColor = true;
            // 
            // btnSale
            // 
            this.btnSale.Location = new System.Drawing.Point(23, 204);
            this.btnSale.Name = "btnSale";
            this.btnSale.Size = new System.Drawing.Size(94, 29);
            this.btnSale.TabIndex = 46;
            this.btnSale.Text = "Sale";
            this.btnSale.UseVisualStyleBackColor = true;
            this.btnSale.Click += new System.EventHandler(this.btnSale_Click);
            // 
            // btnUsers
            // 
            this.btnUsers.Location = new System.Drawing.Point(23, 94);
            this.btnUsers.Name = "btnUsers";
            this.btnUsers.Size = new System.Drawing.Size(94, 29);
            this.btnUsers.TabIndex = 45;
            this.btnUsers.Text = "Users";
            this.btnUsers.UseVisualStyleBackColor = true;
            this.btnUsers.Click += new System.EventHandler(this.btnUsers_Click);
            // 
            // btnDemand
            // 
            this.btnDemand.Location = new System.Drawing.Point(23, 149);
            this.btnDemand.Name = "btnDemand";
            this.btnDemand.Size = new System.Drawing.Size(94, 29);
            this.btnDemand.TabIndex = 44;
            this.btnDemand.Text = "Demand";
            this.btnDemand.UseVisualStyleBackColor = true;
            this.btnDemand.Click += new System.EventHandler(this.btnDemand_Click);
            // 
            // btnStatistics
            // 
            this.btnStatistics.Location = new System.Drawing.Point(23, 45);
            this.btnStatistics.Name = "btnStatistics";
            this.btnStatistics.Size = new System.Drawing.Size(94, 29);
            this.btnStatistics.TabIndex = 43;
            this.btnStatistics.Text = "Statistics";
            this.btnStatistics.UseVisualStyleBackColor = true;
            this.btnStatistics.Click += new System.EventHandler(this.btnStatistics_Click);
            // 
            // dgvMessages
            // 
            this.dgvMessages.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMessages.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Sender,
            this.Property,
            this.Timestamp,
            this.Content});
            this.dgvMessages.Location = new System.Drawing.Point(185, 120);
            this.dgvMessages.Name = "dgvMessages";
            this.dgvMessages.RowHeadersWidth = 51;
            this.dgvMessages.RowTemplate.Height = 29;
            this.dgvMessages.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvMessages.Size = new System.Drawing.Size(541, 348);
            this.dgvMessages.TabIndex = 50;
            this.dgvMessages.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvMessages_CellContentClick);
            // 
            // Sender
            // 
            this.Sender.DataPropertyName = "SenderName";
            this.Sender.HeaderText = "User";
            this.Sender.MinimumWidth = 6;
            this.Sender.Name = "Sender";
            this.Sender.Width = 125;
            // 
            // Property
            // 
            this.Property.DataPropertyName = "PropName";
            this.Property.HeaderText = "Property";
            this.Property.MinimumWidth = 6;
            this.Property.Name = "Property";
            this.Property.Width = 125;
            // 
            // Timestamp
            // 
            this.Timestamp.DataPropertyName = "Timestamp";
            this.Timestamp.HeaderText = "Timestamp";
            this.Timestamp.MinimumWidth = 6;
            this.Timestamp.Name = "Timestamp";
            this.Timestamp.Width = 125;
            // 
            // Content
            // 
            this.Content.DataPropertyName = "Content";
            this.Content.HeaderText = "Content";
            this.Content.MinimumWidth = 6;
            this.Content.Name = "Content";
            this.Content.Width = 125;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(319, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(166, 46);
            this.label1.TabIndex = 51;
            this.label1.Text = "Messages";
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(185, 87);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.PlaceholderText = "Search by user or property";
            this.txtSearch.Size = new System.Drawing.Size(541, 27);
            this.txtSearch.TabIndex = 52;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChanged);
            // 
            // frmMessages
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 480);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvMessages);
            this.Controls.Add(this.btnRent);
            this.Controls.Add(this.btnPending);
            this.Controls.Add(this.btnMyprofile);
            this.Controls.Add(this.btnSale);
            this.Controls.Add(this.btnUsers);
            this.Controls.Add(this.btnDemand);
            this.Controls.Add(this.btnStatistics);
            this.Name = "frmMessages";
            this.Text = "frmMessages";
            this.Load += new System.EventHandler(this.frmMessages_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvMessages)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button btnRent;
        private Button btnPending;
        private Button btnMyprofile;
        private Button btnSale;
        private Button btnUsers;
        private Button btnDemand;
        private Button btnStatistics;
        private DataGridView dgvMessages;
        private Label label1;
        private TextBox txtSearch;
        private DataGridViewTextBoxColumn Sender;
        private DataGridViewTextBoxColumn Property;
        private DataGridViewTextBoxColumn Timestamp;
        private DataGridViewTextBoxColumn Content;
    }
}