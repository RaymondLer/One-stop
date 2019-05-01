using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;

namespace One_stop.AdminOnly
{
    public partial class RegisterStaff : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string username = args.Value;

            // Check for duplicated username
            if (OneDB.Users.Any(u => u.Username == username))
            {
                args.IsValid = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string email = txtEmail.Text;
                int randomId;
                string id;
                Random random = new Random();
                bool repeatId = false;

                do
                {
                    randomId = random.Next(10000, 999999);
                    id = "S" + randomId;
                    var p = OneDB.Users.SingleOrDefault(b => b.Id == id);

                    if (p == null) repeatId = true;
                } while (repeatId == false);

                //for random code generate
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);

                //Insert new staff account
                Staff s = new Staff
                {
                    Id = id,
                    username = username,
                    password = Security.GetHash(password),
                    confirmPass = Security.GetHash(password),
                    email = email
                };
                OneDB.Staffs.InsertOnSubmit(s);
                OneDB.SubmitChanges();

                displayStatus.Text = "Staff account has been succesfully created.";
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Server.Transfer("RegisterStaff.aspx");
        }
    }
}