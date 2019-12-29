using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class Slider : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        string sldirUrl = "../UserUpload/slider/";
        string fileUrl, updatesliderfileurl;

        DataTable dtslider;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getslider();
            }

        }

        protected void getslider()
        {
            dtslider = operation.getSlider();

            if(dtslider != null)
            {
                SliderRepeater.DataSource = dtslider;
                SliderRepeater.DataBind();
            }
            
        }

        protected void btnupdateslider_Click(object sender, EventArgs e)
        {
            int sliderupdatableid;

            LinkButton button = (LinkButton)sender;

            TextBox slidertitle = (TextBox)button.NamingContainer.FindControl("slidertitle");

            TextBox sliderbtntitle = (TextBox)button.NamingContainer.FindControl("sliderbtntitle");


            TextBox sliderurl = (TextBox)button.NamingContainer.FindControl("sliderurl");
            TextBox sliderdisplayorder = (TextBox)button.NamingContainer.FindControl("sliderdisplayorder");

           
            HiddenField hiddensliderid = (HiddenField)button.NamingContainer.FindControl("hiddensliderid");
            sliderupdatableid = int.Parse(hiddensliderid.Value);

            HiddenField hiddensliderimage = (HiddenField)button.NamingContainer.FindControl("hiddensliderimage");
            updatesliderfileurl = hiddensliderimage.Value;

            FileUpload fileupload = (FileUpload)button.NamingContainer.FindControl("sliderimage");

            if (fileupload.HasFile)
            {
                string dirPath = Server.MapPath(sldirUrl);

                if (!Directory.Exists(dirPath))
                {
                    Directory.CreateDirectory(dirPath);
                }

                fileUrl = sldirUrl + "/" + Path.GetFileName(fileupload.PostedFile.FileName);
                fileupload.PostedFile.SaveAs(Server.MapPath(fileUrl));
                updatesliderfileurl = fileUrl;
            }

            string response = operation.update_slider(sliderupdatableid, slidertitle.Text, updatesliderfileurl, sliderbtntitle.Text, sliderurl.Text, sliderdisplayorder.Text);

            if (response == "SUCCESS")
            {
                
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible float-right animated fadeInDown text-center";
                mesaagetxt.Text = "Saved Successfully!.";

                getslider();
            }

            else if (response == "ERROR")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible float-right animated fadeInDown text-center";
                mesaagetxt.Text = "Error!.";
            }
        }

        protected void confirmdeletebtn_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;


            HiddenField sliderid = (HiddenField)button.NamingContainer.FindControl("HiddenFieldId");
            
            string response = operation.delete_slider(sliderid.Value);

            if (response == "SUCCESS")
            {
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible float-right animated fadeInDown text-center";
                mesaagetxt.Text = "Saved Successfully!.";

                getslider();
            }

            else if (response == "ERROR")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible float-right animated fadeInDown text-center";
                mesaagetxt.Text = "Error!.";
            }
        }

        protected void btnaddslider_ServerClick(object sender, EventArgs e)
        {
            string title = (String.Format("{0}", Request.Form["slidertitle"])).Count() > 0 ? (String.Format("{0}", Request.Form["slidertitle"])) : null;
            string btntitle = (String.Format("{0}", Request.Form["sliderbtntitle"])).Count() > 0 ? (String.Format("{0}", Request.Form["sliderbtntitle"])) : null;

            string url = (String.Format("{0}", Request.Form["sliderurl"])).Count() > 0 ? (String.Format("{0}", Request.Form["sliderurl"])) : null;
            
            string displayorder = (String.Format("{0}", Request.Form["sliderdisplayorder"])).Count() > 0 ? (String.Format("{0}", Request.Form["sliderdisplayorder"])) : null;


            if (sliderimage.PostedFile.ContentLength > 0)
            {

                string dirPath = Server.MapPath(sldirUrl);

                if (!Directory.Exists(dirPath))
                {
                    Directory.CreateDirectory(dirPath);
                }

                fileUrl = sldirUrl + "/" + Path.GetFileName(sliderimage.PostedFile.FileName);
                
                string response = operation.add_slider(title, fileUrl, btntitle, url, displayorder);

                if (response == "SUCCESS")
                {
                    sliderimage.PostedFile.SaveAs(Server.MapPath(fileUrl));
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "alert alert-success alert-dismissible float-right animated fadeInDown text-center";
                    mesaagetxt.Text = "Saved Successfully!.";

                    getslider();
                }

                else if (response == "ERROR")
                {

                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "alert alert-danger alert-dismissible float-right animated fadeInDown text-center";
                    mesaagetxt.Text = "Error!.";
                }
            }
            else
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-danger alert-dismissible float-right animated fadeInDown text-center";
                mesaagetxt.Text = "Error!.";
            }
        }
    }
}