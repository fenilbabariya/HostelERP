using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.security
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null)
                {
                    lblEnrollment.Visible = false;
                    lblName.Visible = false;
                    lblRoom.Visible = false;
                    Room.Visible = false;
                    Name.Visible = false;
                    Enrollment.Visible = false;
                    imgStudent.Visible = false;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtOtp.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
            }
            else 
            {
                fetchDetails();
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
                SqlCommand cmd = new SqlCommand("select * from [student_gatepass] where otp='" + txtOtp.Text.Trim().ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //Profile Values
                    string enrollment = dr.GetValue(1).ToString(); ;
                    lblEnrollment.Text = enrollment;
                    lblName.Text = dr.GetValue(2).ToString();
                    lblRoom.Text = dr.GetValue(3).ToString();
                    fetchImage(enrollment);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "noOTP();", true);
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error..')</script>");
            }
        }

        private void fetchImage(string enrollment)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select photo from [student_profile] where enrollment='" + enrollment + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //Profile Values
                    imgStudent.ImageUrl = dr.GetValue(0).ToString();
                    lblEnrollment.Visible = true;
                    lblName.Visible = true;
                    lblRoom.Visible = true;
                    Room.Visible = true;
                    Name.Visible = true;
                    Enrollment.Visible = true;
                    imgStudent.Visible = true;
                    txtOtp.Text = "";
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
    }
}