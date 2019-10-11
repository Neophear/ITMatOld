using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class Customer : System.Web.UI.Page
{
    private int CustomerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;

        if (!int.TryParse(Request.QueryString["ID"], out CustomerID) || dvCustomer.Rows.Count == 0)
            Response.Redirect("~/Error.aspx?c=NoID", true);
    }
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";

            //---------Mark as red if failed pickup

            bool FailedPickup = (bool)DataBinder.Eval(e.Row.DataItem, "FailedPickup");

            if (FailedPickup)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
    protected void dvCustomer_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();
        string errors = "";

        e.NewValues["Stabsnummer"] = e.NewValues["Stabsnummer"].ToString().ToUpper();

        dal.AddParameter("@MANR", e.NewValues["MANR"], System.Data.DbType.String);
        dal.AddParameter("@Stabsnummer", e.NewValues["Stabsnummer"], System.Data.DbType.String);
        dal.AddParameter("@ID", CustomerID, System.Data.DbType.Int32);
        errors = dal.ExecuteScalar("DECLARE @errors VARCHAR(2);EXEC @errors = dbo.CustomerExists @MANR, @Stabsnummer, @ID;SELECT @errors").ToString();
        dal.ClearParameters();

        if (errors != "0")
        {
            lblError.Text = Utilities.GetErrorMsg(errors);
            lblError.Visible = true;
            e.Cancel = true;
        }

        e.NewValues["UserID"] = Membership.GetUser().ProviderUserKey;

        string changedNote = "";

        if (!Utilities.CompareValues(e.OldValues["MANR"], e.NewValues["MANR"]))
            changedNote += "MANR, ";
        if (!Utilities.CompareValues(e.OldValues["Stabsnummer"], e.NewValues["Stabsnummer"]))
            changedNote += "Stabsnummer, ";
        if (!Utilities.CompareValues(e.OldValues["Firstname"], e.NewValues["Firstname"]))
            changedNote += "Fornavn, ";
        if (!Utilities.CompareValues(e.OldValues["Middlename"], e.NewValues["Middlename"]))
            changedNote += "Mellemnavn, ";
        if (!Utilities.CompareValues(e.OldValues["Lastname"], e.NewValues["Lastname"]))
            changedNote += "Efternavn, ";
        if (!Utilities.CompareValues(e.OldValues["Phone"], e.NewValues["Phone"]))
            changedNote += "Telefonnr, ";
        if (!Utilities.CompareValues(e.OldValues["MYN"], e.NewValues["MYN"]))
            changedNote += "MYN, ";
        if (!Utilities.CompareValues(e.OldValues["ENH"], e.NewValues["ENH"]))
            changedNote += "ENH, ";
        if (!Utilities.CompareValues(e.OldValues["AFD"], e.NewValues["AFD"]))
            changedNote += "AFD, ";
        if (!Utilities.CompareValues(e.OldValues["Comment"], e.NewValues["Comment"]))
            changedNote += "Bemærkninger, ";

        changedNote = Utilities.RemoveEndString(changedNote, ", ");

        e.NewValues["Note"] = changedNote;
    }
    protected void dvCustomer_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        e.Keys["DeletedBy"] = Membership.GetUser().ProviderUserKey;
    }
    protected void dvCustomer_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        Response.Redirect("~/access/Customer/ShowCustomers.aspx", true);
    }
}