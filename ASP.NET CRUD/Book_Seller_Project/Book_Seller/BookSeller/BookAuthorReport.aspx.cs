using Book_Seller.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller.BookSeller
{
    public partial class BookAuthorReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Authors", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Authors");
                    da.SelectCommand.CommandText = "SELECT * FROM BookAuthors";
                    da.Fill(ds, "BookAuthors");
                    da.SelectCommand.CommandText = "SELECT * FROM Books";
                    da.Fill(ds, "Books");
                    BookAuthorsReport report = new BookAuthorsReport();
                    report.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = report;
                    report.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}