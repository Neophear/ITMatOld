using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class access_User_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid userID = new Guid();

        if (!Guid.TryParse(Request.QueryString["ID"], out userID))
        {
            Response.Redirect("~/Error.aspx?c=WrongID");
        }

        MembershipUser user = Membership.GetUser(userID);

        if (user == null)
        {
            Response.Redirect("~/Error.aspx?c=NoUser");
        }

        ProfileCommon userProfile = Profile.GetProfile(user.UserName);
        DataTable tblUser = new DataTable();
        tblUser.Columns.Add("ID", typeof(Guid));
        tblUser.Columns.Add("Stabsnummer", typeof(string));
        tblUser.Columns.Add("MANR", typeof(string));
        tblUser.Columns.Add("HasCustomer", typeof(bool));
        tblUser.Columns.Add("CustomerID", typeof(string));
        tblUser.Columns.Add("Firstname", typeof(string));
        tblUser.Columns.Add("Middlename", typeof(string));
        tblUser.Columns.Add("Lastname", typeof(string));
        tblUser.Columns.Add("Email", typeof(string));

        DataAccessLayer dal = new DataAccessLayer();
        dal.AddParameter("@MANR", user.UserName, DbType.String);
        object ID = dal.ExecuteScalar("SELECT [ID] FROM [Customers] WHERE [MANR] = @MANR");
        bool HasCustomer = false;

        HasCustomer = ID != null;

        tblUser.Rows.Add(user.ProviderUserKey, userProfile.Stabsnummer, user.UserName, HasCustomer, (HasCustomer ? ID.ToString() : ""), userProfile.Firstname, userProfile.Middlename, userProfile.Lastname, user.Email);

        dvUser.DataSource = tblUser;
        dvUser.DataBind();
    }
    protected void gvLoans_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Loan/LoanDetails.aspx" + "?ID=" + ID);
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
    protected void gvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string Location = ResolveUrl("~/access/Customer/Customer.aspx?ID=" + DataBinder.Eval(e.Row.DataItem, "ID").ToString());
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
    protected void Gridview_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        int type = 0;

        switch (((GridView)sender).ID)
        {
            case "gvModem":
                type = 1;
                break;
            case "gvToken":
                type = 2;
                break;
            case "gvLaptop":
                type = 3;
                break;
            case "gvPrinter":
                type = 4;
                break;
            case "gvProjector":
                type = 5;
                break;
            case "gvUSBkey":
                type = 6;
                break;
            case "gvPhone":
                type = 7;
                break;
            case "gvSIMcard":
                type = 8;
                break;
            default:
                break;
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string ID = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            string Location = ResolveUrl("~/access/Item/Item.aspx") + "?type=" + type + "&ID=" + ID;
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
}