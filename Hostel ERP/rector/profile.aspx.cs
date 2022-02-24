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

namespace Hostel_ERP.rector
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
                SqlCommand cmd = new SqlCommand("select * from [rector_profile]", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //Profile Values
                    lblEmail.Text = dr.GetValue(0).ToString();
                    lblNameRector1.Text = dr.GetValue(2).ToString();
                    lblNameRector2.Text = dr.GetValue(2).ToString();
                    lblGender.Text = dr.GetValue(3).ToString();
                    lblDOB.Text = dr.GetValue(4).ToString();
                    lblBlood.Text = dr.GetValue(5).ToString();
                    lblAadhar.Text = dr.GetValue(6).ToString();
                    lblContact.Text = dr.GetValue(7).ToString();
                    imgRector.ImageUrl = dr.GetValue(8).ToString();

                    //Update Profile Values

                    txtFullName.Text = dr.GetValue(2).ToString();
                    RadioListGender.SelectedValue = dr.GetValue(3).ToString();
                    dateofBirth.Text = dr.GetValue(4).ToString();
                    DropDownListBlood.SelectedValue = dr.GetValue(5).ToString();
                    txtAadharCard.Text = dr.GetValue(6).ToString();
                    txtContactNo.Text = dr.GetValue(7).ToString();
                    
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
            string gender = RadioListGender.SelectedValue.ToString();
            string dob = dateofBirth.Text.ToString();
            string blood = DropDownListBlood.SelectedValue.ToString();
            string aadhar = txtAadharCard.Text.Trim().ToString();
            string contact = txtContactNo.Text.Trim().ToString();

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [rector_profile] set name=@name, gender=@gender, dob=@dob, blood=@blood, aadhar=@aadhar, contact=@contact", con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@blood", blood);
                cmd.Parameters.AddWithValue("@aadhar", aadhar);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.ExecuteNonQuery();
                updatePhoto();
                fetchDetails();
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
                filepath = "~/rector/RectorProfileImages/" + filename;
                profilePhoto.SaveAs((Server.MapPath("~/rector/RectorProfileImages/" + profilePhoto.FileName)));
                imgRector.ImageUrl = filepath.ToString();
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update [rector_profile] set photo=@photo", con);
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