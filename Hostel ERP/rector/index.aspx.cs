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
    public partial class WebForm11 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fetchCountStudent();
                fetchCountSecurity();
                fetchCountRoom();
            }
        }

        private void fetchCountRoom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(room_no) from [room_allocation] ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTotalRoom.Text = dr.GetValue(0).ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        private void fetchCountSecurity()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(registration_no) from [security_profile] ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTotalSecurity.Text = dr.GetValue(0).ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        private void fetchCountStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select count(enrollment) from [student_profile] ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblTotalStudent.Text = dr.GetValue(0).ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }
    }
}