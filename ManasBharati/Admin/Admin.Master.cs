using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null)
            {
                string continue_url = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("/Admin/Login.aspx?continue_url=" + continue_url);
            }

            else
            {
                if (Session["usertype"].ToString() != "Admin")
                {
                    Response.Redirect("/index.aspx");
                }
            }

            if (!IsPostBack)
            {
                username.InnerText = Session["username"].ToString();
                

            }
        }

        protected void btnlogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}