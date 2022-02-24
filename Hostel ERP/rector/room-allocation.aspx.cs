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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }

        string RoomNo;
        string Building;
        string RoomType;

        //Cancle Button Click Event
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearValues();
        }

        private void clearValues()
        {
            txtRoomNo.Text = "";
            txtBuildingName.Text = "";
            DropDownListRoomType.SelectedIndex = 0;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            RoomNo = txtRoomNo.Text.Trim().ToString();
            Building = txtBuildingName.Text.Trim().ToString();
            RoomType = DropDownListRoomType.SelectedValue.ToString();

            if (RoomNo == "")
            {
                string error = "Room number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Building == "")
            {
                string error = "Building name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (RoomType == "")
            {
                string error = "Room type must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else 
            {
                addRoom();
            }
        }

        private void addRoom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                String query = "insert into room_allocation(room_no,buliding,room_type) Values(@room_no,@buliding,@room_type)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@room_no", RoomNo);
                cmd.Parameters.AddWithValue("@buliding", Building);
                cmd.Parameters.AddWithValue("@room_type", RoomType);
                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
                clearValues();
            }
            catch(Exception)
            {
                Response.Write("<script>alert('Something went wrong')</script>");
            }
        }
    }
}