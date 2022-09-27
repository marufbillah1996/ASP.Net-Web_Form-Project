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
    public partial class GroupReportAllTable : System.Web.UI.Page
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
                        da.SelectCommand.CommandText = "SELECT * FROM Customers";
                        da.Fill(ds, "Customers");
                        da.SelectCommand.CommandText = "SELECT * FROM Genres";
                        da.Fill(ds, "Genres");
                        da.SelectCommand.CommandText = "SELECT * FROM Publishers";
                        da.Fill(ds, "Publishers");
                        da.SelectCommand.CommandText = "SELECT * FROM Sales";
                        da.Fill(ds, "Sales");
                        da.SelectCommand.CommandText = "SELECT * FROM SalesDetails";
                        da.Fill(ds, "SalesDetails");
                        GroupReports report = new GroupReports();
                        report.SetDataSource(ds);
                        this.CrystalReportViewer1.ReportSource = report;
                        report.Refresh();
                        this.CrystalReportViewer1.RefreshReport();
                    }
                }
            
        }
    }
}