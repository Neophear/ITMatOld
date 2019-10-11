using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class admin_ManageInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataAccessLayer dal = new DataAccessLayer();

            string guidelinesText = dal.ExecuteScalar("SELECT [Value] FROM [ITInfo] WHERE [Name] = 'Guidelines'").ToString();

            advtxtGuidelines.Text = guidelinesText;
        }
    }
    protected void btnGuidelines_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@Value", Utilities.StripHTML(advtxtGuidelines.Text), System.Data.DbType.String);
        dal.ExecuteNonQuery("UPDATE [ITInfo] SET [Value] = @Value WHERE [Name] = 'Guidelines'");
        dal.ClearParameters();

        lblGuidelinesSaved.Visible = true;
    }
}