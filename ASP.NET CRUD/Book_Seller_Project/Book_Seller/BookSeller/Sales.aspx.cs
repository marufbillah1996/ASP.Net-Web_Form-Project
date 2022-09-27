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
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var id = DataBinder.Eval(e.Item.DataItem, "CustomersID").ToString();
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand($"SELECT CustomersName FROM Customers WHERE CustomersID={id}", con))
                    {
                        con.Open();
                        var dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            var l = e.Item.FindControl("DeptIdLabel") as Label;
                            if (l != null)
                                l.Text = dr[0].ToString();
                            con.Close();
                        }
                    }
                }
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int deptid = (int)e.Keys["SaleID"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM Sales WHERE SaleID=@s", con))
                {
                    cmd.Parameters.AddWithValue("@s", deptid);
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