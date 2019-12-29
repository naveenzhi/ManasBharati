using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManasBharati.Admin
{
    public partial class add_result : System.Web.UI.Page
    {
        DBOperations operation = new DBOperations();
        
        DataTable dtadmissiondetails = new DataTable();

        //string regno,rollno;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {

                admissiondetails();
            }
        }

        protected void ButtonAddResult_Click(object sender, EventArgs e)
        {
            if (FileUploadExcel.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(FileUploadExcel.PostedFile.FileName);
                    string extension = Path.GetExtension(FileUploadExcel.PostedFile.FileName);

                    if (extension.ToLower() == ".xls" || extension.ToLower() == ".xlsx")
                    {

                        string excelPath = Server.MapPath("~/App_Data/" + filename);

                        FileUploadExcel.SaveAs(excelPath);

                        string conString = string.Empty;


                        switch (extension)
                        {
                            case ".xls": //Excel 97-03
                                conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                                break;
                            case ".xlsx": //Excel 07 or higher
                                conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                                break;

                        }
                        conString = string.Format(conString, excelPath);
                        using (OleDbConnection excel_con = new OleDbConnection(conString))
                        {
                            excel_con.Open();
                            string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                            DataTable dtExcelData = new DataTable();

                            
                            dtExcelData.Columns.AddRange(new DataColumn[11] {
                            new DataColumn("REGNO", typeof(string)),
                            new DataColumn("ROLLNO", typeof(string)),
                            new DataColumn("CLASS", typeof(string)),
                            new DataColumn("CLASS_SECTION", typeof(string)),
                            new DataColumn("SUBJECTNAME", typeof(string)),
                            new DataColumn("PERIODIC", typeof(string)),
                            new DataColumn("THEORY", typeof(string)),
                            new DataColumn("TERMEND", typeof(string) ),
                            new DataColumn("TOTAL", typeof(string) ),
                            new DataColumn("TOTALMARKS", typeof(string) ),
                            new DataColumn("PERCENTAGE", typeof(string) )});

                            using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT REGNO,ROLLNO,CLASS,CLASS_SECTION,SUBJECTNAME,PERIODIC,THEORY,TERMEND,TOTAL,TOTALMARKS,PERCENTAGE FROM[" + sheet1 + "]", excel_con))
                            {
                                oda.Fill(dtExcelData);
                            }

                            excel_con.Close();

                            if (dtExcelData.Rows.Count > 0)
                            {
                                string response = operation.add_resultbulk(dtExcelData);

                                if (response == "SUCCESS")
                                {
                                    messagediv.Visible = true;
                                    messagediv.Attributes["class"] = "alert bg-success text-white alert-dismissible text-center animated fadeInDown";
                                    mesaagetxt.InnerHtml = "Success!";
                                    
                                }

                                else if (response == "ERROR")
                                {
                                    messagediv.Visible = true;
                                    messagediv.Attributes["class"] = "alert  bg-danger text-white alert-dismissible text-center animated fadeInDown";
                                    mesaagetxt.InnerHtml = "Error! something went wrong please try again later.";
                                }
                            }


                        }

                    }

                    else
                    {
                        messagediv.Visible = true;
                        messagediv.Attributes["class"] = "alert  bg-danger text-white alert-dismissible text-center animated fadeInDown";
                        mesaagetxt.InnerHtml = "Error! unsupported file.";
                    }
                }
                catch (Exception)
                {
                    messagediv.Visible = true;
                    messagediv.Attributes["class"] = "alert  bg-danger text-white alert-dismissible text-center animated fadeInDown";
                    mesaagetxt.InnerHtml = "Error! something went wrong please try again later.";
                }
            }
        }

        protected void admissiondetails()
        {
            //if (Request.QueryString["regno"] != null)
            //{
            //    regno = Request.QueryString["regno"].ToString();
            //    dtadmissiondetails = operation.admissiondetailsbyreg(regno);
            //    if (dtadmissiondetails != null)
            //    {
            //        rollno = dtadmissiondetails.Rows[0]["ROLLNO"].ToString();
            //        RepeaterAdmissionDetails.DataSource = dtadmissiondetails;
            //        RepeaterAdmissionDetails.DataBind();
            //    }
            //}
        }

        
    }
}