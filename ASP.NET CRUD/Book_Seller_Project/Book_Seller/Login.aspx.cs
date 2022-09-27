using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Seller
{
    public partial class Login : System.Web.UI.Page
    {
        protected string ReturnUrl { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            this.ReturnUrl = string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]) ? "/Default.aspx" : Request.QueryString["ReturnUrl"];
            //Debug.WriteLine(this.ReturnUrl);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            var store = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(store);
            var user = manager.Find(username.Text, password.Text);
            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                Response.Redirect(ReturnUrl);
            }
            else
            {
                msg.InnerText = "Login failed! Username or password incorrect";
            }
        }
    }
}