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

namespace Hostel_ERP.security
{
    public partial class WebForm1 : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from [security_profile] where registration_no='" + Session["security_registration"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //Profile Values
                    lblRegistrationNo.Text = dr.GetValue(0).ToString();
                    lblNameSecurity1.Text = dr.GetValue(1).ToString();
                    lblNameSecurity2.Text = dr.GetValue(1).ToString();
                    lblDOB.Text = dr.GetValue(3).ToString();
                    lblGender.Text = dr.GetValue(4).ToString();
                    lblContact.Text = dr.GetValue(5).ToString();
                    lblBlood.Text = dr.GetValue(6).ToString();
                    imgSecurity.ImageUrl = dr.GetValue(7).ToString();
                    lblAddress.Text = dr.GetValue(8).ToString();
                    lblCity.Text = dr.GetValue(9).ToString();
                    lblState.Text = dr.GetValue(10).ToString();
                    
                    //Update Profile Values

                    txtFullName.Text = dr.GetValue(1).ToString();
                    dateofBirth.Text = dr.GetValue(3).ToString();
                    txtContactNo.Text = dr.GetValue(5).ToString();
                    DropDownListBlood.SelectedValue = dr.GetValue(6).ToString();
                    txtAddress.Text = dr.GetValue(8).ToString();
                    txtCity.Text = dr.GetValue(9).ToString();
                    txtState.Text = dr.GetValue(10).ToString();

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
            string dob = dateofBirth.Text.ToString();
            string contact = txtContactNo.Text.Trim().ToString();
            string blood = DropDownListBlood.SelectedValue.ToString();
            string address = txtAddress.Text.Trim().ToString();
            string city = txtCity.Text.Trim().ToString();
            string state = txtState.Text.Trim().ToString();

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [security_profile] set name=@name, dob=@dob, contact_no=@contact, blood_group=@blood, address=@address, city=@city, state=@state where registration_no='" + Session["security_registration"].ToString() + "'", con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@blood", blood);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.Parameters.AddWithValue("@state", state);
                cmd.ExecuteNonQuery();
                updatePhoto();
                fetchDetails();
                Session["security_name"] = name;
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
        }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex+"')</script>");
            }
}

        private void updatePhoto()
        {
            if (profilePhoto.HasFile)
            {
                string filename;
                string filepath;
                filename = Path.GetFileName(profilePhoto.PostedFile.FileName);
                filepath = "~/security/SecurityProfileImages/" + filename;
                profilePhoto.SaveAs((Server.MapPath("~/security/SecurityProfileImages/" + profilePhoto.FileName)));
                imgSecurity.ImageUrl = filepath.ToString();
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update [security_profile] set photo=@photo where registration_no='" + Session["security_registration"].ToString() + "'", con);
                    cmd.Parameters.AddWithValue("@photo", filepath);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Error Save Changes...')</script>");
                }
            }
        }
    }
}