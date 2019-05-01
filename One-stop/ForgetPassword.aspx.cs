using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace One_stop
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {
            string email = forgetemail.Text;

            Customer u = OneDB.Customers.SingleOrDefault(
                v => v.email == email);

            if (u != null)
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                var stringChars = new char[8];
                var random = new Random();
                var username = "";
                username = u.username;
                var id = u.Id;
                

                for (int i = 0; i < stringChars.Length; i++)
                {
                    stringChars[i] = chars[random.Next(chars.Length)];
                }

                var finalString = new String(stringChars);
                Customer c = OneDB.Customers.SingleOrDefault(a => a.username == username);

                if (c != null)
                {
                    c.password = Security.GetHash(finalString);
                    c.confirmPass = Security.GetHash(finalString);

                }
                OneDB.SubmitChanges();

                try
                {
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.To.Add(forgetemail.Text);
                    mailMessage.From = new MailAddress("cornhub4896@gmail.com");
                    mailMessage.Subject = "Verification Mail";
                    mailMessage.Body = "<h3>hi</h3> " +
                                        "<h2>your account username are</h2>" + "<h1>" + username + "</h1>" +
                                       "<h2>your new password are</h2> <p>" + "<h1>" + finalString + "</h1>";

                    mailMessage.IsBodyHtml = true;
                    SmtpClient smtpClient = new SmtpClient();

                    smtpClient.Host = "smtp.gmail.com";

                    smtpClient.Port = 587;
                    smtpClient.Credentials = new System.Net.NetworkCredential
                    ("cornhub4896@gmail.com", "cornhub666lol");
                    smtpClient.EnableSsl = true;
                    smtpClient.Send(mailMessage);
                    Response.Write("E-mail sent!<br/>");
                    Response.Write("Sucess");
                }
                catch (Exception ex)
                {
                    Response.Write("Unable to send the e-mail <br/>" + ex.Message);
                }
            }
        }
    }
}