using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP
{
    public partial class forgot_password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError();", true);
            }
            else 
            {
                string email = txtEmail.Text.Trim().ToLower().ToString();
                sendPassword(email);
            }
        }

        private void sendPassword(string email)
        {
            string from = "rkuhostel.rector@gmail.com";
            string To = email;
            string otp;

            string characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@!#$%&*";
            StringBuilder stringBuilder = new StringBuilder();
            Random random = new Random();
            int passwordLength = random.Next(8, 13);
            while (passwordLength-- > 0)
            {
                stringBuilder.Append(characters[random.Next(characters.Length)]);
            }
            otp = stringBuilder.ToString();
            string a = "Your new password is " + otp;

            try
            {
                SmtpClient Smtp_Server = new SmtpClient();
                MailMessage e_mail = new MailMessage();
                Smtp_Server.UseDefaultCredentials = false;
                Smtp_Server.Port = 587;
                Smtp_Server.EnableSsl = true;
                Smtp_Server.Host = "smtp.gmail.com";
                Smtp_Server.Credentials = new System.Net.NetworkCredential("rkuhostel.rector@gmail.com", "RKU_HOSTEL_RECTOR");
                e_mail = new MailMessage();
                e_mail.From = new MailAddress(from);
                e_mail.To.Add(To);
                e_mail.Subject = "Hostel ERP Credentials";
                e_mail.IsBodyHtml = false;
                e_mail.Body = a;
                Smtp_Server.Send(e_mail);
                updatePassword(otp,email);
            }
            catch (Exception ex)
            {
                Console.Write("<script>alert('" + ex + "')</script>");
            }
        }

        private void updatePassword(string otp,string email)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [student_profile] set password=@password where email='" + email + "'", con);
                cmd.Parameters.AddWithValue("@password", otp);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                txtEmail.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }
    }
}