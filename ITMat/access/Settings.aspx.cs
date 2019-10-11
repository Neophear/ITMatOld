using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class access_Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsgChangeMail.Visible = false;
        lblMsgChangeMail.ForeColor = System.Drawing.Color.Empty;
        lblChangePasswordMsg.Visible = false;
        lblChangePasswordMsg.ForeColor = System.Drawing.Color.Empty;

        if (!IsPostBack)
        {
            txtChangeMail.Text = Profile.Stabsnummer;
        }
    }
    protected void btnNewPassword_Click(object sender, EventArgs e)
    {
        if (txtNewPassword.Text != txtNewPassword2.Text)
        {
            SetMsgChangePassword("Begge nye passwords skal være ens!", true);
        }
        else
        {
            MembershipUser user = Membership.GetUser();
            bool passwordChanged = user.ChangePassword(txtOldPassword.Text, txtNewPassword.Text);

            if (passwordChanged)
                SetMsgChangePassword("Password blev ændret", false);
            else
                SetMsgChangePassword("Password blev ikke ændret. Kontroller dit gamle password og at det nye password overholder krav", true);
        }
    }
    private void SetMsgChangePassword(string text, bool isError)
    {
        lblChangePasswordMsg.Visible = true;
        lblChangePasswordMsg.Text = text;
        if (isError)
            lblChangePasswordMsg.ForeColor = System.Drawing.Color.Red;
    }
    protected void btnChangeMail_Click(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        string mail = txtChangeMail.Text + "@fiin.dk";

        if (Membership.GetUserNameByEmail(mail) != null && user.Email != mail)
        {
            SetMsgChangeMail("Mailen findes i forvejen!", true);
        }
        else
        {
            user.Email = mail;
            Membership.UpdateUser(user);
            Profile.Stabsnummer = txtChangeMail.Text;
            Profile.Save();
            SetMsgChangeMail("Mailen blev ændret", false);
        }
    }
    private void SetMsgChangeMail(string text, bool isError)
    {
        lblMsgChangeMail.Visible = true;
        lblMsgChangeMail.Text = text;
        if (isError)
            lblMsgChangeMail.ForeColor = System.Drawing.Color.Red;
    }
}