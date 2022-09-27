using Book_Seller.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller.BookSeller
{
    public partial class AuthorsAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Authors", con))
                {
                    DataSet ds = new DataSet();
                    
                    da.Fill(ds, "AuthorsV");

                    ds.Tables["AuthorsV"].Columns.Add(new DataColumn("img", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["AuthorsV"].Rows.Count; i++)
                    {

                        ds.Tables["AuthorsV"].Rows[i]["img"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["AuthorsV"].Rows[i]["Picture"].ToString()));
                    }
                    CrystalReport1 rpt = new CrystalReport1();
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
        }
    }
}