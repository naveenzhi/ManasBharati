using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class notice : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataTable dtnotice = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                getnotice();
            }
        }

        protected void getnotice()
        {
            dtnotice = operation.get_notice();

            if (dtnotice != null)
            {
                RepeaterNotice.DataSource = dtnotice;
                RepeaterNotice.DataBind();
            }
        }

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            HtmlInputHidden noticeid = (HtmlInputHidden)button.NamingContainer.FindControl("HiddenDeleteId");


            string response = operation.delete_notice(noticeid.Value);

            if (response == "SUCCESS")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Success!.";
                getnotice();
            }

            else if (response == "ERROR")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Error! Please try again later.";
            }
        }
    }
}