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
    public partial class contact : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        string name;
        string email;
        string phone_no;
        string message;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            name = txtName.Text.Trim().ToString();
            email = txtEmail.Text.Trim().ToString();
            phone_no = txtPhone.Text.Trim().ToString();
            message = txtMessage.Text.Trim().ToString();

            if (name == "")
            {
                string error = "Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (email == "")
            {
                string error = "Email must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);

            }
            else if (phone_no == "")
            {
                string error = "Phone number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (message == "")
            {
                string error = "Message must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                AddMessage();
            }
        }

        private void AddMessage()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into enquirie(name,email,phone_no,message) Values(@name,@email,@phone_no,@message)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phone_no", phone_no);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtMessage.Text = "";
        }
    }
}