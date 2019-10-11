using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ITMat_App.Forms;
using ITMat_App.AppCode;

namespace ITMat_App
{
    public partial class frmMainWindow : Form
    {
        bool capture = false;
        StringBuilder builder = new StringBuilder();
        Timer captureTimer = new Timer();

        public frmMainWindow()
        {
            InitializeComponent();
            captureTimer.Tick += captureTimer_Tick;
            captureTimer.Interval = 200;
        }

        void captureTimer_Tick(object sender, EventArgs e)
        {
            capture = false;
            captureTimer.Stop();
        }

        private void frmMainWindow_KeyDown(object sender, KeyEventArgs e)
        {
            #region Capture key
            if (e.Modifiers == Keys.Control && e.KeyCode == Keys.B)
            {
                capture = true;
                captureTimer.Start();
                builder.Clear();
                e.SuppressKeyPress = true;
            }
            else if (e.Modifiers == Keys.Control && e.KeyCode == Keys.C)
            {
                if (capture)
                {
                    capture = false;
                    string[] code = builder.ToString().Split('+');

                    RunCode(code);

                    builder.Clear();
                    e.SuppressKeyPress = true;
                }
            }
            #endregion
        }

        private void RunCode(string[] code)
        {
            switch (code[0])
            {
                case "ORDER":
                    string orderIDstring = code[1];
                    int orderID = 0;

                    if (int.TryParse(orderIDstring, out orderID))
                    {
                        frmShowLoan objfrmShowLoan = new frmShowLoan(orderID);
                        objfrmShowLoan.MdiParent = this;
                        objfrmShowLoan.Show();
                    }
                    else
                        MessageBox.Show("Ikke et valid ordrenummer");
                    break;
                case "USER":
                    MessageBox.Show("Now logged in as " + code[1]);
                    break;
                default:
                    break;
            }
        }

        private void frmMainWindow_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (capture)
            {
                builder.Append(e.KeyChar);
                e.Handled = true;
            }
        }

        //----------File menu----------
        #region File menu
        private void mnuFileSettings_Click(object sender, EventArgs e)
        {

        }

        private void mnuFileLogout_Click(object sender, EventArgs e)
        {

        }

        private void mnuFileExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        #endregion

        //----------Loan menu----------
        #region Loan menu
        private void mnuLoanShowAll_Click(object sender, EventArgs e)
        {
            frmShowAllLoans objfrmShowAllLoans = frmShowAllLoans.GetChildInstance();
            objfrmShowAllLoans.MdiParent = this;
            objfrmShowAllLoans.Show();
            objfrmShowAllLoans.BringToFront();
        }

        private void mnuLoanNew_Click(object sender, EventArgs e)
        {
            frmCreateLoan objfrmCreateLoan = frmCreateLoan.GetChildInstance();
            objfrmCreateLoan.MdiParent = this;
            objfrmCreateLoan.Show();
            objfrmCreateLoan.BringToFront();
        }
        #endregion

        //----------Window menu----------
        #region Window menu
        private void mnuWindowCascade_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.Cascade);
        }

        private void mnuWindowVertical_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileVertical);
        }

        private void mnuWindowHorizontal_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileHorizontal);
        }
        #endregion

        //----------Help menu----------
        #region Help menu
        private void mnuHelpAbout_Click(object sender, EventArgs e)
        {
            frmAbout objfrmAbout = new frmAbout();
            objfrmAbout.ShowDialog();
        }
        #endregion
    }
}