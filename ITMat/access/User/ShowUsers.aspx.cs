using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class access_User_ShowUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable tblUsers = new DataTable();

        tblUsers.Columns.Add("ID", typeof(Guid));
        tblUsers.Columns.Add("MANR", typeof(string));
        tblUsers.Columns.Add("Stabsnummer", typeof(string));
        tblUsers.Columns.Add("Firstname", typeof(string));
        tblUsers.Columns.Add("Middlename", typeof(string));
        tblUsers.Columns.Add("Lastname", typeof(string));
        tblUsers.Columns.Add("Email", typeof(string));

        foreach (MembershipUser user in Membership.GetAllUsers())
        {
            ProfileCommon userProfile = Profile.GetProfile(user.UserName);
            tblUsers.Rows.Add(user.ProviderUserKey, user.UserName, userProfile.Stabsnummer, userProfile.Firstname, userProfile.Middlename, userProfile.Lastname, user.Email);
        }

        gvUsers.DataSource = tblUsers;
        gvUsers.DataBind();
    }
    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string Location = "User.aspx?ID=" + DataBinder.Eval(e.Row.DataItem, "ID").ToString();
            e.Row.Attributes["onClick"] = string.Format("javascript:window.location='{0}';", Location);
            e.Row.Style["cursor"] = "pointer";
        }
    }
}