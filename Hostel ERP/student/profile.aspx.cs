using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.student
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null)
                {
                    if (!IsPostBack) 
                    {
                        fetchDetails();
                    }
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }
            }
            catch (Exception) 
            {
                Response.Write("<script>alert('Please Login again')</script>");
            }
        }

        private void fetchDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from [student_profile] where enrollment='" + Session["student_enrollment"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //Profile Values
                    lblEnrollment.Text = dr.GetValue(0).ToString();
                    lblNameStudent1.Text = dr.GetValue(2).ToString();
                    lblNameStudent2.Text = dr.GetValue(2).ToString();
                    lblCourse.Text = dr.GetValue(3).ToString();
                    lblDOB.Text = dr.GetValue(4).ToString();
                    lblGender.Text = dr.GetValue(5).ToString();
                    lblContact.Text = dr.GetValue(6).ToString();
                    lblEmail.Text = dr.GetValue(7).ToString();
                    lblBlood.Text = dr.GetValue(10).ToString();
                    imgStudent.ImageUrl = dr.GetValue(11).ToString();
                    lblAddress.Text = dr.GetValue(12).ToString();
                    //Update Profile Values

                    txtFullName.Text = dr.GetValue(2).ToString();
                    DropDownListCourse.SelectedValue = dr.GetValue(3).ToString();
                    dateofBirth.Text = dr.GetValue(4).ToString();
                    txtContactNo.Text = dr.GetValue(6).ToString();
                    txtEmail.Text = dr.GetValue(7).ToString();
                    txtGurdianName.Text = dr.GetValue(8).ToString();
                    txtGurdianContact.Text = dr.GetValue(9).ToString();
                    DropDownListBlood.SelectedValue = dr.GetValue(10).ToString();
                    txtAddress.Text = dr.GetValue(12).ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error..')</script>");
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            string name = txtFullName.Text.Trim().ToString();
            string email = txtEmail.Text.Trim().ToString();
            string course = DropDownListCourse.SelectedValue.ToString();
            string dob = dateofBirth.Text.ToString();
            string blood = DropDownListBlood.SelectedValue.ToString();
            string contact = txtContactNo.Text.Trim().ToString();
            string address = txtAddress.Text.Trim().ToString();
            string gurdianname = txtGurdianName.Text.Trim().ToString();
            string gurdiancontact = txtGurdianContact.Text.Trim().ToString();
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [student_profile] set name=@name, course=@course, dob=@dob, contact=@contact, email=@email, gurdian=@gurdianname, gurdian_contact=@gurdiancontact, blood=@blood, address=@address where enrollment='" + Session["student_enrollment"].ToString() + "'", con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@course", course);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@gurdianname", gurdianname);
                cmd.Parameters.AddWithValue("@gurdiancontact", gurdiancontact);
                cmd.Parameters.AddWithValue("@blood", blood);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.ExecuteNonQuery();
                updatePhoto();
                fetchDetails();
                Session["student_name"] = name;
                Session["student_email"] = email;
                Session["student_course"] = course;
                Session["student_dob"] = dob;
                Session["student_blood"] = blood;
                Session["student_contact"] = contact;
                Session["student_gurdian_name"] = gurdianname;
                Session["student_gurdian_contact"] = gurdiancontact;
                Session["student_address"] = address;
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error Save Changes')</script>");
            }
        }

        private void updatePhoto()
        {
            if (profilePhoto.HasFile)
            {
                string filename;
                string filepath;
                filename = Path.GetFileName(profilePhoto.PostedFile.FileName);
                filepath = "~/student/StudentProfileImages/" + filename;
                profilePhoto.SaveAs((Server.MapPath("~/student/StudentProfileImages/" + profilePhoto.FileName)));
                imgStudent.ImageUrl = filepath.ToString();
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update [student_profile] set photo=@photo where enrollment='" + Session["student_enrollment"].ToString() + "'", con);
                    cmd.Parameters.AddWithValue("@photo", filepath);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Error Save Changes')</script>");
                }
            }
        }
    }
}