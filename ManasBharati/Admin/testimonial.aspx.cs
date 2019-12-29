using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class testimonial : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        DataTable dttestimonial = new DataTable();
        string directoryUrl = "../UserUpload/Testimonial/";
        string fileUrl= "Content/images/useravtar.png";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gettestimonial();
            }
        }

        protected void gettestimonial()
        {
            dttestimonial = operation.get_testimonial();
            if(dttestimonial != null)
            {
                RepeaterTestimonial.DataSource = dttestimonial;
                RepeaterTestimonial.DataBind();
            }
        }
        protected void ButtonSaveTestimonial_ServerClick(object sender, EventArgs e)
        {
            string name = (String.Format("{0}", Request.Form["txtname"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtname"])) : null;
            string testimonial = (String.Format("{0}", Request.Unvalidated["txttestimonial"])).Count() > 0 ? (String.Format("{0}", Request.Unvalidated["txttestimonial"])) : null;

            if (FileUploadImage.HasFile)
            {
                string filename = FileUploadImage.FileName.ToString();

                string fileextension = System.IO.Path.GetExtension(filename);

                if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".png" || fileextension.ToLower() == ".jpeg")
                {
                    string dirPath = Server.MapPath(directoryUrl);

                    if (!Directory.Exists(dirPath))
                    {
                        Directory.CreateDirectory(dirPath);
                    }

                    fileUrl = directoryUrl + name + "_"+ DateTime.Now.Ticks.ToString("X") + fileextension.ToLower();

                    
                }
            }

            string response = operation.add_testimonial(name, Server.HtmlEncode(testimonial), fileUrl);

            if (response == "SUCCESS")
            {
                FileUploadImage.SaveAs(Server.MapPath(fileUrl));
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Saved Successfully!.";
                gettestimonial();
            }

            else if (response == "ERROR")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Error! Please try again later.";
            }
        }

        protected void LinkButtonUpdate_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            HtmlInputText name = (HtmlInputText)button.NamingContainer.FindControl("txteditname");
            HtmlTextArea testimonial = (HtmlTextArea)button.NamingContainer.FindControl("txtedittestimonial");
            HtmlInputHidden testimonialid = (HtmlInputHidden)button.NamingContainer.FindControl("HiddenEditId");
            
            string response = operation.update_testimonial(testimonialid.Value,name.Value, Server.HtmlEncode(testimonial.Value));

            if (response == "SUCCESS")
            {
                
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Saved Successfully!.";
                gettestimonial();
            }

            else if (response == "ERROR")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Error! Please try again later.";
            }
        }


        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            HtmlInputHidden testimonialid = (HtmlInputHidden)button.NamingContainer.FindControl("HiddenDeleteId");
            

            string response = operation.delete_testimonial(testimonialid.Value);

            if (response == "SUCCESS")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Success!.";
                gettestimonial();
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