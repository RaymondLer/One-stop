using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace One_stop.Reservation
{
    public partial class Payment : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["foodname"] == null || Session["total"] == null)
            {
                //redirect to the error page
                //Response.Redirect("~/Home.aspx");
            }

            // Food Order
            //string foodid = "";
            string foodname = "";
            string quantity = "";
            decimal total = 0;

            string[] foodlist = foodname.Split(',');
            foodname = Session["foodname"].ToString();
            quantity = Session["foodquantity"].ToString();
            total = decimal.Parse(Session["total"].ToString());

            lblFoodName.Text = foodname;
            lblQty.Text = quantity;
            lblTotal.Text = "Total: RM" + total;
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            // Customer Id
            string userId = "";

            // Reservation Detail
            string type = "";

            // Food Order
            string food_id = "";
            string food_name = "";
            string qty = "";

            // Payment
            decimal totalPrice = 0;

            if (!string.IsNullOrEmpty(Session["Id"] as string))
            {
                userId = Session["id"].ToString();

                if (Page.IsValid)
                {
                    int randomId;
                    Random random = new Random();
                    bool repeatId = false;
                    string cust_id;

                    // Booking
                    string bookingId = "";
                    int person = 0;
                    string seatArea = "";
                    DateTime dt;

                    // Booking
                    person = int.Parse(Session["person"].ToString());
                    seatArea = Session["seatArea"].ToString();
                    dt = DateTime.Parse(Session["datetime"].ToString());

                    // Generate Booking Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        bookingId = "RES" + randomId;
                        var p = OneDB.ReservationBKs.SingleOrDefault(b => b.resID == bookingId);

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
                    ReservationBK book = new ReservationBK
                    {
                        resID = bookingId,
                        resHeadCount = person,
                        resArea = seatArea,
                        resDate = dt,
                        customer_ID = cust_id
                    };
                    OneDB.ReservationBKs.InsertOnSubmit(book);
                    OneDB.SubmitChanges();


                    // Reservation Detail
                    string rd_id;
                    type = Session["reserveType"].ToString();
                    string res_id;
                    res_id = bookingId;

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
                        RDstringChars[i] = chars[random.Next(RDchars.Length)];
                    }
                    var RDfinalString = new String(RDstringChars);

                    // Insert in Reservation Detail Table
                    Reservation_Detail resDetail = new Reservation_Detail
                    {
                        resDetail_iD = rd_id,
                        resDetail_type = type,
                        reservation_ID = res_id
                    };
                    OneDB.Reservation_Details.InsertOnSubmit(resDetail);
                    OneDB.SubmitChanges();
                                        
                    // Food Order                   
                    food_name = Session["foodname"].ToString();
                    qty = Session["foodquantity"].ToString();

                    // Generate Reservation Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        food_id = "FO" + randomId;
                        var p = OneDB.Food_Orders.SingleOrDefault(b => b.foodID == food_id);

                        if (p == null) repeatId = true;
                    } while (repeatId == false);

                    //For random code generate
                    var FOchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var FOstringChars = new char[8];

                    for (int i = 0; i < FOstringChars.Length; i++)
                    {
                        FOstringChars[i] = chars[random.Next(FOchars.Length)];
                    }
                    var FOfinalString = new String(FOstringChars);

                    // Insert in Food Order
                    Food_Order order = new Food_Order
                    {
                        foodID = food_id,
                    };
                    OneDB.Food_Orders.InsertOnSubmit(order);
                    OneDB.SubmitChanges();

                    // Food Order Detail
                    string orderid = "";
                    food_name = Session["foodname"].ToString();
                    qty = Session["foodquantity"].ToString();
                    var id = food_id;

                    // Generate Reservation Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        orderid = "FD" + randomId;
                        var p = OneDB.FoodOrderDetails.SingleOrDefault(b => b.OrderId == orderid);

                        if (p == null) repeatId = true;
                    } while (repeatId == false);

                    //For random code generate
                    var FDchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var FDstringChars = new char[8];

                    for (int i = 0; i < FDstringChars.Length; i++)
                    {
                        FDstringChars[i] = chars[random.Next(FDchars.Length)];
                    }
                    var FDfinalString = new String(FDstringChars);

                    // Insert in Food Order Detail
                    FoodOrderDetail od = new FoodOrderDetail
                    {
                        OrderId = food_id,
                        Id = orderid,
                        foodName = food_name,
                        quantity = qty
                    };
                    OneDB.FoodOrderDetails.InsertOnSubmit(od);
                    OneDB.SubmitChanges();

                    // Address
                    string address_id;
                    string firstName = txtFirst.Text;
                    string lastName = txtLast.Text;
                    string address = txtAddress.Text;
                    string postcode = txtPostcode.Text;
                    string state = txtState.Text;
                    cust_id = userId;

                    // Generate Reservation Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        address_id = "ADD" + randomId;
                        var p = OneDB.Addresses.SingleOrDefault(b => b.Id == address_id);

                        if (p == null) repeatId = true;
                    } while (repeatId == false);

                    //For random code generate
                    var ADchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var ADstringChars = new char[8];

                    for (int i = 0; i < ADstringChars.Length; i++)
                    {
                        ADstringChars[i] = chars[random.Next(ADchars.Length)];
                    }
                    var ADfinalString = new String(ADstringChars);

                    // Insert in Address
                    Address a = new Address()
                    {
                        Id = address_id,
                        FirstName = firstName,
                        LastName = lastName,
                        AddressLine = address,
                        Postcode = postcode,
                        State = state,
                        Customer_ID = cust_id
                    };
                    OneDB.Addresses.InsertOnSubmit(a);
                    OneDB.SubmitChanges();

                    // Payment
                    string pay_id;
                    totalPrice = decimal.Parse(Session["total"].ToString());
                    DateTime payDate = DateTime.Now;
                    cust_id = userId;
                    string payFoodid = food_id;

                    // Generate Reservation Id
                    do
                    {
                        randomId = random.Next(10000, 999999);
                        pay_id = "P" + randomId;
                        var p = OneDB.Checkouts.SingleOrDefault(b => b.paymentID == pay_id);

                        if (p == null) repeatId = true;
                    } while (repeatId == false);

                    //For random code generate
                    var Pchars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var PstringChars = new char[8];

                    for (int i = 0; i < PstringChars.Length; i++)
                    {
                        PstringChars[i] = chars[random.Next(Pchars.Length)];
                    }
                    var PfinalString = new String(PstringChars);

                    // Insert in Checkout
                    Checkout c = new Checkout()
                    {
                        paymentID = pay_id,
                        totalPrice = totalPrice,
                        paymentDate = payDate,
                        Customer_ID = cust_id,
                        foodID = food_id
                    };
                    OneDB.Checkouts.InsertOnSubmit(c);
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
                    string booking = "Booking";
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
                    displayStatus.Text = "Payment Successful!";
                    Server.Transfer("~/Reservation/PaymentSuccessful.aspx");
                }      
                   
            }
        }

        protected void cvCardNum_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string temp = Security.ParseOutHTML(txtCardNum.Text);
            string tm = temp.Replace(" ", string.Empty);
            bool verified = ValidateCardNumber(tm);
            if (string.IsNullOrEmpty(args.Value))
            {
                cvCardNum.ErrorMessage = "The credit card number is empty";
                args.IsValid = false;
            }
            else
            {
                if (!verified)
                {
                    cvCardNum.ErrorMessage = "The credit card number is invalid";
                    args.IsValid = false;
                }
            }
        }

        protected void cvExpDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string exp = Security.ParseOutHTML(txtExpDate.Text);
            if (string.IsNullOrEmpty(exp))
            {
                cvExpDate.ErrorMessage = "The expire data cannot be empty";
                args.IsValid = false;
            }
        }

        protected void cvCvv_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string cvv = Security.ParseOutHTML(txtCvv.Text);
            if (string.IsNullOrEmpty(cvv))
            {
                cvCvv.ErrorMessage = "CVV/CVC cannot be empty";
                args.IsValid = false;
            }
            else if (Convert.ToInt32(cvv) < 0)
            {
                cvCvv.ErrorMessage = "Invalid CVV/CVC";
                args.IsValid = false;
            }
        }

        private static bool ValidateCardNumber(string cardNumber)
        {
            try
            {
                // Array to contain individual numbers
                var CheckNumbers = new ArrayList();
                // So, get length of card
                var CardLength = cardNumber.Length;

                // Double the value of alternate digits, starting with the second digit
                // from the right, i.e. back to front.
                // Loop through starting at the end
                for (var i = CardLength - 2; i >= 0; i = i - 2)
                    // Now read the contents at each index, this
                    // can then be stored as an array of integers

                    // Double the number returned
                    CheckNumbers.Add(int.Parse(cardNumber[i].ToString()) * 2);

                var CheckSum = 0; // Will hold the total sum of all checksum digits

                // Second stage, add separate digits of all products
                for (var iCount = 0; iCount <= CheckNumbers.Count - 1; iCount++)
                {
                    var _count = 0; // will hold the sum of the digits

                    // determine if current number has more than one digit
                    if ((int)CheckNumbers[iCount] > 9)
                    {
                        var _numLength = ((int)CheckNumbers[iCount]).ToString().Length;
                        // add count to each digit
                        for (var x = 0; x < _numLength; x++)
                            _count = _count + int.Parse(
                                         ((int)CheckNumbers[iCount]).ToString()[x].ToString());
                    }
                    else
                    {
                        // single digit, just add it by itself
                        _count = (int)CheckNumbers[iCount];
                    }

                    CheckSum = CheckSum + _count; // add sum to the total sum
                }

                // Stage 3, add the unaffected digits
                // Add all the digits that we didn't double still starting from the
                // right but this time we'll start from the rightmost number with 
                // alternating digits
                var OriginalSum = 0;
                for (var y = CardLength - 1; y >= 0; y = y - 2)
                    OriginalSum = OriginalSum + int.Parse(cardNumber[y].ToString());

                // Perform the final calculation, if the sum Mod 10 results in 0 then
                // it's valid, otherwise its false.
                return (OriginalSum + CheckSum) % 10 == 0;
            }
            catch
            {
                return false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Reservation/FoodOrder.aspx");
        }
    }
}