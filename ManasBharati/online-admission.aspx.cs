using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati
{
    public partial class online_admission : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();

        string fileextension, PhotographUrl;
        string directoryUrl = "/UserUpload/Photograph/";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAdmission_Click(object sender, EventArgs e)
        {
            string txtsession = (String.Format("{0}", Request.Form["txtsession"])).Count() > 0 ? (String.Format("{0}", Request.Form["txtsession"])) : null;
            string studentname = (String.Format("{0}", Request.Form["studentname"])).Count() > 0 ? (String.Format("{0}", Request.Form["studentname"])) : null;
            string mobile = (String.Format("{0}", Request.Form["mobile"])).Count() > 0 ? (String.Format("{0}", Request.Form["mobile"])) : null;
            string aadharno = (String.Format("{0}", Request.Form["aadharno"])).Count() > 0 ? (String.Format("{0}", Request.Form["aadharno"])) : null;
            string fathername = (String.Format("{0}", Request.Form["fathername"])).Count() > 0 ? (String.Format("{0}", Request.Form["fathername"])) : null;
            string parentmobile = (String.Format("{0}", Request.Form["parentmobile"])).Count() > 0 ? (String.Format("{0}", Request.Form["parentmobile"])) : null;
            string parentincome = (String.Format("{0}", Request.Form["parentincome"])).Count() > 0 ? (String.Format("{0}", Request.Form["parentincome"])) : null;
            string bloodgroup = (String.Format("{0}", Request.Form["bloodgroup"])).Count() > 0 ? (String.Format("{0}", Request.Form["bloodgroup"])) : null;
            string mothername = (String.Format("{0}", Request.Form["mothername"])).Count() > 0 ? (String.Format("{0}", Request.Form["mothername"])) : null;
            string txtcaste = (String.Format("{0}", Request.Form["caste"])).Count() > 0 ? (String.Format("{0}", Request.Form["caste"])) : null;
            string emailid = (String.Format("{0}", Request.Form["emailid"])).Count() > 0 ? (String.Format("{0}", Request.Form["emailid"])) : null;
            string presentaddress = (String.Format("{0}", Request.Form["presentaddress"])).Count() > 0 ? (String.Format("{0}", Request.Form["presentaddress"])) : null;
            string permanent_address = (String.Format("{0}", Request.Form["permanentaddress"])).Count() > 0 ? (String.Format("{0}", Request.Form["permanentaddress"])) : null;
            string dob = (String.Format("{0}", Request.Form["dob"])).Count() > 0 ? (String.Format("{0}", Request.Form["dob"])) : null;
            string gender = (String.Format("{0}", Request.Form["gender"])).Count() > 0 ? (String.Format("{0}", Request.Form["gender"])) : null;
            //string nationality = String.Format("{0}", Request.Form["nationality"]).Count() > 0 ? (String.Format("{0}", Request.Form["nationality"])) : null;
            string admittclass = String.Format("{0}", Request.Form["admittclass"]).Count() > 0 ? (String.Format("{0}", Request.Form["admittclass"])) : null;

            if (txtsession != null && studentname != null && mobile != null && aadharno != null && fathername != null && txtsession != null && bloodgroup != null && mothername != null && txtcaste != null && presentaddress != null && dob != null && gender != null &&  txtcaste != null && admittclass != null && FileUploadPhotograph.HasFile)
            {

                string docfilename = Path.GetFileName(FileUploadPhotograph.PostedFile.FileName);
                fileextension = System.IO.Path.GetExtension(docfilename);

                if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".jpeg" || fileextension.ToLower() == ".png")
                {
                    int maxFileSize = 1048576;

                    if (FileUploadPhotograph.FileContent.Length <= maxFileSize)
                    {
                        string dirPath = Server.MapPath(directoryUrl);

                        if (!Directory.Exists(dirPath))
                        {
                            Directory.CreateDirectory(dirPath);
                        }

                        PhotographUrl = directoryUrl + DateTime.Now.Ticks.ToString("X") + "." + fileextension.ToLower();

                        string response = operation.new_admission(studentname, mobile, emailid, aadharno, parentmobile, fathername, mothername, bloodgroup, parentincome, presentaddress, permanent_address, dob, gender, txtsession, txtcaste, admittclass, PhotographUrl);

                        if (response == "ERROR")
                        {
                            messagediv.Visible = true;
                            messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                            mesaagetxt.InnerHtml = "Error! Something went wrong. Please try again later.";
                        }

                        else
                        {
                            FileUploadPhotograph.SaveAs(Server.MapPath(PhotographUrl));

                            //string body = string.Empty;

                            //using (StreamReader reader = new StreamReader(Server.MapPath("~/App_Data/email_template.html")))

                            //{
                            //    body = reader.ReadToEnd();
                            //}

                            //body = body.Replace("{Username}", name);
                            //body = body.Replace("{Message}", "Thank you for donating books at Booksforall. We appreciate your valuable contribution and express our heartiest gratitude towards you.<br/>Your login details are as follows:<br />Username: " + emailid + " <br />Password: " + password + "<br />You can login to our website through this url: http://www.booksforall.co.in/login ");

                            //operation.SendMail(emailid, "Thank you for donating books at Booksforall.", body);

                            //body = body.Replace("{Message}", name + "Requested for book donation. <br /><br />Contact Details: <br> E-mail:" + emailid + "<br />Mobile: " + mobile + "Quantity: " + bookqty);

                            //operation.SendMail("admin@booksforall.co.in", name + "Requested for book donation<br />", body);

                            messagediv.Visible = true;
                            messagediv.Attributes["class"] = "fixed-message rounded alert bg-success alert-dismissible animated bounceInDown text-center text-white";
                            mesaagetxt.InnerHtml = response;

                        }
                    }
                    else
                    {
                        messagediv.Visible = true;
                        messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                        mesaagetxt.InnerHtml = "Error! file size is greater than 1 Mb.";
                    }

                }
                else
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                    mesaagetxt.InnerHtml = "Error! unsupported file format.";
                }
            }

            else
            {
                messagediv.Visible = true;
                messagediv.Attributes["class"] = "fixed-message rounded alert bg-danger alert-dismissible animated bounceInDown text-center text-white";
                mesaagetxt.InnerHtml = "Error! please fill all manadatory field.";
            }
        }
    }
}