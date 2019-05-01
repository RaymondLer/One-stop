using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Helpers;

namespace One_stop.StaffOnly
{
    public partial class InsertFood : System.Web.UI.Page
    {
        OneDBDataContext OneDB = new OneDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string foodname = txtfood.Text;
            decimal foodprice = decimal.Parse(txtfoodprice.Text);
            string id;
            int randomId;
            bool repeatId = false;
            Random random = new Random();

            string path = MapPath("~/Photos/");
            string filename = Guid.NewGuid().ToString("N") + ".jpeg";

            do
            {
                randomId = random.Next(10000, 999999);
                id = "F" + randomId;
                var p = OneDB.Food_Lists.SingleOrDefault(
                    b => b.foodID == id);
                if (p == null) repeatId = true;
            } while (repeatId == false);

            var img = new SimpleImage(FileUpload1.FileContent);
            img.Square();
            img.Resize(150);
            img.SaveAs(path + filename);

            Food_List fl = new Food_List
            {
                foodID = id,
                foodName = foodname,
                foodPrice = foodprice,
                foodPhoto = filename,
				foodStatus = "available"
            };
            OneDB.Food_Lists.InsertOnSubmit(fl);
            OneDB.SubmitChanges();

            displaystatus.Text = "The food has been added to food menu";
        }
    }
}