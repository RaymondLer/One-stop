using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace One_stop.AdminOnly
{
    public partial class UpdateStaff : System.Web.UI.Page
    {
        OneDBDataContext oneDB = new OneDBDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Request.QueryString["Id"];
                Staff staff = oneDB.Staffs.SingleOrDefault(
                    x => x.Id == id
                    );
                if (staff != null)
                {
                    txtname.Text = staff.username;
                    txtmail.Text = staff.email;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtname.Text;
                string email = txtmail.Text;
                string id = Request.QueryString["Id"];
                Staff staff = oneDB.Staffs.SingleOrDefault(
                   x => x.Id == id
                   );
                if (staff != null)
                {
                    staff.username = username;
                    staff.email = email;

                    oneDB.SubmitChanges();
                }
                Response.Redirect("~/AdminOnly/ListStaff.aspx");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminOnly/ListStaff.aspx");
        }

		protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
		{
			string username = args.Value;

			// Check for duplicated username
			if (oneDB.Staffs.Any(s => s.username == username))
			{
				args.IsValid = false;
			}
		}
	}
}