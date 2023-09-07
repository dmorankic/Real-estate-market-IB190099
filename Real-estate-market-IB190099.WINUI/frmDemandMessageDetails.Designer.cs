namespace Real_estate_market_IB190099.WINUI
{
    partial class frmDemandMessageDetails
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Content = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Timestamp = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblHeading = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.btnSend = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Content,
            this.Timestamp});
            this.dataGridView1.Location = new System.Drawing.Point(118, 63);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 29;
            this.dataGridView1.Size = new System.Drawing.Size(644, 331);
            this.dataGridView1.TabIndex = 9;
            // 
            // Content
            // 
            this.Content.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Content.DataPropertyName = "Content";
            this.Content.HeaderText = "Content";
            this.Content.MinimumWidth = 6;
            this.Content.Name = "Content";
            // 
            // Timestamp
            // 
            this.Timestamp.DataPropertyName = "Timestamp";
            this.Timestamp.HeaderText = "Timestamp";
            this.Timestamp.MinimumWidth = 6;
            this.Timestamp.Name = "Timestamp";
            this.Timestamp.Width = 125;
            // 
            // lblHeading
            // 
            this.lblHeading.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblHeading.Location = new System.Drawing.Point(166, 12);
            this.lblHeading.Name = "lblHeading";
            this.lblHeading.Size = new System.Drawing.Size(474, 30);
            this.lblHeading.TabIndex = 8;
            this.lblHeading.Text = "Heading";
            this.lblHeading.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Segoe UI", 15F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.button1.Location = new System.Drawing.Point(38, 12);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(72, 44);
            this.button1.TabIndex = 7;
            this.button1.Text = "←";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnSend
            // 
            this.btnSend.Location = new System.Drawing.Point(615, 404);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(147, 34);
            this.btnSend.TabIndex = 11;
            this.btnSend.Text = "Send message";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(118, 404);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.PlaceholderText = "Type here...";
            this.textBox1.Size = new System.Drawing.Size(491, 34);
            this.textBox1.TabIndex = 10;
            // 
            // frmDemandMessageDetails
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.lblHeading);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.textBox1);
            this.Name = "frmDemandMessageDetails";
            this.Text = "frmDemandMessageDetails";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DataGridView dataGridView1;
        private DataGridViewTextBoxColumn Content;
        private DataGridViewTextBoxColumn Timestamp;
        private Label lblHeading;
        private Button button1;
        private Button btnSend;
        private TextBox textBox1;
    }
}