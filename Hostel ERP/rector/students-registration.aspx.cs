using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.rector
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fetchRoom();
            }
        }

        private void fetchRoom()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string com = "Select room_no from room_allocation";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con);
                DataTable dt = new DataTable();
                adpt.Fill(dt);
                DropDownListRoomNo.DataSource = dt;
                DropDownListRoomNo.DataBind();
                DropDownListRoomNo.DataTextField = "room_no";
                DropDownListRoomNo.DataValueField = "room_no";
                DropDownListRoomNo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        string RoomNo;
        string Building;
        string RoomType;
        string Fees;
        string Stayfrom;
        string Enrollment;
        string dob;
        string Password;
        string Name;
        string Course;
        string Gender;
        string Contact;
        string Email;
        string Gurdian_name;
        string Gurdian_contact;
        string Blood;
        string Address;

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            RoomNo = DropDownListRoomNo.SelectedValue.ToString();
            Building = DropDownListBuilding.SelectedValue.ToString();
            Stayfrom = dateStayFrom.Text.ToString();
            RoomType = DropDownListRoomType.SelectedValue.ToString();
            Fees = txtFees.Text.Trim().ToString();
            Enrollment = txtEnrollmentNo.Text.Trim().ToString();
            Password = txtPassword.Text.Trim().ToString();
            Name = txtFullName.Text.Trim().ToString();
            Course = DropDownListCourse.SelectedValue.ToString();
            dob = dateofBirth.Text.ToString();
            Gender = RadioListGender.SelectedValue.ToString();
            Contact = txtContactNo.Text.Trim().ToString();
            Email = txtEmail.Text.Trim().ToString();
            Gurdian_name = txtGurdianName.Text.Trim().ToString();
            Gurdian_contact = txtGurdianContact.Text.Trim().ToString();
            Blood = DropDownListBlood.SelectedValue.ToString();
            Address = txtAddress.Text.Trim().ToString();

            //validation

            if (RoomNo == "")
            {
                string error = "Room number must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Building == "")
            {
                string error = "Building name must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Stayfrom == "")
            {
                string error = "Entry Date must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (RoomType == "")
            {
                string error = "Room type must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Fees == "")
            {
                string error = "Fees must be not empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Enrollment == "")
            {
                string error = "Enrollment number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Password == "")
            {
                string error = "Password must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Name == "")
            {
                string error = "Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Course == "")
            {
                string error = "Course must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (dob == "")
            {
                string error = "Date of Birth must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Gender == "")
            {
                string error = "Gender must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Contact == "")
            {
                string error = "Contact number must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Email == "")
            {
                string error = "Email must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Gurdian_name == "")
            {
                string error = "Gurdian Name must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Gurdian_contact == "")
            {
                string error = "Gurdian Contact must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Blood == "")
            {
                string error = "Blood Group must be selected!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else if (Address == "")
            {
                string error = "Address must not be empty!";
                ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
            }
            else
            {
                fetchStudent();
            }
        }

        private void fetchStudent()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select enrollment from [student_profile] where enrollment='" + txtEnrollmentNo.Text.Trim().ToString() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.GetValue(0).ToString() == txtEnrollmentNo.Text.Trim().ToString())
                    {
                        string error = "Student Already Registered";
                        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showError('" + error + "');", true);
                    }
                }
                else
                {
                    AddStudent();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "')</script>");
            }
        }

        private void AddRoomDetails()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into student_room(enrollment, name, room_no, building, Styafrom, room_type, fees) Values(@enrollment,@name,@room_no,@building,@Stayfrom,@room_type,@fees)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@enrollment", txtEnrollmentNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@name", txtFullName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@room_no", DropDownListRoomNo.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@building", DropDownListBuilding.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@Stayfrom", dateStayFrom.Text.ToString());
            cmd.Parameters.AddWithValue("@room_type", DropDownListRoomType.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@fees", txtFees.Text.Trim().ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            sendEmail();
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showSuccess();", true);
            clearValues();
        }

        private void sendEmail()
        {
            string tomail = txtEmail.Text.Trim().ToLower().ToString();
            string from = "rkuhostel.rector@gmail.com";
            string To = tomail;
            string username = txtEnrollmentNo.Text.Trim().ToString();
            string password = txtPassword.Text.Trim().ToString();
            string a = "Your Username is: " + username + " & Password is: "+password;

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
                e_mail.Subject = "Hostel ERP Credentials";
                e_mail.IsBodyHtml = false;
                e_mail.Body = a;
                Smtp_Server.Send(e_mail);


                //Interaction.MsgBox("Mail Sent");
            }
            catch (Exception ex)
            {
                // Interaction.MsgBox(error_t.ToString);
                Console.Write("<script>alert('" + ex + "')</script>");
            }
        }

        private void AddStudent()
        {
            string photo = "~/student/StudentProfileImages/asdfghjkl_09876.png";
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            String query = "insert into student_profile(enrollment,name,password,course,dob,gender,contact,email,gurdian,gurdian_contact,blood,photo,address) Values(@enrollment,@name,@password,@course,@dob,@gender,@contact,@email,@gurdian,@gurdian_contact,@blood,@photo,@address)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@enrollment", txtEnrollmentNo.Text.Trim().ToUpper().ToString());
            cmd.Parameters.AddWithValue("@name", txtFullName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@course", DropDownListCourse.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@dob", dateofBirth.Text.ToString());
            cmd.Parameters.AddWithValue("@gender", RadioListGender.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@contact", txtContactNo.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim().ToLower().ToString());
            cmd.Parameters.AddWithValue("@gurdian", txtGurdianName.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@gurdian_contact", txtGurdianContact.Text.Trim().ToString());
            cmd.Parameters.AddWithValue("@blood", DropDownListBlood.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@photo", photo);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim().ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            AddRoomDetails();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearValues();
        }

        private void clearValues()
        {
            txtAddress.Text = "";
            txtContactNo.Text = "";
            txtEmail.Text = "";
            txtEnrollmentNo.Text = "";
            txtFees.Text = "";
            txtFullName.Text = "";
            txtGurdianContact.Text = "";
            txtGurdianName.Text = "";
            txtPassword.Text = "";
            dateofBirth.Text = null;
            dateStayFrom.Text = null;
            DropDownListBlood.SelectedIndex = 0;
            DropDownListBuilding.SelectedIndex = 0;
            DropDownListCourse.SelectedIndex = 0;
            DropDownListRoomNo.SelectedIndex = 0;
            DropDownListRoomType.SelectedIndex = 0;
            RadioListGender.ClearSelection();
        }
    }
}