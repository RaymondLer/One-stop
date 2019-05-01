using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One_stop.StaffOnly
{
	public partial class foodedit : System.Web.UI.Page
	{
		OneDBDataContext oneDB = new OneDBDataContext();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				string id = Request.QueryString["foodID"];
				Food_List food = oneDB.Food_Lists.SingleOrDefault(
					s => s.foodID == id
					);
				if (food != null)
				{
					txtfoodname.Text = food.foodName;
					txtprice.Text = food.foodPrice.ToString();
					lblStatus.Text = food.foodStatus;
				}
			}
		}

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				string foodname = txtfoodname.Text;
				string price = txtprice.Text;
				string id = Request.QueryString["foodID"];
				string status = ddlStatus.SelectedValue;
				Food_List food = oneDB.Food_Lists.SingleOrDefault(
				   f => f.foodID == id
				   );
				if (food != null)
				{
					food.foodName = foodname;
					food.foodPrice = decimal.Parse(price);
					food.foodStatus = status;

					oneDB.SubmitChanges();
				}
				Response.Redirect("~/StaffOnly/foodmenu.aspx");

			}
		}

		protected void btnCancel_Click(object sender, EventArgs e)
		{
			Response.Redirect("~/StaffOnly/foodmenu.aspx");
		}
	}
}