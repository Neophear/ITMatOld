namespace ITMat_App.Forms
{
    partial class frmCreateLoan
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
            this.lblMANR = new System.Windows.Forms.Label();
            this.txtMANR = new System.Windows.Forms.TextBox();
            this.btnGetCustomer = new System.Windows.Forms.Button();
            this.txtOutlookName = new System.Windows.Forms.TextBox();
            this.dtpDateFrom = new System.Windows.Forms.DateTimePicker();
            this.lblDateFrom = new System.Windows.Forms.Label();
            this.lblDateTo = new System.Windows.Forms.Label();
            this.dtpDateTo = new System.Windows.Forms.DateTimePicker();
            this.cmbLoanType = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblMANR
            // 
            this.lblMANR.AutoSize = true;
            this.lblMANR.Location = new System.Drawing.Point(12, 15);
            this.lblMANR.Name = "lblMANR";
            this.lblMANR.Size = new System.Drawing.Size(39, 13);
            this.lblMANR.TabIndex = 0;
            this.lblMANR.Text = "MANR";
            // 
            // txtMANR
            // 
            this.txtMANR.Location = new System.Drawing.Point(57, 12);
            this.txtMANR.Name = "txtMANR";
            this.txtMANR.Size = new System.Drawing.Size(102, 20);
            this.txtMANR.TabIndex = 1;
            // 
            // btnGetCustomer
            // 
            this.btnGetCustomer.Location = new System.Drawing.Point(165, 11);
            this.btnGetCustomer.Name = "btnGetCustomer";
            this.btnGetCustomer.Size = new System.Drawing.Size(75, 20);
            this.btnGetCustomer.TabIndex = 2;
            this.btnGetCustomer.Text = "Hent kunde";
            this.btnGetCustomer.UseVisualStyleBackColor = true;
            this.btnGetCustomer.Click += new System.EventHandler(this.btnGetCustomer_Click);
            // 
            // txtOutlookName
            // 
            this.txtOutlookName.Location = new System.Drawing.Point(12, 38);
            this.txtOutlookName.Name = "txtOutlookName";
            this.txtOutlookName.ReadOnly = true;
            this.txtOutlookName.Size = new System.Drawing.Size(228, 20);
            this.txtOutlookName.TabIndex = 3;
            // 
            // dtpDateFrom
            // 
            this.dtpDateFrom.Location = new System.Drawing.Point(40, 64);
            this.dtpDateFrom.Name = "dtpDateFrom";
            this.dtpDateFrom.Size = new System.Drawing.Size(200, 20);
            this.dtpDateFrom.TabIndex = 4;
            // 
            // lblDateFrom
            // 
            this.lblDateFrom.AutoSize = true;
            this.lblDateFrom.Location = new System.Drawing.Point(12, 70);
            this.lblDateFrom.Name = "lblDateFrom";
            this.lblDateFrom.Size = new System.Drawing.Size(22, 13);
            this.lblDateFrom.TabIndex = 5;
            this.lblDateFrom.Text = "Fra";
            // 
            // lblDateTo
            // 
            this.lblDateTo.AutoSize = true;
            this.lblDateTo.Location = new System.Drawing.Point(12, 96);
            this.lblDateTo.Name = "lblDateTo";
            this.lblDateTo.Size = new System.Drawing.Size(18, 13);
            this.lblDateTo.TabIndex = 6;
            this.lblDateTo.Text = "Til";
            // 
            // dtpDateTo
            // 
            this.dtpDateTo.Location = new System.Drawing.Point(40, 90);
            this.dtpDateTo.Name = "dtpDateTo";
            this.dtpDateTo.Size = new System.Drawing.Size(200, 20);
            this.dtpDateTo.TabIndex = 7;
            // 
            // cmbLoanType
            // 
            this.cmbLoanType.DisplayMember = "Name";
            this.cmbLoanType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbLoanType.FormattingEnabled = true;
            this.cmbLoanType.Items.AddRange(new object[] {
            "-Vælg type-"});
            this.cmbLoanType.Location = new System.Drawing.Point(119, 116);
            this.cmbLoanType.Name = "cmbLoanType";
            this.cmbLoanType.Size = new System.Drawing.Size(121, 21);
            this.cmbLoanType.TabIndex = 8;
            this.cmbLoanType.ValueMember = "ID";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 119);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(35, 13);
            this.label1.TabIndex = 9;
            this.label1.Text = "label1";
            // 
            // frmCreateLoan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(520, 401);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmbLoanType);
            this.Controls.Add(this.dtpDateTo);
            this.Controls.Add(this.lblDateTo);
            this.Controls.Add(this.lblDateFrom);
            this.Controls.Add(this.dtpDateFrom);
            this.Controls.Add(this.txtOutlookName);
            this.Controls.Add(this.btnGetCustomer);
            this.Controls.Add(this.txtMANR);
            this.Controls.Add(this.lblMANR);
            this.Name = "frmCreateLoan";
            this.Text = "Opret udlån";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmCreateLoan_FormClosed);
            this.Load += new System.EventHandler(this.frmCreateLoan_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblMANR;
        private System.Windows.Forms.TextBox txtMANR;
        private System.Windows.Forms.Button btnGetCustomer;
        private System.Windows.Forms.TextBox txtOutlookName;
        private System.Windows.Forms.DateTimePicker dtpDateFrom;
        private System.Windows.Forms.Label lblDateFrom;
        private System.Windows.Forms.Label lblDateTo;
        private System.Windows.Forms.DateTimePicker dtpDateTo;
        private System.Windows.Forms.ComboBox cmbLoanType;
        private System.Windows.Forms.Label label1;
    }
}