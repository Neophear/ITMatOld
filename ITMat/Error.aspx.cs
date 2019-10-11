using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string code = Request.QueryString["c"];

        switch (code)
        {
            case "WrongID":
                lblErrorMsg.Text = "Forkert ID";
                break;
            case "WrongType":
                lblErrorMsg.Text = "Forkert type";
                break;
            case "WrongFilter":
                lblErrorMsg.Text = "Forkert filter";
                break;
            case "NoLoanID":
                lblErrorMsg.Text = "Intet ordrenummer";
                break;
            case "NoID":
                lblErrorMsg.Text = "Det pågældende ID findes ikke";
                break;
            case "NoUser":
                lblErrorMsg.Text = "Brugeren eksisterer ikke";
                break;
            default:
                lblErrorMsg.Text = "Der skete en fejl";
                break;
        }
    }
}