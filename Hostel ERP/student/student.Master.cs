using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.student
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try 
            {
                if (Session["student_name"] == null)
                {
                    Response.Redirect("../index.aspx");
                }
                else 
                {
                    lblStudentName.Text = Session["student_name"].ToString();
                }
            }
            catch (Exception)
            {
                Response.Redirect("../index.aspx");
            }
        }

        protected void btnLogoutStudent_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showConfirm();", true);
        }
    }
}