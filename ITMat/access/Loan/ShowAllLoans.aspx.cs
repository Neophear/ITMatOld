using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class ShowAllLoans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string filter = Request.QueryString["filter"] == null ? String.Empty : Request.QueryString["filter"].ToLower();

            switch (filter)
            {
                case "active":
                    ViewState["SQL"] = "SELECT * FROM [LoansCustomers] WHERE [DateReturned] IS NULL AND [FailedPickup] = 0 ORDER BY [ID] DESC";
                    break;
                case "done":
                    ViewState["SQL"] = "SELECT * FROM [LoansCustomers] WHERE [DateReturned] IS NOT NULL ORDER BY [ID] DESC";
                    break;
                case "overdue":
                    ViewState["SQL"] = "SELECT * FROM [LoansCustomers] WHERE [DateReturned] IS NULL AND [DateTo] IS NOT NULL AND CONVERT(DATE, [DateTo]) < CONVERT(DATE, GETDATE()) AND [FailedPickup] = 0 ORDER BY [ID] DESC";
                    break;
                default:
                    ViewState["SQL"] = "SELECT * FROM [LoansCustomers] ORDER BY [ID] DESC";
                    break;
            }
        }

        sdsLoans.SelectCommand = ViewState["SQL"].ToString();

        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = new DataTable();

        dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Loans] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [Loans] WHERE [Deleted] = 0 AND [DateReturned] IS NULL AND [FailedPickup] = 0), (SELECT COUNT(*) FROM [Loans] WHERE [Deleted] = 0 AND [DateReturned] IS NOT NULL), (SELECT COUNT(*) FROM [LoansCustomers] WHERE [DateReturned] IS NULL AND [DateTo] IS NOT NULL AND CONVERT(DATE, [DateTo]) < CONVERT(DATE, GETDATE()) AND [FailedPickup] = 0)");

        hplCountAll.Text = dt.Rows[0][0].ToString();
        hplCountActive.Text = dt.Rows[0][1].ToString();
        hplCountDone.Text = dt.Rows[0][2].ToString();
        hplCountOverdue.Text = dt.Rows[0][3].ToString();

        if (int.Parse(dt.Rows[0][3].ToString()) > 0)
        {
            hplCountOverdue.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
}