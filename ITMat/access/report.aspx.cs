using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Browser.Browser == "IE")
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Brug Chrome i stedet for IE da det fucker op i sidelayout');", true);
        }

        int LoanID;

        if (!Int32.TryParse(Request.QueryString["ID"], out LoanID))
        {
            Response.Redirect("~/Error.aspx?c=NoLoanID", true);
        }
        
        Title = "Ordre " + LoanID;

        DataAccessLayer dal = new DataAccessLayer();

        lblKTP.Text = "Mail: " + dal.ExecuteScalar("SELECT [Value] FROM [ITInfo] WHERE [Name] = 'KTP'").ToString();
        lblPhone.Text = "TLF: " + dal.ExecuteScalar("SELECT [Value] FROM [ITInfo] WHERE [Name] = 'Phonenr'").ToString();

        dal.AddParameter("@LoanID", LoanID, System.Data.DbType.Int32);
        DataTable LoanInfo = dal.ExecuteDataTable("SELECT * FROM [LoansCustomers] WHERE [ID] = @LoanID");
        dal.ClearParameters();

        if (LoanInfo.Rows.Count == 0)
        {
            Response.Redirect("~/Error.aspx?c=NoLoanID", true);
        }

        string FullName = String.Format("{0} {3}, {1} {2}", LoanInfo.Rows[0]["Stabsnummer"].ToString(), LoanInfo.Rows[0]["Firstname"].ToString(), LoanInfo.Rows[0]["Middlename"].ToString(), LoanInfo.Rows[0]["Lastname"].ToString());
        string comment = LoanInfo.Rows[0]["Comment"].ToString();
        MembershipUser createdBy = Membership.GetUser(LoanInfo.Rows[0]["CreatedBy"]);
        ProfileCommon createdByProfile = Profile.GetProfile(createdBy.UserName);

        lblOrderID.Text = LoanID.ToString();
        lblDate.Text = Convert.ToDateTime(LoanInfo.Rows[0]["CreatedDate"]).ToShortDateString();
        lblDateFrom.Text = Convert.ToDateTime(LoanInfo.Rows[0]["DateFrom"]).ToShortDateString();
        lblDateTo.Text = LoanInfo.Rows[0]["DateTo"] == DBNull.Value ? "" : Convert.ToDateTime(LoanInfo.Rows[0]["DateTo"]).ToShortDateString();
        lblUserName.Text = Utilities.GetOutlookName(createdByProfile);
        lblUserMail.Text = createdBy.Email;
        lblLoanType.Text = LoanInfo.Rows[0]["LoanType"].ToString();
        lblMANR.Text = LoanInfo.Rows[0]["MANR"].ToString();
        lblName.Text = FullName.Replace("  ", " ");
        lblUnit.Text = String.Format("{0} / {1} / {2}", LoanInfo.Rows[0]["MYN"].ToString(), LoanInfo.Rows[0]["ENH"].ToString(), LoanInfo.Rows[0]["AFD"].ToString());

        if (comment != String.Empty)
        {
            tblComment.Visible = true;
            lblComment.Text = comment.Replace("\n", "<br />");
        }
    }
    protected void gvDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            Label lblType = ((Label)e.Row.FindControl("lblType"));

            switch (DataBinder.Eval(e.Row.DataItem, "Type").ToString())
            {
                case "1":
                    lblType.Text = "Modem";
                    break;
                case "2":
                    lblType.Text = "Token";
                    break;
                case "3":
                    lblType.Text = "Bærbar";
                    break;
                case "4":
                    lblType.Text = "Printer";
                    break;
                case "5":
                    lblType.Text = "Projektor";
                    break;
                case "6":
                    lblType.Text = "USB-nøgle";
                    break;
                case "7":
                    lblType.Text = "Mobiltelefon";
                    break;
                case "8":
                    lblType.Text = "SIM-kort";
                    break;
                default:
                    break;
            }
        }
    }
}