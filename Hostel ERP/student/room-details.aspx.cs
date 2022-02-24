using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.student
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null)
            {
                Response.Redirect("../index.aspx");
            }
            else 
            {
                fetchRoomDetails();
            }
        }

        private void fetchRoomDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from [student_room] where enrollment='" + Session["student_enrollment"].ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblRoomNo.Text = dr.GetValue(3).ToString();
                    lblBuilding.Text = dr.GetValue(4).ToString();
                    lblStayFrom.Text = dr.GetValue(5).ToString();
                    lblRoomType.Text = dr.GetValue(6).ToString();
                    lblFees.Text = dr.GetValue(7).ToString();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showInfo();", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }
    }
}