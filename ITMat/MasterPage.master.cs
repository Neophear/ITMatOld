using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.ServerVariables["SERVER_NAME"].ToLower() != "itmat" && !Request.IsLocal)
        {
            //Response.Redirect("http://itmat" + Request.RawUrl);
        }

        if (Request.Browser.Browser == "IE")
        {
            lblFooter.Text = "Lavet af Stiig Gade<br />Brug Chrome! IE SUCKS!";
            Page.Title = "IE SUCKS! Brug Chrome!";
        }
    }
}