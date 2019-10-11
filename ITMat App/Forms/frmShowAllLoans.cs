using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ITMat_App.Forms
{
    public partial class frmShowAllLoans : Form
    {
        public frmShowAllLoans()
        {
            InitializeComponent();
        }

        //This is to make sure that when we Click on a 'New Single' menu on Parent form twice 
        //it should not open two instance of the same child form
        private static frmShowAllLoans m_frmShowAllLoans;
        public static frmShowAllLoans GetChildInstance()
        {
            if (m_frmShowAllLoans == null) //if not created yet, Create an instance
                m_frmShowAllLoans = new frmShowAllLoans();
            return m_frmShowAllLoans;  //just created or created earlier. Return it
        }

        private void frmShowAllLoans_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dsShowAllLoans.AppShowAllLoans' table. You can move, or remove it, as needed.
            this.appShowAllLoansTableAdapter.Fill(this.dsShowAllLoans.AppShowAllLoans);
            UpdateStatus();
        }

        private void UpdateStatus()
        {
            stslblBottom.Text = String.Format("{0} ordrer", dsShowAllLoans.AppShowAllLoans.Count);
        }

        private void dgvLoans_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex >= 0)
            {
                frmShowLoan objfrmShowLoan = new frmShowLoan((int)dgvLoans.CurrentRow.Cells[0].Value);
                objfrmShowLoan.MdiParent = this.ParentForm;
                objfrmShowLoan.Show();
            }
        }

        private void frmShowAllLoans_FormClosing(object sender, FormClosingEventArgs e)
        {
            m_frmShowAllLoans = null;
        }

        private void mnuFileExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //---------- Menu ----------
        #region Menu
        private void mnuFileCreate_Click(object sender, EventArgs e)
        {

        }

        private void mnuFilterAll_Click(object sender, EventArgs e)
        {
            try
            {
                this.appShowAllLoansTableAdapter.Fill(this.dsShowAllLoans.AppShowAllLoans);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

            UpdateStatus();
        }

        private void mnuFilterActive_Click(object sender, EventArgs e)
        {
            try
            {
                this.appShowAllLoansTableAdapter.FillActive(this.dsShowAllLoans.AppShowAllLoans);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

            UpdateStatus();
        }

        private void mnuFilterDone_Click(object sender, EventArgs e)
        {
            try
            {
                this.appShowAllLoansTableAdapter.FillDone(this.dsShowAllLoans.AppShowAllLoans);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
            UpdateStatus();
        }

        private void mnuFilterOverdue_Click(object sender, EventArgs e)
        {
            try
            {
                this.appShowAllLoansTableAdapter.FillOverdue(this.dsShowAllLoans.AppShowAllLoans);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
            UpdateStatus();
        }

        private void mnuSearch_KeyUp(object sender, KeyEventArgs e)
        {
            appShowAllLoansBindingSource.Filter = String.Format("MANR LIKE '%{0}%'", mnuSearch.Text);
        }
        #endregion
    }
}