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
    public partial class frmShowLoan : Form
    {
        public frmShowLoan(int orderID)
        {
            InitializeComponent();

            Loan loan = new Loan(orderID);

            try
            {
                loan = new Loan(orderID);
            }
            catch (Loan.LoanDoesNotExistException)
            {
                MessageBox.Show("Ordren findes ikke");
                this.Close();
            }
            



            this.Text = "Ordre " + orderID;
        }
    }
}
