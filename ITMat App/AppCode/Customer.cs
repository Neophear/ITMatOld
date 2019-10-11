using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    private int id;
    private string manr;
    private string stabsnummer;
    private string firstname;
    private string middlename;
    private string lastname;
    private string phonenr;
    private string myn;
    private string enh;
    private string afd;
    private string comment;

    public int ID
    {
        get { return id; }
        set { id = value; }
    }
    public string MANR
    {
        get { return manr; }
        set { manr = value; }
    }
    public string Stabsnummer
    {
        get { return stabsnummer; }
        set { stabsnummer = value.ToUpper(); }
    }
    public string Firstname
    {
        get { return firstname; }
        set { firstname = value; }
    }
    public string Middlename
    {
        get { return middlename; }
        set { middlename = value; }
    }
    public string Lastname
    {
        get { return lastname; }
        set { lastname = value; }
    }
    public string OutlookName
    {
        get
        {
            return String.Format("{0} {1}, {2} {3}", stabsnummer, lastname, firstname, middlename);
        }
    }
    public string Phonenr
    {
        get { return phonenr; }
        set { phonenr = value; }
    }
    public string MYN
    {
        get { return myn; }
        set { myn = value.ToUpper(); }
    }
    public string ENH
    {
        get { return enh; }
        set { enh = value.ToUpper(); }
    }
    public string AFD
    {
        get { return afd; }
        set { afd = value.ToUpper(); }
    }
    public string Comment
    {
        get { return comment; }
        set { comment = value; }
    }

	public Customer()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Gets a customer from MANR
    /// </summary>
    /// <param name="MANR">The MANR</param>
    public Customer(string MANR)
    {
        int intMANR = 0;

        if (int.TryParse(MANR, out intMANR))
        {
            DataAccessLayer dal = new DataAccessLayer();

            dal.AddParameter("@MANR", intMANR, DbType.Int32);
            DataTable table = dal.ExecuteDataTable("SELECT * FROM [Customers] WHERE [MANR] = @MANR");
            dal.ClearParameters();

            if (table.Rows.Count != 0)
                CreateFromTable(table);
            else
                throw new CustomerDoesNotExistException();
        }
        else
            throw new ArgumentException("The MANR is not a valid number");
    }

    /// <summary>
    /// Gets the Customer from the Database
    /// </summary>
    /// <param name="ID">The ID of the customer to retrieve</param>
    public Customer(int ID)
    {
        DataAccessLayer dal = new DataAccessLayer();

        dal.AddParameter("@ID", ID, DbType.Int32);
        DataTable table = dal.ExecuteDataTable("SELECT * FROM [Customers] WHERE [ID] = @ID");
        dal.ClearParameters();

        if (table != null)
            CreateFromTable(table);
        else
            throw new CustomerDoesNotExistException();
    }

    private void CreateFromTable(DataTable table)
    {
        id = (int)table.Rows[0]["ID"];
        manr = table.Rows[0]["MANR"].ToString();
        stabsnummer = table.Rows[0]["Stabsnummer"].ToString();
        firstname = table.Rows[0]["Firstname"].ToString();
        middlename = table.Rows[0]["Middlename"].ToString();
        lastname = table.Rows[0]["Lastname"].ToString();
        phonenr = table.Rows[0]["Phone"].ToString();
        myn = table.Rows[0]["MYN"].ToString();
        enh = table.Rows[0]["ENH"].ToString();
        afd = table.Rows[0]["AFD"].ToString();
        comment = table.Rows[0]["Comment"].ToString();
    }

    /// <summary>
    /// Exception for if the customer doesn't exist
    /// </summary>
    public class CustomerDoesNotExistException : Exception
    {
        public CustomerDoesNotExistException()
        {

        }

        public override string Message
        {
            get
            {
                return "The Customer doesn't exist";
            }
        }
    }
}