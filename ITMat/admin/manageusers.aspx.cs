using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_manageusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Visible = false;
        if (!IsPostBack)
        {
            GridView2.DataSource = Membership.GetAllUsers();
            GridView2.DataBind();
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            string username = DataBinder.Eval(e.Row.DataItem, "Username").ToString();
            CheckBox chkbxApproved = ((CheckBox)e.Row.FindControl("chkbxApproved"));
            CheckBox chkbxAdmin = ((CheckBox)e.Row.FindControl("chkbxAdmin"));

            if (User.Identity.Name == username)
            {
                chkbxApproved.Enabled = false;
                chkbxAdmin.Enabled = false;
            }

            chkbxApproved.Checked = Membership.GetUser(username).IsApproved;
            chkbxAdmin.Checked = Roles.IsUserInRole(username, "Admin");
        }
    }

    private void UpdateUserAdmin(string username, bool setAdmin)
    {
        if (Roles.IsUserInRole(username, "Admin") && !setAdmin)
            Roles.RemoveUserFromRole(username, "Admin");
        else if (!Roles.IsUserInRole(username, "Admin") && setAdmin)
            Roles.AddUserToRole(username, "Admin");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView2.Rows)
        {
            string username = ((Label)row.FindControl("lblUsername")).Text;
            CheckBox chkbxApproved = ((CheckBox)row.FindControl("chkbxApproved"));
            CheckBox chkbxAdmin = ((CheckBox)row.FindControl("chkbxAdmin"));
            MembershipUser user = Membership.GetUser(username);

            user.IsApproved = chkbxApproved.Checked;
            Membership.UpdateUser(user);

            UpdateUserAdmin(username, chkbxAdmin.Checked);

            lblMsg.Text = "Brugere blev opdateret.";
            lblMsg.Visible = true;
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(txtMANR.Text);

        if (user == null)
        {
            ChangePasswordMessage("Brugeren findes ikke", true);
        }
        else
        {
            if (txtPassword.Text != txtPassword2.Text)
            {
                ChangePasswordMessage("Begge passwords skal være ens", true);
            }
            else
            {
                if (txtPassword.Text.Length < 6)
                {
                    ChangePasswordMessage("Password skal være minimum 6 tegn", true);
                }
                else
                {
                    bool passwordChanged = user.ChangePassword(user.ResetPassword(), txtPassword.Text);

                    if (passwordChanged)
                    {
                        ChangePasswordMessage("Password ændret", false);

                        txtPassword.Text = String.Empty;
                        txtPassword2.Text = String.Empty;
                    }
                    else
                    {
                        ChangePasswordMessage("Der skete en fejl. Prøv igen", true);
                    }
                }
            }
        }
    }

    public void ChangePasswordMessage(string message, bool error)
    {
        if (error)
            lblPasswordMsg.ForeColor = System.Drawing.Color.Red;
        else
            lblPasswordMsg.ForeColor = System.Drawing.Color.Empty;

        lblPasswordMsg.Text = message;
        lblPasswordMsg.Visible = true;
    }
}