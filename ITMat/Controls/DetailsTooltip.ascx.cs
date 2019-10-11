using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailsTooltip : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private int loanID;
    public int LoanID
    {
        get
        {
            return loanID;
        }
        set
        {
            loanID = value;
            sdsDetails.SelectParameters["LoanID"].DefaultValue = loanID.ToString();
            sdsDetailsMisc.SelectParameters["LoanID"].DefaultValue = loanID.ToString();
            lblTooltipHeader.Text = "Ordre #" + loanID;
        }
    }

    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            Label lblType = ((Label)e.Row.FindControl("lblType"));

            switch (DataBinder.Eval(e.Row.DataItem, "Type").ToString())
            {
                case "1":
                    lblType.Text = "Modem";
                    break;
                case "2":
                    lblType.Text = "Token";
                    break;
                case "3":
                    lblType.Text = "Bærbar";
                    break;
                case "4":
                    lblType.Text = "Printer";
                    break;
                case "5":
                    lblType.Text = "Projektor";
                    break;
                case "6":
                    lblType.Text = "USB-nøgle";
                    break;
                case "7":
                    lblType.Text = "Mobiltelefon";
                    break;
                case "8":
                    lblType.Text = "SIM-kort";
                    break;
                default:
                    break;
            }
        }
    }
}