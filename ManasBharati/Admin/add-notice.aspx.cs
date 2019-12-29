using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class add_notice : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string txttitle = (String.Format("{0}", Request.Form["txttitle"])).Count() > 0 ? (String.Format("{0}", Request.Form["txttitle"])) : null;
            string txturl = (String.Format("{0}", Request.Form["txturl"])).Count() > 0 ? (String.Format("{0}", Request.Form["txturl"])) : null;



            if (txttitle != null && txturl != null)
            {
                string response = operation.add_notice(txttitle, txturl);

                if (response == "SUCCESS")
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-success alert-dismissible animated fadeIn text-center text-white";
                    mesaagetxt.InnerHtml = "Success!";
                    
                }

                else
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated fadeIn text-center text-white";
                    mesaagetxt.InnerHtml = "Error!";
                }
            }
        }
    }
}