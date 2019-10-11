using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Stiig;

/// <summary>
/// Summary description for SIMcard
/// </summary>
namespace Stiig
{
    public class SIMcard
    {
        public SIMcard()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public SIMcard(string SIMcardnr)
        {
            this.SIMcardnr = SIMcardnr;
        }
        public SIMcard(string SIMcardnr, string Phonenr, string PUK, string PIN, bool Discarded, string Comment)
        {
            this.SIMcardnr = SIMcardnr;
            this.Phonenr = Phonenr;
            this.PUK = PUK;
            this.PIN = PIN;
            this.Discarded = Discarded;
            this.Comment = Comment;
        }

        public string SIMcardnr { get; set; }
        public string Phonenr { get; set; }
        public string PUK { get; set; }
        public string PIN { get; set; }
        public bool Discarded { get; set; }
        public string Comment { get; set; }
    }
}