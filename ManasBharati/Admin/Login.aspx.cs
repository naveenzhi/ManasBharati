using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataTable dtlogin = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] != null && Session["usertype"].ToString() == "Admin")
            {

                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {

            var continue_url = Request.QueryString["continue_url"];

            string username = (String.Format("{0}", Request.Form["txtusername"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtusername"])) : null;
            string userpassword = (String.Format("{0}", Request.Form["txtpassword"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtpassword"])) : null;


            if (username != null && userpassword != null)
            {

                dtlogin = operation.loginadmin(username, userpassword);

                if (dtlogin.Rows.Count > 0)
                {

                    Session["username"] = dtlogin.Rows[0]["Username"].ToString();
                    Session["userid"] = dtlogin.Rows[0]["Userid"].ToString();
                    //Session["userimg"] = dtlogin.Rows[0]["User_img"].ToString();
                    Session["usertype"] = dtlogin.Rows[0]["UserType"].ToString();

                    if (string.IsNullOrEmpty(continue_url))
                    {
                        continue_url = "Dashboard.aspx";
                    }

                    Response.Redirect(continue_url);
                }

                else
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "alert alert-danger";
                    mesaagetxt.InnerHtml = "Invalid Credential.";
                }
            }

            else
            {
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger";
                mesaagetxt.InnerHtml = "Please enter username / Password";
            }

        }
    }
}