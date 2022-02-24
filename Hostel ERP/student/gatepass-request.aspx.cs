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
    public partial class WebForm4 : System.Web.UI.Page
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

        string enrollment;
        string name;
        string room;
        string date;
        string time;
        string reason;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            enrollment = Session["student_enrollment"].ToString();
            name = txtFullName.Text.Trim().ToString();
            room = txtRoomNo.Text.Trim().ToString();
            date = dateGatePass.Text.ToString();
            time = timeGatePass.Text.ToString();
            reason = txtReason.Text.Trim().ToString();

            if (name == "")
            {
                string error = "Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (room == "")
            {
                string error = "Room number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (date == "")
            {
                string error = "Date must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (time == "")
            {
                string error = "Time must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }

            else if (reason == "")
            {
                string error = "Reason must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                AddGatepass();
            }
        }

        private void AddGatepass()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into student_gatepass (enrollment, name, room, date, time, reason, status) Values(@enrollment,@name,@room,@date,@time,@reason,@status)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("enrollment", Session["student_enrollment"].ToString());
            cmd.Parameters.AddWithValue("name", txtFullName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("room", txtRoomNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("date", dateGatePass.Text.ToString());
            cmd.Parameters.AddWithValue("time", timeGatePass.Text.ToString());
            cmd.Parameters.AddWithValue("reason", txtReason.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("status", "Pending");
            cmd.ExecuteNonQuery();
            con.Close();
            txtFullName.Text = "";
            txtRoomNo.Text = "";
            dateGatePass.Text = "";
            timeGatePass.Text = "";
            txtReason.Text = "";
            Response.Redirect("gatepass.aspx");
        }
    }
}