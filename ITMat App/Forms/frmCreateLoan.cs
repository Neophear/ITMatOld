using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Stiig;

namespace ITMat_App.Forms
{
    public partial class frmCreateLoan : Form
    {
        public frmCreateLoan()
        {
            InitializeComponent();
        }

        //Runs when the form loads
        private void frmCreateLoan_Load(object sender, EventArgs e)
        {
            DataAccessLayer dal = new DataAccessLayer();

            DataTable table = dal.ExecuteDataTable("SELECT * FROM [LoanType]");

            cmbLoanType.DataSource = table;
        }

        //This is to make sure that when we Click on a 'New Single' menu on Parent form twice 
        //it should not open two instance of the same child form
        private static frmCreateLoan m_frmCreateLoanForm;
        public static frmCreateLoan GetChildInstance()
        {
            if (m_frmCreateLoanForm == null) //if not created yet, Create an instance
                m_frmCreateLoanForm = new frmCreateLoan();
            return m_frmCreateLoanForm;  //just created or created earlier. Return it
        }

        private void btnGetCustomer_Click(object sender, EventArgs e)
        {
            GetCustomer();
        }

        private void GetCustomer()
        {
            try
            {
                Customer customer = new Customer(txtMANR.Text);
                txtOutlookName.Text = customer.OutlookName;
            }
            catch (ArgumentException)
            {
                MessageBox.Show("Det indtastede er ikke et gyldigt MANR");
            }
            catch (Customer.CustomerDoesNotExistException)
            {
                MessageBox.Show("Kunden findes ikke");
            }
        }

        private void frmCreateLoan_FormClosed(object sender, FormClosedEventArgs e)
        {
            m_frmCreateLoanForm = null;
        }

        protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
        {
            if (keyData == Keys.Escape)
            {
                this.Close();
                return true;
            }

            if (keyData == Keys.Enter)
            {
                if (txtMANR.Focused)
                {
                    GetCustomer();
                }
                return true;
            }

            return base.ProcessCmdKey(ref msg, keyData);
        }
    }
}