using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace One_stop.Reservation
{
    public partial class Booking : System.Web.UI.Page
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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string userId = "";

            if (!string.IsNullOrEmpty(Session["Id"] as string))
            {
                userId = Session["id"].ToString();
                Session["person"] = "";
                Session["seatArea"] = "";
                Session["datetime"] = "";
                Session["reserveType"] = "";
                hfType.Value = "Booking";

                int person = int.Parse(ddl_headCount.Text);
                string seatArea = ddl_seatArea.Text;
                string datePick = txtDatepicker.Text;
                string timePick = txtTime.Text;
                DateTime dt = DateTime.Parse(datePick + " " + timePick);
                string cust_id;

                Session["person"] = person;
                Session["seatArea"] = seatArea;
                Session["datetime"] = dt;
                Session["reserveType"] = hfType.Value;
                Session["id"] = userId;

                cust_id = userId;
                var reserveDT = OneDB.ReservationBKs.FirstOrDefault(r => r.customer_ID == cust_id && r.resDate == dt);
                if (reserveDT == null)
                {
                    Response.Redirect("~/Reservation/FoodOrder.aspx");
                }
                else
                {
                    displaystatus.Text = "You have already reserved!";
                }
                
            }
        }

        
    }
}