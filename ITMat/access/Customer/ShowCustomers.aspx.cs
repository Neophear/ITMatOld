using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class ShowCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string filter = Request.QueryString["filter"] == null ? String.Empty : Request.QueryString["filter"].ToLower();

            switch (filter)
            {
                case "active":
                    ViewState["SQL"] = "SELECT * FROM [Customers] WHERE [Deleted] = 0 AND ID IN (SELECT [CustomerRefID] FROM [Loans] WHERE [DateReturned] IS NULL AND [Deleted] = 0)";
                    break;
                case "inactive":
                    ViewState["SQL"] = "SELECT * FROM [Customers] WHERE [Deleted] = 0 AND ID NOT IN (SELECT [CustomerRefID] FROM [Loans] WHERE [DateReturned] IS NULL AND [Deleted] = 0)";
                    break;
                default:
                    ViewState["SQL"] = "SELECT * FROM [Customers] WHERE ([Deleted] = 0) ORDER BY [CreatedDate] DESC, [ID] DESC";
                    break;
            }
        }

        sdsCustomers.SelectCommand = ViewState["SQL"].ToString();

        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = new DataTable();

        dt = dal.ExecuteDataTable("SELECT (SELECT COUNT(*) FROM [Customers] WHERE [Deleted] = 0), (SELECT COUNT(*) FROM [Customers] WHERE [Deleted] = 0 AND ID IN (SELECT [CustomerRefID] FROM [Loans] WHERE [DateReturned] IS NULL AND [Deleted] = 0)), (SELECT COUNT(*) FROM [Customers] WHERE [Deleted] = 0 AND ID NOT IN (SELECT [CustomerRefID] FROM [Loans] WHERE [DateReturned] IS NULL AND [Deleted] = 0))");

        hplCountAll.Text = dt.Rows[0][0].ToString();
        hplCountActive.Text = dt.Rows[0][1].ToString();
        hplCountInactive.Text = dt.Rows[0][2].ToString();
    }
    protected void gvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string Location = "Customer.aspx?ID=" + DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
}