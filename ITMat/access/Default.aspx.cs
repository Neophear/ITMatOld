using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class access_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorOrder.Visible = false;
        lblErrorMANR.Visible = false;

        DataAccessLayer dal = new DataAccessLayer();
        string guidelinesText = dal.ExecuteScalar("SELECT [Value] FROM [ITInfo] WHERE [Name] = 'Guidelines'").ToString();

        lblGuidelinesText.Text = Utilities.BBToHTML(guidelinesText);
    }
    protected void btnGoToOrder_Click(object sender, EventArgs e)
    {
        int ID;

        if (int.TryParse(txtOrderID.Text, out ID))
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@ID", ID, System.Data.DbType.Int32);
            string exists = dal.ExecuteScalar("IF EXISTS (SELECT DISTINCT * FROM [Loans] WHERE [ID] = @ID AND [Deleted] = 0) SELECT 1 ELSE SELECT 0").ToString();

            if (exists == "1")
            {
                Response.Redirect("~/access/Loan/LoanDetails.aspx?ID=" + ID);
            }
            else
            {
                lblErrorOrder.Text = "Ordrenummeret eksisterer ikke";
                lblErrorOrder.Visible = true;
            }
        }
        else
        {
            lblErrorOrder.Text = "Du skal skrive et tal";
            lblErrorOrder.Visible = true;
        }
    }
    protected void btnGoToMANR_Click(object sender, EventArgs e)
    {
        int MANR;

        if (int.TryParse(txtMANR.Text, out MANR))
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@MANR", MANR, System.Data.DbType.Int32);
            object MANRID = dal.ExecuteScalar("SELECT [ID] FROM [Customers] WHERE [MANR] = @MANR AND [Deleted] = 0");

            if (MANRID != null)
            {
                Response.Redirect("~/access/Customer/Customer.aspx?ID=" + MANRID.ToString());
            }
            else
            {
                lblErrorMANR.Text = "MANR eksisterer ikke";
                lblErrorMANR.Visible = true;

                hplCreateCustomer.NavigateUrl = ResolveClientUrl("~/access/Customer/CreateCustomer.aspx?MANR=" + MANR);
                hplCreateCustomer.Visible = true;
            }
        }
        else
        {
            lblErrorMANR.Text = "Du skal skrive et tal";
            lblErrorMANR.Visible = true;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/access/search.aspx?s=" + txtSearchQuery.Text);
    }
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";

            //---------Mark as red if older than today

            string DateItemToGet = ((GridView)sender).ID == "gvLoansIn" ? "DateTo" : "DateFrom";
            DateTime date = (DateTime)DataBinder.Eval(e.Row.DataItem, DateItemToGet);
            
            if (date < DateTime.Today)
            {
                e.Row.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}