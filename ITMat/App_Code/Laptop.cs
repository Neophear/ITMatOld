using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Laptop
/// </summary>
namespace Stiig
{
    public class Laptop
    {
        public Laptop()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Laptop(string Serialnumber, string GUID, string Brand, string Model, bool FIIN, string Name, string Description, bool Discarded, string Comment)
        {
            this.Serialnumber = Serialnumber;
            this.GUID = GUID;
            this.Brand = Brand;
            this.Model = Model;
            this.FIIN = FIIN;
            this.Name = Name;
            this.Description = Description;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string Serialnumber { get; set; }
        public string GUID { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public bool FIIN { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}