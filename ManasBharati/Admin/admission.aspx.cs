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
    public partial class admission : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataTable dtadmission = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                alladmission();
            }
        }

        protected void alladmission()
        {
            dtadmission = operation.get_admission();

            RepeaterAdmission.DataSource = dtadmission;
            RepeaterAdmission.DataBind();
        }

        protected void ButtonUpdateRecord_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            HiddenField HiddenFieldRegno = (HiddenField)button.NamingContainer.FindControl("HiddenFieldRegno");
            HtmlInputText editmobile = (HtmlInputText)button.NamingContainer.FindControl("editmobile");
            DropDownList ddeditclass = (DropDownList)button.NamingContainer.FindControl("ddeditclass");
            HtmlTextArea editaddress = (HtmlTextArea)button.NamingContainer.FindControl("editaddress");

            if(editmobile.Value != null && editaddress.Value != null)
            {
                string response = operation.update_admission(HiddenFieldRegno.Value, editmobile.Value, ddeditclass.SelectedItem.Text, editaddress.Value);

                if (response == "SUCCESS")
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-success alert-dismissible animated bounceInDown text-center text-white";
                    mesaagetxt.InnerHtml = "Successfully updated.";
                    alladmission();
                }

                else
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                    mesaagetxt.InnerHtml = "Error! Something went wrong. Please try again later.";
                }
            }
        }
    }
}