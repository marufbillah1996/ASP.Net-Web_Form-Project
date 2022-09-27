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
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int deptid = (int)e.Keys["BookID"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM Books WHERE BookID=@b", con))
                {
                    cmd.Parameters.AddWithValue("@b", deptid);
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