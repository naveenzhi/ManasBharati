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
    public partial class gallery : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();

        DataTable dtgallery = new DataTable();
        string fileextension, fileUrl;
        string directoryUrl = "../UserUpload/Gallery/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                get_gallery();
            }
        }

        protected void get_gallery()
        {



            dtgallery = operation.get_gallery();

            if (dtgallery != null)
            {
                RepeaterGallery.DataSource = dtgallery;
                RepeaterGallery.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (FileUploadImage.HasFiles)
            {
                string docfilename = Path.GetFileName(FileUploadImage.PostedFile.FileName);
                fileextension = System.IO.Path.GetExtension(docfilename);

                if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".png")
                {

                    string dirPath = Server.MapPath(directoryUrl);

                    if (!Directory.Exists(dirPath))
                    {
                        Directory.CreateDirectory(dirPath);
                    }

                    fileUrl = directoryUrl + docfilename + "." + fileextension.ToLower();

                    string response = operation.add_gallery(fileUrl);

                    if (response == "SUCCESS")
                    {
                        FileUploadImage.SaveAs(Server.MapPath(fileUrl));
                        messagediv.Visible = true;
                        messagediv.Attributes["class"] = "fixed-message rounded alert bg-success alert-dismissible animated bounceInDown text-center text-white";
                        mesaagetxt.InnerHtml = "Success!";

                        get_gallery();
                    }

                    else
                    {
                        messagediv.Visible = true;
                        messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                        mesaagetxt.InnerHtml = "Error!";

                    }
                }
            }
        }
        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;

            HtmlInputHidden noticeid = (HtmlInputHidden)button.NamingContainer.FindControl("HiddenDeleteId");


            string response = operation.delete_gallery(noticeid.Value);

            if (response == "SUCCESS")
            {

                messagediv.Visible = true;
                messagediv.Attributes["class"] = "alert alert-success alert-dismissible animated fadeInDown text-center";
                mesaagetxt.InnerHtml = "Success!.";
                get_gallery();
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