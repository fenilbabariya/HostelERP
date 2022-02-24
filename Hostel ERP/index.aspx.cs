using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP
{
    public partial class index : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
        }

        protected void btnLoginRector_Click(object sender, EventArgs e)
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
                    if (dr.GetValue(0).ToString() == txtUsernameRector.Text.Trim() && dr.GetValue(1).ToString() == txtPasswordRector.Text.Trim())
                    {
                        Session["role"] = "rector";
                        Session["rector_email"] = dr.GetValue(0).ToString();
                        Session["rector_name"] = dr.GetValue(2).ToString();
                        Session["rector_gender"] = dr.GetValue(3).ToString();
                        Session["rector_dob"] = dr.GetValue(4).ToString();
                        Session["rector_blood"] = dr.GetValue(5).ToString();
                        Session["rector_aadhar"] = dr.GetValue(6).ToString();
                        Session["rector_contact"] = dr.GetValue(7).ToString();
                        Response.Redirect("rector/index.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        protected void btnLoginStudent_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select enrollment,room_no from [student_room] where enrollment='" + txtUsernameStudent.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtUsernameStudent.Text.Trim())
                    {
                        Session["student_room"] = dr.GetValue(1).ToString();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
            try 
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from [student_profile] where enrollment='" + txtUsernameStudent.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtUsernameStudent.Text.Trim() && dr.GetValue(1).ToString() == txtPasswordStudent.Text.Trim())
                    {
                        Session["role"]= "student";
                        Session["student_enrollment"] = dr.GetValue(0).ToString();
                        Session["student_name"] = dr.GetValue(2).ToString();
                        Session["student_email"] = dr.GetValue(7).ToString();
                        Session["student_gender"] = dr.GetValue(5).ToString();
                        Session["student_course"] = dr.GetValue(3).ToString();
                        Session["student_dob"] = dr.GetValue(4).ToString();
                        Session["student_blood"] = dr.GetValue(10).ToString();
                        Session["student_contact"] = dr.GetValue(6).ToString();
                        Session["student_gurdian_name"] = dr.GetValue(8).ToString();
                        Session["student_gurdian_contact"] = dr.GetValue(9).ToString();
                        Session["student_address"] = dr.GetValue(12).ToString();
                        Response.Redirect("student/index.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                    }
                }
                else 
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                }
            }
            catch (Exception ex) 
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        protected void btnLoginSecurity_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from [security_profile] where registration_no='" + txtUsernameSecurity.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtUsernameSecurity.Text.Trim() && dr.GetValue(2).ToString() == txtPasswordSecurity.Text.Trim())
                    {
                        Session["role"] = "security";
                        Session["security_registration"] = dr.GetValue(0).ToString();
                        Session["security_name"] = dr.GetValue(1).ToString();
                        Session["security_dob"] = dr.GetValue(3).ToString();
                        Session["security_gender"] = dr.GetValue(4).ToString();
                        Session["security_contact"] = dr.GetValue(5).ToString();
                        Session["security_blood"] = dr.GetValue(6).ToString();
                        Session["security_address"] = dr.GetValue(8).ToString();
                        Session["security_city"] = dr.GetValue(9).ToString();
                        Session["security_state"] = dr.GetValue(10).ToString();
                        Response.Redirect("security/index.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }
    }
}