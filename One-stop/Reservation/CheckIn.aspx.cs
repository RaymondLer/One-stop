using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One_stop.Reservation
{
    public partial class CheckIn : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncheckin_Click(object sender, EventArgs e)
        {
            Check_In ci = OneDB.Check_Ins.SingleOrDefault(
                x => x.check_code == codeverify.Text
                );

            if (codeverify != null)
            {
                changestatus();
                //displaystatus.Text = "Your Email have been verified, enjoy~";
            }
            Response.Redirect("~/Home.aspx");
        }

        private void changestatus()
        {
            var query = from c in OneDB.Check_Ins where c.check_code == codeverify.Text select c;

            foreach (Check_In c in query)
            {
                c.check_status = "CHECKED IN";
            }
            try
            {
                OneDB.SubmitChanges();
            }
            catch
            {

            }
        }
    }
}