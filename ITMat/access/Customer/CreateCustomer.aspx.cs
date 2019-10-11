using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class access_CreateCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtMANR.Attributes.Add("OnBlur", "ShowAvailability(this, 'MANR')");
            txtStabsnummer.Attributes.Add("OnBlur", "ShowAvailability(this, 'Stabsnummer')");

            if (Request.QueryString["MANR"] != null)
                txtMANR.Text = Utilities.CutText(Request.QueryString["MANR"], "", 10, false);
        }
    }
    protected void btnCreateCustomer_Click(object sender, EventArgs e)
    {
        Page.Validate();

        if (Page.IsValid)
        {
            DataAccessLayer dal = new DataAccessLayer();
            string lastID = "";

            dal.AddParameter("@MANR", txtMANR.Text, DbType.String);
            dal.AddParameter("@Stabsnummer", txtStabsnummer.Text.ToUpper(), DbType.String);
            dal.AddParameter("@Firstname", txtFirstname.Text, DbType.String);
            dal.AddParameter("@Middlename", txtMiddlename.Text, DbType.String);
            dal.AddParameter("@Lastname", txtLastname.Text, DbType.String);
            dal.AddParameter("@Phone", txtPhone.Text, DbType.String);
            dal.AddParameter("@MYN", txtMYN.Text, DbType.String);
            dal.AddParameter("@ENH", txtENH.Text, DbType.String);
            dal.AddParameter("@AFD", txtAFD.Text, DbType.String);
            dal.AddParameter("@Comment", txtComment.Text, DbType.String);
            dal.AddParameter("@CreatedBy", Membership.GetUser().ProviderUserKey, DbType.Guid);
            lastID = dal.ExecuteScalar("DECLARE @LastID INT;EXEC @LastID = dbo.[CreateCustomer] @MANR, @Stabsnummer, @Firstname, @Middlename, @Lastname, @Phone, @MYN, @ENH, @AFD, @Comment, @CreatedBy;SELECT @LastID").ToString();
            dal.ClearParameters();

            if (lastID == "0")
            {
                lblError.Text = "MANR eller Stabsnummer eksisterer allerede i databasen";
                lblError.Visible = true;
            }
            else
            {
                Response.Redirect("~/access/Customer/Customer.aspx?id=" + lastID);
            }
        }
    }
    
    [System.Web.Services.WebMethod]
    public static string CheckUser(string text, string fieldToCheck)
    {
        DataAccessLayer dal = new DataAccessLayer();
        string exists = "";

        if (fieldToCheck == "MANR")
        {
            dal.AddParameter("@MANR", text, DbType.String);
            exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Customers] WHERE [MANR] = @MANR) SELECT 'false' ELSE SELECT 'true'").ToString();
            dal.ClearParameters();
        }

        if (fieldToCheck == "Stabsnummer")
        {
            dal.AddParameter("@Stabsnummer", text, DbType.String);
            exists = dal.ExecuteScalar("IF EXISTS (SELECT * FROM [Customers] WHERE [Stabsnummer] = @Stabsnummer AND [Deleted] = 0) SELECT 'false' ELSE SELECT 'true'").ToString();
            dal.ClearParameters();
        }

        return exists;
    }
}