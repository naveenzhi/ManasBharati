using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class allot_roll : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        string regno,admtclass;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonAllotRoll_Click(object sender, EventArgs e)
        {
            string txtsection = (String.Format("{0}", Request.Form["txtsection"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtsection"])) : null;
            string txtrollno = (String.Format("{0}", Request.Form["txtrollno"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtrollno"])) : null;
            

            if (Request.QueryString["regno"] != null && Request.QueryString["class"] != null)
            {
                regno = Request.QueryString["regno"].ToString();
                admtclass = Request.QueryString["class"].ToString();
            }
            if (txtsection != null && txtrollno != null && regno != null)
            {
                string response = operation.allotrollno(regno,txtsection, txtrollno, admtclass);

                if (response == "ERROR")
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated fadeIn text-center text-white";
                    mesaagetxt.InnerHtml = "Error! please enter value.";
                }

                else
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-dark alert-dismissible animated fadeIn text-center text-white";
                    mesaagetxt.InnerHtml = response;
                }
            }
            else
            {
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated fadeIn text-center text-white";
                mesaagetxt.InnerHtml = "Error! please enter value.";
            }
            
        }
    }
}