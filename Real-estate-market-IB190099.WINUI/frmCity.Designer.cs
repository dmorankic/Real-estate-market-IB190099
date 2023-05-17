namespace Real_estate_market_IB190099.WINUI
{
    partial class frmCity
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
            this.button1 = new System.Windows.Forms.Button();
            this.numInput1 = new System.Windows.Forms.NumericUpDown();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.txtCity = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.addNewCity = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.numInput1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(36, 30);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(141, 29);
            this.button1.TabIndex = 0;
            this.button1.Text = "get all cities";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // numInput1
            // 
            this.numInput1.Location = new System.Drawing.Point(36, 65);
            this.numInput1.Name = "numInput1";
            this.numInput1.Size = new System.Drawing.Size(141, 27);
            this.numInput1.TabIndex = 5;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(36, 98);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(141, 29);
            this.button2.TabIndex = 4;
            this.button2.Text = "get city by id";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(43, 144);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(134, 29);
            this.button3.TabIndex = 6;
            this.button3.Text = "button3";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // txtCity
            // 
            this.txtCity.Location = new System.Drawing.Point(43, 203);
            this.txtCity.Name = "txtCity";
            this.txtCity.Size = new System.Drawing.Size(125, 27);
            this.txtCity.TabIndex = 7;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(43, 180);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 20);
            this.label1.TabIndex = 8;
            this.label1.Text = "City name";
            // 
            // addNewCity
            // 
            this.addNewCity.Location = new System.Drawing.Point(45, 250);
            this.addNewCity.Name = "addNewCity";
            this.addNewCity.Size = new System.Drawing.Size(123, 29);
            this.addNewCity.TabIndex = 9;
            this.addNewCity.Text = "Add new city";
            this.addNewCity.UseVisualStyleBackColor = true;
            this.addNewCity.Click += new System.EventHandler(this.post);
            // 
            // frmCity
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(906, 512);
            this.Controls.Add(this.addNewCity);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtCity);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.numInput1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Name = "frmCity";
            this.Text = "frmCity";
            this.Load += new System.EventHandler(this.frmCity_Load);
            ((System.ComponentModel.ISupportInitialize)(this.numInput1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button button1;
        private NumericUpDown numInput1;
        private Button button2;
        private Button button3;
        private TextBox txtCity;
        private Label label1;
        private Button addNewCity;
    }
}