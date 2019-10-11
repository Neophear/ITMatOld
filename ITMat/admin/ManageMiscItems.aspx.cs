using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stiig;

public partial class admin_ManageMiscItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@Name", txtNewItem.Text, System.Data.DbType.String);
        dal.ExecuteNonQuery("INSERT INTO ItemMiscType ([Name]) VALUES(@Name)");
        dal.ClearParameters();

        txtNewItem.Text = String.Empty;
        GridView2.DataBind();
    }
}