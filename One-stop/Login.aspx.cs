using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using One_stop.c_sharpFile;

namespace One_stop
{
    public partial class Login : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            var username = usernametxt.Text;
            var password = passwordtxt.Text;
            var rememberMe = chkRememberMe.Checked;
            var EncodedResponse = Request.Form["g-Recaptcha-Response"];
            var IsCaptchaValid = Recaptcha.Validate(EncodedResponse) == "true" ? true : false;

            //if (IsCaptchaValid)
            //{
                if (Page.IsValid)
                {
                    //string username = usernametxt.Text;
                    //string password = passwordtxt.Text;
                    //bool rememberMe = chkRememberMe.Checked;

                    // Login the user
                    User u = OneDB.Users.SingleOrDefault(
                                    x => x.Username == username &&
                                         x.Password == Security.GetHash(password)
                             );

                    if (u != null)
                    {
                        //FormsAuthentication.RedirectFromLoginPage(u.Username, rememberMe);
                        Session["email"] = u.Email;
                        Session["id"] = u.Id;
                        Session["username"] = u.Username;
                        Session["role"] = u.role;
                        Security.LoginUser(u.Username, u.role, rememberMe);
                        Response.Redirect("~/Home.aspx");
                    }

                    else
                    {
                        Label2.Text = "Username or Password incorrect";
                    }
                }
            }
            //else
            //{
            //    userValidate.ErrorMessage = "Please verified the recaptcha";
            //    userValidate.IsValid = false;
            //}
        //}

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}