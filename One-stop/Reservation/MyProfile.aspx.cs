using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One_stop.Reservation
{
    public partial class MyProfile : System.Web.UI.Page
    {
		OneDBDataContext oneDB = new OneDBDataContext();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				string id = Request.QueryString["Id"];
				Customer customer = oneDB.Customers.SingleOrDefault(
					c => c.Id == id
					);
				if (customer != null)
				{
					txtname.Text = customer.username;
					txtmail.Text = customer.email;
				}
			}
		}

		protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
		{
			string username = args.Value;

			// Check for duplicated username
			if (oneDB.Customers.Any(c => c.username == username))
			{
				args.IsValid = false;
			}
		}

		protected void btnUpdate_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				string username = txtname.Text;
				string email = txtmail.Text;
				string id = Request.QueryString["Id"];
				Customer customer = oneDB.Customers.SingleOrDefault(
				   c => c.Id == id
				   );
				if (customer != null)
				{
					customer.username = username;
					customer.email = email;

					oneDB.SubmitChanges();
				}
				Response.Redirect("~/Home.aspx");

			}
		}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}