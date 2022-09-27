using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller
{
    public partial class Register : System.Web.UI.Page
    {
        protected string ReturnUrl { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ReturnUrl = string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]) ? "/login.aspx" : Request.QueryString["ReturnUrl"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var store = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(store);
            var user = new IdentityUser { UserName = username.Text };
            var result = manager.Create(user, password.Text);
            if (result.Succeeded)
            {
                Response.Redirect(ReturnUrl);
            }
            else
            {
                this.msg.InnerText = result.Errors.FirstOrDefault();
                this.alert.Visible = true;
            }
        }
    }
}