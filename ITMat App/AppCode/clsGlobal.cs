using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ITMat_App.AppCode
{
    public sealed class clsGlobal
    {
        public static frmMainWindow g_objfrmMainWindow;
        //this is to declare a global static reference to our MDI parent so that the same 
        //instance is referred across all child with no extra line of code
    }
}