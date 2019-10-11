namespace ITMat_App
{
    partial class frmMainWindow
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
            this.menuMain = new System.Windows.Forms.MenuStrip();
            this.mnuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFileSettings = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuFileLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.mnuFileExit = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuLoan = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuLoanShow = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuLoanNew = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuWindow = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuWindowCascade = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuWindowVertical = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuWindowHorizontal = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuHelpAbout = new System.Windows.Forms.ToolStripMenuItem();
            this.menuMain.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuMain
            // 
            this.menuMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFile,
            this.mnuLoan,
            this.mnuWindow,
            this.mnuHelp});
            this.menuMain.Location = new System.Drawing.Point(0, 0);
            this.menuMain.MdiWindowListItem = this.mnuWindow;
            this.menuMain.Name = "menuMain";
            this.menuMain.Size = new System.Drawing.Size(1189, 24);
            this.menuMain.TabIndex = 1;
            this.menuMain.Text = "menuMain";
            // 
            // mnuFile
            // 
            this.mnuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuFileSettings,
            this.mnuFileLogout,
            this.toolStripMenuItem1,
            this.mnuFileExit});
            this.mnuFile.Name = "mnuFile";
            this.mnuFile.Size = new System.Drawing.Size(41, 20);
            this.mnuFile.Text = "&Filer";
            // 
            // mnuFileSettings
            // 
            this.mnuFileSettings.Name = "mnuFileSettings";
            this.mnuFileSettings.Size = new System.Drawing.Size(136, 22);
            this.mnuFileSettings.Text = "&Indstillinger";
            this.mnuFileSettings.Click += new System.EventHandler(this.mnuFileSettings_Click);
            // 
            // mnuFileLogout
            // 
            this.mnuFileLogout.Name = "mnuFileLogout";
            this.mnuFileLogout.Size = new System.Drawing.Size(136, 22);
            this.mnuFileLogout.Text = "&Log ud";
            this.mnuFileLogout.Click += new System.EventHandler(this.mnuFileLogout_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(133, 6);
            // 
            // mnuFileExit
            // 
            this.mnuFileExit.Name = "mnuFileExit";
            this.mnuFileExit.Size = new System.Drawing.Size(136, 22);
            this.mnuFileExit.Text = "&Afslut";
            this.mnuFileExit.Click += new System.EventHandler(this.mnuFileExit_Click);
            // 
            // mnuLoan
            // 
            this.mnuLoan.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuLoanShow,
            this.mnuLoanNew});
            this.mnuLoan.Name = "mnuLoan";
            this.mnuLoan.Size = new System.Drawing.Size(50, 20);
            this.mnuLoan.Text = "&Udlån";
            // 
            // mnuLoanShow
            // 
            this.mnuLoanShow.Name = "mnuLoanShow";
            this.mnuLoanShow.Size = new System.Drawing.Size(152, 22);
            this.mnuLoanShow.Text = "Se &alle udlån";
            this.mnuLoanShow.Click += new System.EventHandler(this.mnuLoanShowAll_Click);
            // 
            // mnuLoanNew
            // 
            this.mnuLoanNew.Name = "mnuLoanNew";
            this.mnuLoanNew.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.N)));
            this.mnuLoanNew.Size = new System.Drawing.Size(152, 22);
            this.mnuLoanNew.Text = "&Opret";
            this.mnuLoanNew.Click += new System.EventHandler(this.mnuLoanNew_Click);
            // 
            // mnuWindow
            // 
            this.mnuWindow.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuWindowCascade,
            this.mnuWindowVertical,
            this.mnuWindowHorizontal});
            this.mnuWindow.Name = "mnuWindow";
            this.mnuWindow.Size = new System.Drawing.Size(56, 20);
            this.mnuWindow.Text = "&Vindue";
            // 
            // mnuWindowCascade
            // 
            this.mnuWindowCascade.Name = "mnuWindowCascade";
            this.mnuWindowCascade.Size = new System.Drawing.Size(129, 22);
            this.mnuWindowCascade.Text = "&Kaskade";
            this.mnuWindowCascade.Click += new System.EventHandler(this.mnuWindowCascade_Click);
            // 
            // mnuWindowVertical
            // 
            this.mnuWindowVertical.Name = "mnuWindowVertical";
            this.mnuWindowVertical.Size = new System.Drawing.Size(129, 22);
            this.mnuWindowVertical.Text = "&Vertikal";
            this.mnuWindowVertical.Click += new System.EventHandler(this.mnuWindowVertical_Click);
            // 
            // mnuWindowHorizontal
            // 
            this.mnuWindowHorizontal.Name = "mnuWindowHorizontal";
            this.mnuWindowHorizontal.Size = new System.Drawing.Size(129, 22);
            this.mnuWindowHorizontal.Text = "&Horisontal";
            this.mnuWindowHorizontal.Click += new System.EventHandler(this.mnuWindowHorizontal_Click);
            // 
            // mnuHelp
            // 
            this.mnuHelp.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuHelpAbout});
            this.mnuHelp.Name = "mnuHelp";
            this.mnuHelp.Size = new System.Drawing.Size(51, 20);
            this.mnuHelp.Text = "Hjælp";
            // 
            // mnuHelpAbout
            // 
            this.mnuHelpAbout.Name = "mnuHelpAbout";
            this.mnuHelpAbout.Size = new System.Drawing.Size(162, 22);
            this.mnuHelpAbout.Text = "&Om ITMat App...";
            this.mnuHelpAbout.Click += new System.EventHandler(this.mnuHelpAbout_Click);
            // 
            // frmMainWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1189, 616);
            this.Controls.Add(this.menuMain);
            this.IsMdiContainer = true;
            this.KeyPreview = true;
            this.MainMenuStrip = this.menuMain;
            this.Name = "frmMainWindow";
            this.Text = "ITMat App";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmMainWindow_KeyDown);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.frmMainWindow_KeyPress);
            this.menuMain.ResumeLayout(false);
            this.menuMain.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuMain;
        private System.Windows.Forms.ToolStripMenuItem mnuFile;
        private System.Windows.Forms.ToolStripMenuItem mnuFileLogout;
        private System.Windows.Forms.ToolStripMenuItem mnuFileSettings;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem mnuFileExit;
        private System.Windows.Forms.ToolStripMenuItem mnuLoan;
        private System.Windows.Forms.ToolStripMenuItem mnuLoanShow;
        private System.Windows.Forms.ToolStripMenuItem mnuLoanNew;
        private System.Windows.Forms.ToolStripMenuItem mnuWindow;
        private System.Windows.Forms.ToolStripMenuItem mnuHelp;
        private System.Windows.Forms.ToolStripMenuItem mnuHelpAbout;
        private System.Windows.Forms.ToolStripMenuItem mnuWindowCascade;
        private System.Windows.Forms.ToolStripMenuItem mnuWindowVertical;
        private System.Windows.Forms.ToolStripMenuItem mnuWindowHorizontal;
    }
}

