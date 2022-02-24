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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    Response.Redirect("../index.aspx");
                }
                else
                {
                    txtFullName.Text = Session["student_name"].ToString();
                    txtRoomNo.Text = Session["student_room"].ToString();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Please Login again')</script>");
            }
        }

        string name;
        string room;
        string complaint;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            name = txtFullName.Text.Trim().ToString();
            room = txtRoomNo.Text.Trim().ToString();
            complaint = txtComplaint.Text.Trim().ToString();

            if (name == "")
            {
                string error = "Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (room == "")
            {
                string error = "Room Number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (complaint == "")
            {
                string error = "Complaint must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                AddIssue();
            }
        }

        private void AddIssue()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into student_issue(name,room,complaint) Values(@name,@room,@complaint)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("name", txtFullName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("room", txtRoomNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("complaint", txtComplaint.Text.Trim().ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            txtRoomNo.Text = "";
            txtComplaint.Text = "";
        }
    }
}