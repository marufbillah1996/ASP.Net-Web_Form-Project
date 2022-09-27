using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller.BookSeller
{
    public partial class Authors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            var fiUp = ListView1.InsertItem.FindControl("Fileup") as FileUpload;
            if (fiUp.HasFile)
            {
                if (fiUp.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(fiUp.FileName);
                    fiUp.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.Values["Picture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            var fiUp = ListView1.EditItem.FindControl("Fileup") as FileUpload;
            if (fiUp.HasFile)
            {
                if (fiUp.PostedFile.ContentLength > 0)
                {
                    string filePath = Guid.NewGuid() + Path.GetExtension(fiUp.FileName);
                    fiUp.PostedFile.SaveAs(Server.MapPath($"~/Uploads/{filePath}"));
                    e.NewValues["Picture"] = filePath;
                }
            }
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int deptid = (int)e.Keys["AuthorID"];
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT (*) FROM Authors WHERE AuthorID=@a", con))
                {
                    cmd.Parameters.AddWithValue("@a", deptid);
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