using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.rector
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string email;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fetchData();
            }
        }

        private void fetchData()
        {
            GridViewGatePass.DataBind();
        }
        private void Otp(string no, string email)
        {
            string from = "rkuhostel.rector@gmail.com";
            string To = email;
            int min = 1000;
            int max = 9999;
            int otp;

            Random rdm = new Random();
            otp = rdm.Next(min, max);
            string a = "Your otp is: " + otp + " please verify with Security.";

            try
            {
                SmtpClient Smtp_Server = new SmtpClient();
                MailMessage e_mail = new MailMessage();
                Smtp_Server.UseDefaultCredentials = false;
                Smtp_Server.Port = 587;
                Smtp_Server.EnableSsl = true;
                Smtp_Server.Host = "smtp.gmail.com";
                Smtp_Server.Credentials =
                new System.Net.NetworkCredential("rkuhostel.rector@gmail.com", "RKU_HOSTEL_RECTOR");
                e_mail = new MailMessage();
                e_mail.From = new MailAddress(from);
                e_mail.To.Add(To);
                e_mail.Subject = "Verify OTP";
                e_mail.IsBodyHtml = false;
                e_mail.Body = a;
                Smtp_Server.Send(e_mail);
                updateOtp(no, otp);
            }
            catch (Exception ex)
            {
                Console.Write("<script>alert('" + ex + "')</script>");
            }
        }

        private void updateOtp(string id, int otp)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update [student_gatepass] set otp=@otp where id=@id", con);
                cmd.Parameters.AddWithValue("@otp", otp);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                fetchData();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + ex.ToString() + "');", true);
            }
        }

        protected void GridViewGatePass_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approved") 
            {

                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewGatePass.Rows[rowIndex];
                string no = GridViewGatePass.Rows[rowIndex].Cells[0].Text;
                
                int rowEnrol = Convert.ToInt32(e.CommandArgument);
                GridViewRow row2 = GridViewGatePass.Rows[rowEnrol];
                string enrollment = GridViewGatePass.Rows[rowIndex].Cells[1].Text;

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("select email from [student_profile] where enrollment=@enrollment", con);
                    cmd.Parameters.AddWithValue("@enrollment",enrollment);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        email = dr.GetValue(0).ToString();
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
                    SqlCommand cmd = new SqlCommand("update [student_gatepass] set status='Approved' where id=@no", con);
                    cmd.Parameters.AddWithValue("@no", no);
                    cmd.ExecuteNonQuery();
                    fetchData();
                    Otp(no,email);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + ex.ToString() + "');", true);
                }
            }
        }

        protected void GridViewGatePass_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[7];
                string status = cell.Text;
                if (status == "Pending")
                {
                    cell.ForeColor = Color.Red;
                }
                else 
                {
                    cell.ForeColor = Color.Green;
                }
            }
        }
    }
}