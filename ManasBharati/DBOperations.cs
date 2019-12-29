using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net;

namespace ManasBharati
{
    public class DBOperations
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string AutoId = DateTime.Now.Ticks.ToString("X");

        // Admin
        public DataTable exportdata(int option)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[procexporttable]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = option;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }
        public DataTable loginadmin(string username, string password)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMIN]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = username;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }

        
        public DataTable get_admission()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMISSION]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }

        public DataTable admissiondetailsbyreg(string regno)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMISSION]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@REGNO", SqlDbType.Int).Value = int.Parse(regno);
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 5;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }

        public string update_admission(string regno, string mobile, string admittclass, string presentaddress)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMISSION]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@REGNO", SqlDbType.Int).Value = int.Parse(regno);
                cmd.Parameters.Add("@MOBILE", SqlDbType.NVarChar).Value = mobile;
                cmd.Parameters.Add("@ADMITTED_CLASS", SqlDbType.NVarChar).Value = admittclass;
                cmd.Parameters.Add("@PRESENT_ADDRESS", SqlDbType.NVarChar).Value = presentaddress;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;
                //cmd.Parameters.Add("@OUTPUTMESSAGE", SqlDbType.NVarChar).Direction = ParameterDirection.Output;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    //string OUTPUTMESSAGE = cmd.Parameters["@OUTPUTMESSAGE"].Value.ToString();

                    return "SUCCESS";
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public string allotrollno(string regno, string section, string rollno, string admtclass)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMISSION]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@REGNO", SqlDbType.Int).Value = int.Parse(regno);
                cmd.Parameters.Add("@ROLLNO", SqlDbType.Int).Value = int.Parse(rollno);
                cmd.Parameters.Add("@SECTION", SqlDbType.NVarChar).Value = section;
                cmd.Parameters.Add("@ADMITTED_CLASS", SqlDbType.NVarChar).Value = admtclass;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 4;
                cmd.Parameters.Add("@OUTPUTMESSAGE", SqlDbType.Char, 500);
                cmd.Parameters["@OUTPUTMESSAGE"].Direction = ParameterDirection.Output;
                
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    string OUTPUTMESSAGE = (string)cmd.Parameters["@OUTPUTMESSAGE"].Value;

                    return OUTPUTMESSAGE;
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public string add_notice(string title, string url)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCNOTICE]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@TITLE", SqlDbType.NVarChar).Value = title;
                cmd.Parameters.Add("@URL", SqlDbType.NVarChar).Value = url;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                //cmd.Parameters.Add("@MARKNEW", SqlDbType.Bit) = isnew;
                
                try
                {
                    con.Open();
                    cmd.ExecuteScalar();
                    
                    return "SUCCESS";
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public DataTable get_notice()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCNOTICE]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }
        public string delete_notice(string id)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCNOTICE]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = int.Parse(id);

                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";
                    
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }


        public string add_resultbulk(DataTable result)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCRESULT]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@RESULT", result);

                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;


                try
                {
                    con.Open();
                    cmd.ExecuteScalar();
                    return "SUCCESS";
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public string add_gallery(string img)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCGALLERY]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@USER_IMG", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                
                try
                {
                    con.Open();
                    cmd.ExecuteScalar();

                    return "SUCCESS";
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public DataTable get_gallery()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCGALLERY]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }

        public string delete_gallery(string id)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCGALLERY]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = int.Parse(id);

                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";

                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        // Manas Bharati



        public string new_admission(string studentname, string mobile, string email, string aadharno, string parentmobile, string fathername, string mothername, string bloodgroup, string parentincome, string presentaddress, string permanentaddress, string dob, string gender, string session, string caste, string admittclass, string photograph)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCADMISSION]", con))
            {
	
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@STUDNAME", SqlDbType.NVarChar).Value = studentname;
                cmd.Parameters.Add("@MOBILE", SqlDbType.NVarChar).Value = mobile;
                cmd.Parameters.Add("@AADHAR", SqlDbType.NVarChar).Value = aadharno;
                cmd.Parameters.Add("@DOB", SqlDbType.NVarChar).Value = dob;
                cmd.Parameters.Add("@GENDER", SqlDbType.NVarChar).Value = gender;
                cmd.Parameters.Add("@SESSION", SqlDbType.NVarChar).Value = session;
                cmd.Parameters.Add("@CASTE", SqlDbType.NVarChar).Value = caste;
                cmd.Parameters.Add("@ADMITTED_CLASS", SqlDbType.NVarChar).Value = admittclass;
                cmd.Parameters.Add("@PHOTOGRAPH", SqlDbType.NVarChar).Value = photograph;
                cmd.Parameters.Add("@FATHER_NAME", SqlDbType.NVarChar).Value = fathername;
                cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = email;
                cmd.Parameters.Add("@PARENTMOBILE", SqlDbType.NVarChar).Value = parentmobile;
                cmd.Parameters.Add("@MOTHER_NAME", SqlDbType.NVarChar).Value = mothername;
                cmd.Parameters.Add("@BLOODGROUP", SqlDbType.NVarChar).Value = bloodgroup;
                cmd.Parameters.Add("@PARENTINCOME", SqlDbType.NVarChar).Value = parentincome;
                cmd.Parameters.Add("@PRESENT_ADDRESS", SqlDbType.NVarChar).Value = presentaddress;
                cmd.Parameters.Add("@PERMANENT_ADDRESS", SqlDbType.NVarChar).Value = permanentaddress;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@OUTPUTMESSAGE", SqlDbType.Char, 500);
                cmd.Parameters["@OUTPUTMESSAGE"].Direction = ParameterDirection.Output;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    string OUTPUTMESSAGE = (string)cmd.Parameters["@OUTPUTMESSAGE"].Value;
                    
                    return "Your application has been successfully submitted. <br /> Your Reg. No. is " + OUTPUTMESSAGE;
                }
                catch (SqlException ex)
                {
                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        public DataSet get_result(string studclass, string section, string rollno)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCRESULT]", con))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@CLASS", SqlDbType.NVarChar).Value = studclass;
                    cmd.Parameters.Add("@CLASS_SECTION", SqlDbType.NVarChar).Value = section;
                    cmd.Parameters.Add("@ROLLNO", SqlDbType.Int).Value = int.Parse(rollno);
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(ds);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return ds;
                }
            }
        }


        // Bind Web Page

        public DataSet BindHomepage()
        {

            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[PROCBINDPAGE]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(ds);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return ds;
                }
            }
        }

        //Slider

        public string add_slider(string title, string img, string btntitle, string url, string display_order)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[procslider]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = title;
                cmd.Parameters.Add("@btnname", SqlDbType.NVarChar).Value = btntitle;
                cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@url", SqlDbType.NVarChar).Value = url;
                cmd.Parameters.Add("@displayorder", SqlDbType.Int).Value = display_order;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;


                try
                {
                    con.Open();
                    cmd.ExecuteScalar();
                    return "SUCCESS";
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }
        public string update_slider(int id, string title, string img, string btntitle, string url, string display_order)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[procslider]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = title;
                cmd.Parameters.Add("@btnname", SqlDbType.NVarChar).Value = btntitle;
                cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@url", SqlDbType.NVarChar).Value = url;
                cmd.Parameters.Add("@displayorder", SqlDbType.Int).Value = Convert.ToInt32(display_order);
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }
        public DataTable getSlider()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[procslider]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }
        public string delete_slider(string id)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[procslider]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = int.Parse(id);

                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 4;

                try
                {
                    con.Open();
                    int checkstatus = cmd.ExecuteNonQuery();

                    if (checkstatus == 0)
                    {
                        return "ERROR";

                    }

                    else
                    {
                        return "SUCCESS";
                    }
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }

        //Blogs

        public string add_blogs(string title, string img, string category, string description)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[procblogs]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = title;
                cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@category", SqlDbType.NVarChar).Value = category;
                cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = description;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                try
                {
                    con.Open();
                    cmd.ExecuteScalar();
                    return "SUCCESS";
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }
        public string update_blogs(string id, string title, string img, string description)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[procblogs]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@title", SqlDbType.NVarChar).Value = title;
                cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = description;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 5;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";

                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    cmd.Dispose();
                    con.Close();
                }
            }
        }


        public string delete_blogs(int id)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[procblogs]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 6;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();


                    return "SUCCESS";
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }



        public DataTable getblogs()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[procblogs]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }
        public DataTable getblogsbyid(string id)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[procblogs]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = Convert.ToInt32(id);
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 8;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }
        
        //Testimonials

        public string add_testimonial(string name, string testimonial, string img)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[proctestimonial]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;
                cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@testimonial", SqlDbType.NVarChar).Value = testimonial;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 1;
                try
                {
                    con.Open();
                    cmd.ExecuteScalar();
                    return "SUCCESS";
                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    con.Close();
                }
            }
        }
        public DataTable get_testimonial()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[proctestimonial]", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@option", SqlDbType.Int).Value = 2;
                    try
                    {
                        con.Open();
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);

                    }
                    catch (SqlException ex)
                    {
                        LogError(ex);
                        return null;
                    }
                    finally
                    {
                        con.Close();
                    }
                    return dt;
                }
            }
        }

        public string update_testimonial(string id, string name, string testimonial)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[proctestimonial]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;
                //cmd.Parameters.Add("@img", SqlDbType.NVarChar).Value = img;
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = Convert.ToInt32(id);
                cmd.Parameters.Add("@testimonial", SqlDbType.NVarChar).Value = testimonial;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 3;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";

                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    cmd.Dispose();
                    con.Close();
                }
            }
        }
        public string delete_testimonial(string id)
        {

            using (SqlConnection con = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("[MANASBHARATI].[proctestimonial]", con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@mapid", SqlDbType.Int).Value = Convert.ToInt32(id);
                cmd.Parameters.Add("@status", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@option", SqlDbType.Int).Value = 4;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    return "SUCCESS";

                }
                catch (SqlException ex)
                {

                    LogError(ex);
                    return "ERROR";

                }
                finally
                {
                    cmd.Dispose();
                    con.Close();
                }
            }
        }
        

        public string SendMail(string mailto, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();

                mail.To.Add(mailto);
                mail.From = new MailAddress("noreply@idealpublicschoolforall.co.in");
                mail.Subject = subject;
                string Body = body;
                mail.IsBodyHtml = true;
                mail.Body = Body;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "webmail.idealpublicschoolforall.co.in"; //Or Your SMTP Server Address
                smtp.Port = 25;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential
                ("noreply@idealpublicschoolforall.co.in", "j$z39Qg3");
                //Or your Smtp Email ID and Password
                smtp.EnableSsl = false;
                smtp.Send(mail);

                return "Success";
            }

            catch (Exception ex)
            {

                LogError(ex);
                return "ERROR";

            }
        }

        public string SendSMS(string mobile, string txtmsg)
        {

            try
            {
                //Call Send SMS API
                string sendSMSUri = "http://103.16.143.201/api/mt/SendSMS?user=WEBSECUREITSOLUTION&password=123456&senderid=WSSSMS&channel=Trans&DCS=0&flashsms=0&number=91"+ mobile +"&text="+ txtmsg + "&route=04";
                
                //Create HTTPWebrequest
                HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);

                //Get the response
                HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
                StreamReader reader = new StreamReader(response.GetResponseStream());
                string responseString = reader.ReadToEnd();
                
                

                //Close the response
                reader.Close();
                response.Close();
            }
            catch (SystemException ex)
            {
                LogError(ex);
            }
            return "Done";
           
        }
        public void LogError(Exception ex)
        {
            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            String logFileName = "Err" + System.DateTime.Now.ToString("_dd-MM-yyyy") + ".txt";
            message += Environment.NewLine;
            message += "---------------------------------------------------------------------------------------------------------------";
            message += Environment.NewLine;
            message += string.Format("Message:{0}", ex.Message);
            message += Environment.NewLine;
            message += string.Format("StackTrace:{0}", ex.StackTrace);
            message += Environment.NewLine;
            message += string.Format("Source:{0}", ex.Source);
            message += Environment.NewLine;
            message += string.Format("TargetSite:{0}", ex.TargetSite);
            message += Environment.NewLine;
            message += "-----------------------------------------------------------------------------------------------------------------";
            message += Environment.NewLine;
            string path = System.Web.HttpContext.Current.Server.MapPath("~/Admin/ErrorLog/" + logFileName);
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(message);
                writer.Close();
            }
        }

    }
}