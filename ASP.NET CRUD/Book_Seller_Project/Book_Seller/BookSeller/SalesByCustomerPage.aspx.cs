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
    public partial class SalesByCustomerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Sales", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Sales");
                    da.SelectCommand.CommandText = "SELECT * FROM Customers";
                    da.Fill(ds, "Customers");
                    SalesByCustomer report = new SalesByCustomer();
                    report.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = report;
                    report.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}