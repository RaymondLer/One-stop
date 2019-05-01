using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One_stop.Reservation
{
    public partial class FoodOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Session["foodid"] = "";
            Session["foodname"] = "";
            Session["foodquantity"] = "";
            Session["total"] = "";

            var foodid = "";
            var foodname = "";
            var foodquantity = "";
            var index = 0;
            decimal total = 0;

            foreach (GridViewRow row in gvFoodList.Rows)
            {
                var check = (CheckBox)row.Cells[0].FindControl("chkFood");
                if (check != null && check.Checked)
                {

                    var quantity = (TextBox)row.Cells[0].FindControl("txtQty");
                    foodquantity += quantity.Text;
                    foodquantity += ",";

                    var price = (Label)row.Cells[0].FindControl("lblPrice");

                    total += decimal.Parse(price.Text) * decimal.Parse(quantity.Text);

                    var id = gvFoodList.DataKeys[index].Values[0].ToString();
                    foodid += id;
                    foodid += ",";

                    var fn = (Label)row.Cells[0].FindControl("lblfood");
                    foodname += fn.Text;
                    foodname += ",";
                }
                index++;
            }
            if (string.IsNullOrEmpty(foodid))
            {
                lblError.Text = "Please select Food before proceed to payment";
            }
            else
            {
                Session["foodid"] = foodid;
                Session["foodname"] = foodname;
                Session["foodquantity"] = foodquantity;
                Session["total"] = total;
                               
                Response.Redirect("~/Reservation/Payment.aspx");
            }
        }
    }
}