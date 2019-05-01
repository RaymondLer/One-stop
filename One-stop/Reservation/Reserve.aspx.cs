using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Globalization;
using System.Net.Mail;

namespace One_stop
{
    public partial class Reserve : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {            
            txtDatepicker.Attributes.Add("readonly", "readonly");
        }

        protected void datepicker_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            // Select all dates in the past
            if (e.Day.Date < DateTime.Today)
            {
                // Disable date
                e.Day.IsSelectable = false;
                // Change color of disabled date
                e.Cell.ForeColor = Color.Gray;
            }
        }

        protected void datepicker_SelectionChanged(object sender, EventArgs e)
        {
            txtDatepicker.Text = datepicker.SelectedDate.ToShortDateString();
            lbPickdate.Visible = false;
        }

        protected void lbPickdate_Click(object sender, EventArgs e)
        {
            lbPickdate.Visible = true;
        }

        protected void btnReserve_Click(object sender, EventArgs e)
        {            
            string userId = "";
            hfType.Value = "Reserve";

            if (!string.IsNullOrEmpty(Session["Id"] as string))
            {
                userId = Session["id"].ToString();

                if (Page.IsValid)
                {
                    // ReservationBK
                    int person = int.Parse(ddl_headCount.Text);
                    string seatArea = ddl_seatArea.Text;
                    string datePick = txtDatepicker.Text;
                    string timePick = txtTime.Text;
                    int randomId;
                    string id;
                    string cust_id;
                    Random random = new Random();
                    bool repeatId = false;

                    // Generate Reservation Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        id = "RES" + randomId;
                        var p = OneDB.ReservationBKs.SingleOrDefault(b => b.resID == id);

                        if (p == null) repeatId = true;
                    } while (repeatId == false);

                    //For random code generate
                    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var stringChars = new char[8];

                    for (int i = 0; i < stringChars.Length; i++)
                    {
                        stringChars[i] = chars[random.Next(chars.Length)];
                    }

                    var finalString = new String(stringChars);
                    
                    cust_id = userId;
                    DateTime dt = DateTime.Parse(datePick + " " + timePick);
                    var reserveDT = OneDB.ReservationBKs.FirstOrDefault(r => r.customer_ID == cust_id && r.resDate == dt);

                    // Check if same user have already reserve on that day, then user cannot reserve in same day again
                    if (reserveDT == null)
                    {
                        //Make reserved table
                        ReservationBK reserve = new ReservationBK
                        {
                            resID = id,
                            resHeadCount = person,
                            resArea = seatArea,
                            resDate = dt,
                            customer_ID = cust_id
                        };
                        OneDB.ReservationBKs.InsertOnSubmit(reserve);
                        OneDB.SubmitChanges();
                        
                        // Reservation Detail
                        string rd_id;
                        string rd_type;
                        string res_id;
                        rd_type = hfType.Value;
                        res_id = id;

                        // Generate Reservation Detail Id
                        do
                        {
                            randomId = random.Next(10000, 999999);
                            rd_id = "RD" + randomId;
                            var p = OneDB.Reservation_Details.SingleOrDefault(b => b.resDetail_iD == rd_id);

                            if (p == null) repeatId = true;
                        } while (repeatId == false);

                        //For random code generate
                        var RDchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                        var RDstringChars = new char[8];

                        for (int i = 0; i < RDstringChars.Length; i++)
                        {
                            RDstringChars[i] = RDchars[random.Next(RDchars.Length)];
                        }

                        var RDfinalString = new String(RDstringChars);

                        // Insert in Reservation Detail Table
                        Reservation_Detail resDetail = new Reservation_Detail
                        {
                            resDetail_iD = rd_id,
                            resDetail_type = rd_type,
                            reservation_ID = res_id
                        };
                        OneDB.Reservation_Details.InsertOnSubmit(resDetail);
                        OneDB.SubmitChanges();

                        // Check In
                        string chk_code = "";

                        // Generate Reservation Id
                        randomId = random.Next(10000, 999999);
                        chk_code = randomId.ToString();

                        //For random code generate
                        var CHKchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                        var CHKstringChars = new char[6];

                        for (int i = 0; i < CHKstringChars.Length; i++)
                        {
                            CHKstringChars[i] = chars[random.Next(CHKchars.Length)];
                        }
                        var CHKfinalString = new String(CHKstringChars);
                        string booking = "Reserve";
                        string status = "Pending";

                        // Insert in Check in
                        Check_In chk = new Check_In
                        {
                            check_code = CHKfinalString,
                            check_type = booking,
                            check_status = status
                        };
                        OneDB.Check_Ins.InsertOnSubmit(chk);
                        OneDB.SubmitChanges();

                        var email = Session["email"];
                        // Send Email
                        try
                        {
                            MailMessage mailMessage = new MailMessage();
                            mailMessage.To.Add(email.ToString());
                            mailMessage.From = new MailAddress("cornhub4896@gmail.com");
                            mailMessage.Subject = "Verification Mail";
                            mailMessage.Body = "<h3>hi</h3> " +
                                               "<h2>your booking verification code are</h2> <p>" +
                                               "<h1>" + CHKfinalString + "</h1>";
                            mailMessage.IsBodyHtml = true;
                            SmtpClient smtpClient = new SmtpClient();

                            smtpClient.Host = "smtp.gmail.com";

                            smtpClient.Port = 587;
                            smtpClient.Credentials = new System.Net.NetworkCredential
                            ("cornhub4896@gmail.com", "cornhub666lol");
                            smtpClient.EnableSsl = true;
                            smtpClient.Send(mailMessage);
                        }
                        catch (Exception ex)
                        {
                            Response.Write("Unable to send the e-mail <br/>" + ex.Message);
                        }
                        displaystatus.Text = "Congratulations, you have succesfully reserved.";
                    }
                    else
                    {
                        displaystatus.Text = "You have already reserved!";
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}