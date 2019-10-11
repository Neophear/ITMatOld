using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        ProfileCommon userProfile = Profile.GetProfile(CreateUserWizard1.UserName);

        userProfile.Stabsnummer = ((TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtStabsnummer")).Text.ToUpper();
        userProfile.Firstname = ((TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtFirstname")).Text;
        userProfile.Middlename = ((TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtMiddlename")).Text;
        userProfile.Lastname = ((TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtLastname")).Text;

        userProfile.Save();

        Roles.AddUserToRole(CreateUserWizard1.UserName, "User");
    }
    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        CreateUserWizard1.Email = String.Format("{0}@fiin.dk", ((TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtStabsnummer")).Text.ToUpper());
    }
}