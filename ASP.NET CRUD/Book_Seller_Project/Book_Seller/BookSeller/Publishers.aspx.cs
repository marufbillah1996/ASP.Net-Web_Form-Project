using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller.BookSeller
{
    public partial class Publishers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int deptid = (int)e.Keys["PublisherID"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM Publishers WHERE PublisherID=@p", con))
                {
                    cmd.Parameters.AddWithValue("@p", deptid);
                    con.Open();
                    int n = (int)cmd.ExecuteScalar();
                    con.Close();
                    if (n > 0)
                    {
                        this.alert.Visible = true;
                        e.Cancel = true;
                    }
                    else
                    {
                        this.alert.Visible = false;
                    }

                }
            }
        }
    }
}