using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.rector
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        string Registration_no;
        string Name;
        string Password;
        string dob;
        string Gender;
        string Contact;
        string Blood;
        string Address;
        string State;
        string City;

        //Cancle Button Click Event
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearValues();
        }

        private void clearValues()
        {
            txtRegistrationNo.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            dateofBirth.Text = null;
            DropDownListBlood.SelectedIndex = 0;
            txtContactNo.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            RadioListGender.ClearSelection();
        }

        //Register Button Click Event
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Registration_no = txtRegistrationNo.Text.Trim().ToString();
            Name = txtFullName.Text.Trim().ToString();
            Password = txtPassword.Text.Trim().ToString();
            dob = dateofBirth.Text.ToString();
            Gender = RadioListGender.SelectedValue.ToString();
            Contact = txtContactNo.Text.Trim().ToString();
            Blood = DropDownListBlood.SelectedValue.ToString();
            Address = txtAddress.Text.Trim().ToString();
            State = txtState.Text.Trim().ToString();
            City = txtCity.Text.Trim().ToString();
            //validation

            if (Registration_no == "")
            {
                string error = "Registration number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Name == "")
            {
                string error = "Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Password == "")
            {
                string error = "Password must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (dob == "")
            {
                string error = "Date of Birth must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Gender == "")
            {
                string error = "Gender must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Contact == "")
            {
                string error = "Contact number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Blood == "")
            {
                string error = "Blood Group must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Address == "")
            {
                string error = "Address must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (City == "")
            {
                string error = "City name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (State == "")
            {
                string error = "State name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                fetchSecurity();
            }
        }

        private void fetchSecurity()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select registration_no from [security_profile] where registration_no='" + txtRegistrationNo.Text.Trim().ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtRegistrationNo.Text.Trim().ToString())
                    {
                        string error = "Security with this Registration Number Already Exist";
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
                    }
                }
                else
                {
                    AddSecurity();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        private void AddSecurity()
        {
            string photo = "~/security/SecurityProfileImages/asdfghjkl_09876.png";
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into security_profile(registration_no,name,password,dob,gender,contact_no,blood_group,photo,address,city,state) Values(@registration_no,@name,@password,@dob,@gender,@contact,@blood,@photo,@address,@city,@state)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@registration_no", txtRegistrationNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@name", txtFullName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@dob", dateofBirth.Text.ToString());
            cmd.Parameters.AddWithValue("@gender", RadioListGender.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@contact", txtContactNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@blood", DropDownListBlood.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@photo", photo);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@state", txtState.Text.Trim().ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            clearValues();
        }
    }
}