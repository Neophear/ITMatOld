using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class admin_ShowLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTime dateFrom = new DateTime();
            DateTime dateTo = new DateTime();
            bool error = false;

            if (Request.QueryString["df"] == null)
                dateFrom = DateTime.Today;
            else if (!DateTime.TryParse(Request.QueryString["df"], out dateFrom))
            {
                error = true;
                ShowError("Du skal indtaste en valid startdato");
            }

            if (Request.QueryString["dt"] == null)
                dateTo = DateTime.Today;
            else if (!DateTime.TryParse(Request.QueryString["dt"], out dateTo))
            {
                error = true;
                ShowError("Du skal indtaste en valid slutdato");
            }

            if (dateFrom > dateTo)
            {
                error = true;
                ShowError("Slutdatoen kan ikke komme før startdatoen");
            }

            if (!error)
            {
                txtDateFrom.Text = dateFrom.ToString("yyyy-MM-dd");
                txtDateTo.Text = dateTo.ToString("yyyy-MM-dd");

                sdsLog.SelectParameters["DateFrom"] = new Parameter("DateFrom", DbType.Date, dateFrom.ToShortDateString());
                sdsLog.SelectParameters["DateTo"] = new Parameter("DateTo", DbType.Date, dateTo.ToShortDateString());
            }
        }
    }
    protected void btnLoadLog_Click(object sender, EventArgs e)
    {
        bool error = false;
        DateTime dateFrom;
        DateTime dateTo;

        if (!DateTime.TryParse(txtDateFrom.Text, out dateFrom))
        {
            error = true;
            ShowError("Du skal indtaste en valid startdato");
        }

        if (!DateTime.TryParse(txtDateTo.Text, out dateTo))
        {
            error = true;
            ShowError("Du skal indtaste en valid slutdato");
        }

        if (dateFrom > dateTo)
        {
            error = true;
            ShowError("Slutdatoen kan ikke komme før startdatoen");
        }

        if (!error)
            Response.Redirect("~/admin/ShowLog.aspx?df=" + dateFrom.ToShortDateString() + "&dt=" + dateTo.ToShortDateString());
    }
    private void ShowError(string msg)
    {
        lblError.Text = msg;
        lblError.Visible = true;
    }
    protected void gvLog_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            int ItemID = (int)DataBinder.Eval(e.Row.DataItem, "ItemRefID");
            int ItemType = (int)DataBinder.Eval(e.Row.DataItem, "ItemTypeRefID");
            int ActionType = (int)DataBinder.Eval(e.Row.DataItem, "ActionRefID");

            if (ActionType != 2 || ItemType == 11 || ItemType == 12)
            {
                string Location = "";

                if (ItemType >= 1 && ItemType <= 8)
                    Location = ResolveUrl("~/access/Item/Item.aspx") + "?type=" + ItemType + "&ID=" + ItemID;
                else if (ItemType == 9)
                    Location = ResolveUrl("~/access/Customer/Customer.aspx") + "?ID=" + ItemID;
                else if (ItemType == 10)
                    Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + ItemID;
                else if (ItemType == 11 || ItemType == 12)
                {
                    string LoanID = DataBinder.Eval(e.Row.DataItem, "ItemID").ToString();
                    Location = ResolveUrl("~/access/Loan/LoanDetails.aspx") + "?ID=" + LoanID;
                }

                e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
                e.Row.Style["cursor"] = "pointer";
            }

            Guid userID = (Guid)DataBinder.Eval(e.Row.DataItem, "UserID");
            Label lblUser = (Label)e.Row.FindControl("lblUser");

            if (userID != Guid.Empty)
            {
                ProfileCommon profile = Profile.GetProfile(Membership.GetUser(userID).UserName);
                lblUser.Text = String.Format("{0} {1}.", profile.Firstname, profile.Lastname[0]);
            }
            else
            {
                lblUser.Text = "ITMat Edit tool";
            }
        }
    }
}