namespace ITMat_App.Forms
{
    partial class frmShowAllLoans
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
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvLoans = new System.Windows.Forms.DataGridView();
            this.stsLine = new System.Windows.Forms.StatusStrip();
            this.stslblBottom = new System.Windows.Forms.ToolStripStatusLabel();
            this.mnuTop = new System.Windows.Forms.MenuStrip();
            this.mnuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFileCreate = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFileSeperator = new System.Windows.Forms.ToolStripSeparator();
            this.mnuFileExit = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFilter = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFilterAll = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFilterActive = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFilterDone = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFilterOverdue = new System.Windows.Forms.ToolStripMenuItem();
            this.appShowAllLoansBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dsShowAllLoans = new ITMat_App.dsShowAllLoans();
            this.appShowAllLoansTableAdapter = new ITMat_App.dsShowAllLoansTableAdapters.AppShowAllLoansTableAdapter();
            this.iDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateFromDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateToDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.datePickedUpDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateReturnedDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MANR = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.outlookNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.mnuSearch = new System.Windows.Forms.ToolStripTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLoans)).BeginInit();
            this.stsLine.SuspendLayout();
            this.mnuTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.appShowAllLoansBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsShowAllLoans)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvLoans
            // 
            this.dgvLoans.AllowUserToAddRows = false;
            this.dgvLoans.AllowUserToDeleteRows = false;
            this.dgvLoans.AllowUserToResizeRows = false;
            dataGridViewCellStyle11.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(200)))), ((int)(((byte)(200)))));
            this.dgvLoans.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle11;
            this.dgvLoans.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvLoans.AutoGenerateColumns = false;
            this.dgvLoans.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLoans.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLoans.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iDDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn,
            this.dateFromDataGridViewTextBoxColumn,
            this.dateToDataGridViewTextBoxColumn,
            this.datePickedUpDataGridViewTextBoxColumn,
            this.dateReturnedDataGridViewTextBoxColumn,
            this.MANR,
            this.outlookNameDataGridViewTextBoxColumn});
            this.dgvLoans.DataSource = this.appShowAllLoansBindingSource;
            this.dgvLoans.Location = new System.Drawing.Point(0, 27);
            this.dgvLoans.MultiSelect = false;
            this.dgvLoans.Name = "dgvLoans";
            this.dgvLoans.ReadOnly = true;
            this.dgvLoans.RowHeadersVisible = false;
            dataGridViewCellStyle12.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(199)))), ((int)(((byte)(209)))), ((int)(((byte)(214)))));
            this.dgvLoans.RowsDefaultCellStyle = dataGridViewCellStyle12;
            this.dgvLoans.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvLoans.ShowEditingIcon = false;
            this.dgvLoans.Size = new System.Drawing.Size(1102, 261);
            this.dgvLoans.TabIndex = 0;
            this.dgvLoans.CellMouseDoubleClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgvLoans_CellMouseDoubleClick);
            // 
            // stsLine
            // 
            this.stsLine.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.stslblBottom});
            this.stsLine.Location = new System.Drawing.Point(0, 291);
            this.stsLine.Name = "stsLine";
            this.stsLine.Size = new System.Drawing.Size(1102, 22);
            this.stsLine.TabIndex = 1;
            this.stsLine.Text = "statusStrip1";
            // 
            // stslblBottom
            // 
            this.stslblBottom.Name = "stslblBottom";
            this.stslblBottom.Size = new System.Drawing.Size(74, 17);
            this.stslblBottom.Text = "stslblBottom";
            // 
            // mnuTop
            // 
            this.mnuTop.AllowMerge = false;
            this.mnuTop.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFile,
            this.mnuFilter,
            this.mnuSearch});
            this.mnuTop.Location = new System.Drawing.Point(0, 0);
            this.mnuTop.Name = "mnuTop";
            this.mnuTop.Size = new System.Drawing.Size(1102, 27);
            this.mnuTop.TabIndex = 2;
            this.mnuTop.Text = "mnuTop";
            // 
            // mnuFile
            // 
            this.mnuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFileCreate,
            this.mnuFileSeperator,
            this.mnuFileExit});
            this.mnuFile.Name = "mnuFile";
            this.mnuFile.Size = new System.Drawing.Size(41, 23);
            this.mnuFile.Text = "&Filer";
            // 
            // mnuFileCreate
            // 
            this.mnuFileCreate.Name = "mnuFileCreate";
            this.mnuFileCreate.Size = new System.Drawing.Size(152, 22);
            this.mnuFileCreate.Text = "&Opret";
            this.mnuFileCreate.Click += new System.EventHandler(this.mnuFileCreate_Click);
            // 
            // mnuFileSeperator
            // 
            this.mnuFileSeperator.Name = "mnuFileSeperator";
            this.mnuFileSeperator.Size = new System.Drawing.Size(149, 6);
            // 
            // mnuFileExit
            // 
            this.mnuFileExit.Name = "mnuFileExit";
            this.mnuFileExit.Size = new System.Drawing.Size(152, 22);
            this.mnuFileExit.Text = "&Luk";
            this.mnuFileExit.Click += new System.EventHandler(this.mnuFileExit_Click);
            // 
            // mnuFilter
            // 
            this.mnuFilter.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFilterAll,
            this.mnuFilterActive,
            this.mnuFilterDone,
            this.mnuFilterOverdue});
            this.mnuFilter.Name = "mnuFilter";
            this.mnuFilter.Size = new System.Drawing.Size(49, 23);
            this.mnuFilter.Text = "&Filtrér";
            // 
            // mnuFilterAll
            // 
            this.mnuFilterAll.Name = "mnuFilterAll";
            this.mnuFilterAll.Size = new System.Drawing.Size(152, 22);
            this.mnuFilterAll.Text = "&Alle";
            this.mnuFilterAll.Click += new System.EventHandler(this.mnuFilterAll_Click);
            // 
            // mnuFilterActive
            // 
            this.mnuFilterActive.Name = "mnuFilterActive";
            this.mnuFilterActive.Size = new System.Drawing.Size(152, 22);
            this.mnuFilterActive.Text = "A&ktive";
            this.mnuFilterActive.Click += new System.EventHandler(this.mnuFilterActive_Click);
            // 
            // mnuFilterDone
            // 
            this.mnuFilterDone.Name = "mnuFilterDone";
            this.mnuFilterDone.Size = new System.Drawing.Size(152, 22);
            this.mnuFilterDone.Text = "&Færdige";
            this.mnuFilterDone.Click += new System.EventHandler(this.mnuFilterDone_Click);
            // 
            // mnuFilterOverdue
            // 
            this.mnuFilterOverdue.Name = "mnuFilterOverdue";
            this.mnuFilterOverdue.Size = new System.Drawing.Size(152, 22);
            this.mnuFilterOverdue.Text = "&Over tid";
            this.mnuFilterOverdue.Click += new System.EventHandler(this.mnuFilterOverdue_Click);
            // 
            // appShowAllLoansBindingSource
            // 
            this.appShowAllLoansBindingSource.DataMember = "AppShowAllLoans";
            this.appShowAllLoansBindingSource.DataSource = this.dsShowAllLoans;
            // 
            // dsShowAllLoans
            // 
            this.dsShowAllLoans.DataSetName = "dsShowAllLoans";
            this.dsShowAllLoans.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // appShowAllLoansTableAdapter
            // 
            this.appShowAllLoansTableAdapter.ClearBeforeFill = true;
            // 
            // iDDataGridViewTextBoxColumn
            // 
            this.iDDataGridViewTextBoxColumn.DataPropertyName = "ID";
            this.iDDataGridViewTextBoxColumn.HeaderText = "Ordre";
            this.iDDataGridViewTextBoxColumn.Name = "iDDataGridViewTextBoxColumn";
            this.iDDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Type";
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // dateFromDataGridViewTextBoxColumn
            // 
            this.dateFromDataGridViewTextBoxColumn.DataPropertyName = "DateFrom";
            this.dateFromDataGridViewTextBoxColumn.HeaderText = "Fra";
            this.dateFromDataGridViewTextBoxColumn.Name = "dateFromDataGridViewTextBoxColumn";
            this.dateFromDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // dateToDataGridViewTextBoxColumn
            // 
            this.dateToDataGridViewTextBoxColumn.DataPropertyName = "DateTo";
            this.dateToDataGridViewTextBoxColumn.HeaderText = "Til";
            this.dateToDataGridViewTextBoxColumn.Name = "dateToDataGridViewTextBoxColumn";
            this.dateToDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // datePickedUpDataGridViewTextBoxColumn
            // 
            this.datePickedUpDataGridViewTextBoxColumn.DataPropertyName = "DatePickedUp";
            this.datePickedUpDataGridViewTextBoxColumn.HeaderText = "Afhentet";
            this.datePickedUpDataGridViewTextBoxColumn.Name = "datePickedUpDataGridViewTextBoxColumn";
            this.datePickedUpDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // dateReturnedDataGridViewTextBoxColumn
            // 
            this.dateReturnedDataGridViewTextBoxColumn.DataPropertyName = "DateReturned";
            this.dateReturnedDataGridViewTextBoxColumn.HeaderText = "Afleveret";
            this.dateReturnedDataGridViewTextBoxColumn.Name = "dateReturnedDataGridViewTextBoxColumn";
            this.dateReturnedDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // MANR
            // 
            this.MANR.DataPropertyName = "MANR";
            this.MANR.HeaderText = "MANR";
            this.MANR.Name = "MANR";
            this.MANR.ReadOnly = true;
            // 
            // outlookNameDataGridViewTextBoxColumn
            // 
            this.outlookNameDataGridViewTextBoxColumn.DataPropertyName = "OutlookName";
            this.outlookNameDataGridViewTextBoxColumn.HeaderText = "Kunde";
            this.outlookNameDataGridViewTextBoxColumn.Name = "outlookNameDataGridViewTextBoxColumn";
            this.outlookNameDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // mnuSearch
            // 
            this.mnuSearch.Name = "mnuSearch";
            this.mnuSearch.Size = new System.Drawing.Size(100, 23);
            this.mnuSearch.KeyUp += new System.Windows.Forms.KeyEventHandler(this.mnuSearch_KeyUp);
            // 
            // frmShowAllLoans
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1102, 313);
            this.Controls.Add(this.stsLine);
            this.Controls.Add(this.mnuTop);
            this.Controls.Add(this.dgvLoans);
            this.MainMenuStrip = this.mnuTop;
            this.Name = "frmShowAllLoans";
            this.Text = "Udlån";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmShowAllLoans_FormClosing);
            this.Load += new System.EventHandler(this.frmShowAllLoans_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLoans)).EndInit();
            this.stsLine.ResumeLayout(false);
            this.stsLine.PerformLayout();
            this.mnuTop.ResumeLayout(false);
            this.mnuTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.appShowAllLoansBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsShowAllLoans)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvLoans;
        private dsShowAllLoans dsShowAllLoans;
        private System.Windows.Forms.BindingSource appShowAllLoansBindingSource;
        private dsShowAllLoansTableAdapters.AppShowAllLoansTableAdapter appShowAllLoansTableAdapter;
        private System.Windows.Forms.StatusStrip stsLine;
        private System.Windows.Forms.ToolStripStatusLabel stslblBottom;
        private System.Windows.Forms.MenuStrip mnuTop;
        private System.Windows.Forms.ToolStripMenuItem mnuFile;
        private System.Windows.Forms.ToolStripMenuItem mnuFileCreate;
        private System.Windows.Forms.ToolStripSeparator mnuFileSeperator;
        private System.Windows.Forms.ToolStripMenuItem mnuFileExit;
        private System.Windows.Forms.ToolStripMenuItem mnuFilter;
        private System.Windows.Forms.ToolStripMenuItem mnuFilterAll;
        private System.Windows.Forms.ToolStripMenuItem mnuFilterActive;
        private System.Windows.Forms.ToolStripMenuItem mnuFilterDone;
        private System.Windows.Forms.ToolStripMenuItem mnuFilterOverdue;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateFromDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateToDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn datePickedUpDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateReturnedDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn MANR;
        private System.Windows.Forms.DataGridViewTextBoxColumn outlookNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.ToolStripTextBox mnuSearch;
    }
}