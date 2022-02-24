using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.rector
{
    public partial class rector : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["rector_name"] == null)
                {
                    Response.Redirect("../index.aspx");
                }
                else
                {
                    lblRectorName.Text = Session["rector_name"].ToString();
                }
            }
            catch (Exception)
            {
                Response.Redirect("../index.aspx");
            }
        }

        protected void btnLogoutRector_Click(object sender, EventArgs e)
        {
           
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "showConfirm();", true);
            
        }
    }
}