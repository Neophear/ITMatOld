using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ITMat_App.AppCode
{
    class clsMain
    {
        [STAThread]
        static void Main()
        {
            try
            {
                clsGlobal.g_objfrmMainWindow = new frmMainWindow();
                Application.Run(clsGlobal.g_objfrmMainWindow);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "My Best MDI",
                MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }
        //This is the Single Threaded Apartment Model(out of our scope)
        //of the application which will run the Main function
        //when the application starts
    }
}
