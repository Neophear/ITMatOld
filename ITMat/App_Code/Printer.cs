using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Printer
/// </summary>
namespace Stiig
{
    public class Printer
    {
        public Printer()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Printer(string Serialnumber, string Brand, string Model, string Name, bool Discarded, string Comment)
        {
            this.Serialnumber = Serialnumber;
            this.Brand = Brand;
            this.Model = Model;
            this.Name = Name;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string Serialnumber { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public string Name { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}