using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyButton : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private ButtonType type;
    public ButtonType Type
    {
        get
        {
            return type;
        }

        set
        {
            type = value;

            switch (value)
            {
                case ButtonType.Edit:
                    TheButton.AlternateText = "Rediger";
                    TheButton.ToolTip = "Rediger";
                    TheButton.CausesValidation = false;
                    TheButton.CommandName = "Edit";
                    TheButton.ImageUrl = "~/Images/icon_edit.png";
                    TheButton.OnClientClick = "";
                    TheButton.Enabled = true;
                    break;
                case ButtonType.Save:
                    TheButton.AlternateText = "Gem";
                    TheButton.ToolTip = "Gem";
                    TheButton.CausesValidation = true;
                    TheButton.CommandName = "Update";
                    TheButton.ImageUrl = "~/Images/icon_save.png";
                    TheButton.OnClientClick = "";
                    TheButton.Enabled = true;
                    break;
                case ButtonType.Delete:
                    TheButton.AlternateText = "Slet";
                    TheButton.ToolTip = "Slet";
                    TheButton.CausesValidation = false;
                    TheButton.CommandName = "Delete";
                    TheButton.ImageUrl = "~/Images/icon_delete.png";
                    TheButton.OnClientClick = "return confirm('Er du sikker på at du vil slette dette objekt?');";
                    TheButton.Enabled = true;
                    break;
                case ButtonType.Cancel:
                    TheButton.AlternateText = "Annuller";
                    TheButton.ToolTip = "Annuller";
                    TheButton.CausesValidation = false;
                    TheButton.CommandName = "Cancel";
                    TheButton.ImageUrl = "~/Images/icon_cancel.png";
                    TheButton.OnClientClick = "";
                    TheButton.Enabled = true;
                    break;
                case ButtonType.Mail:
                    TheButton.AlternateText = "Send mail";
                    TheButton.ToolTip = "Send mail";
                    TheButton.CausesValidation = false;
                    TheButton.CommandName = "SendMail";
                    TheButton.ImageUrl = "~/Images/icon_mail.png";
                    TheButton.OnClientClick = "";
                    TheButton.Enabled = true;
                    TheButton.Style.Remove("cursor");
                    break;
                case ButtonType.NoMail:
                    TheButton.AlternateText = "Send mail";
                    TheButton.ToolTip = "Send mail";
                    TheButton.CausesValidation = false;
                    TheButton.CommandName = "SendMail";
                    TheButton.ImageUrl = "~/Images/icon_mail_grey.png";
                    TheButton.OnClientClick = "";
                    TheButton.Enabled = false;
                    TheButton.Style.Add("cursor", "default");
                    break;
            }
        }
    }

    public bool Enabled
    {
        get
        {
            return TheButton.Enabled;
        }
        set
        {
            TheButton.Enabled = value;
        }
    }
    public enum ButtonType
    {
        Edit,
        Save,
        Delete,
        Cancel,
        Mail,
        NoMail
    }
}