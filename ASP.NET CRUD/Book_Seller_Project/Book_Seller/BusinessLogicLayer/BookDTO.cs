using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_Seller.BusinessLogicLayer
{
    public class BookDTO
    {
        public int BookID { get; set; }
        public string Title { get; set; }
        public int GenreID { get; set; }
        public decimal Price { get; set; }
        public DateTime PublishDate { get; set; }
        public Boolean Available { get; set; }
        public int PublisherID { get; set; }
    }
}