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
    public partial class BookReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Books", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Books");
                    da.SelectCommand.CommandText = "SELECT * FROM Publishers";
                    da.Fill(ds, "Publishers");
                    BookReport report = new BookReport();
                    report.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = report;
                    report.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}