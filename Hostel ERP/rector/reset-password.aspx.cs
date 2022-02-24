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
    public partial class WebForm3 : System.Web.UI.Page
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
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Please Login again')</script>");
            }
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string currentPsw = txtCurrentPassword.Text;
            string newPsw = txtNewPassword.Text;
            string confirmPsw = txtConfirmNewPassword.Text;
            if (currentPsw == "" || newPsw == "" || confirmPsw == "")
            {
                string error = "Fill all values";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                if (newPsw == confirmPsw)
                {
                    fetchPassword();
                }
                else
                {
                    string error = "Password & Re-Password must be same";
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
                }
            }
        }

        private void fetchPassword()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select password from [rector_profile]", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtCurrentPassword.Text.Trim())
                    {
                        updatePassword();
                    }
                    else
                    {
                        string error = "Current Password does not match";
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
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

        private void updatePassword()
        {
            string newPsw = txtNewPassword.Text.Trim().ToString();
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [rector_profile] set password=@password", con);
                cmd.Parameters.AddWithValue("@password", newPsw);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                txtCurrentPassword.Text = "";
                txtNewPassword.Text = "";
                txtConfirmNewPassword.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }
    }
}