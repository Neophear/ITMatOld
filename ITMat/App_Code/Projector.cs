using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for Projector
/// </summary>
namespace Stiig
{
    public class Projector
    {
        public Projector()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Projector(string Serialnumber, string Brand, string Model, bool Discarded, string Comment)
        {
            this.Serialnumber = Serialnumber;
            this.Brand = Brand;
            this.Model = Model;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string Serialnumber { get; set; }
        public string Brand { get; set; }
        public string Model { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}