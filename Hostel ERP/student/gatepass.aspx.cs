using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.student
{
    public partial class WebForm7 : System.Web.UI.Page
    {
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
                    GridViewGatePass.DataBind();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Please Login again')</script>");
            }
        }

        protected void btnRequestGatepass_Click(object sender, EventArgs e)
        {
            Response.Redirect("gatepass-request.aspx");
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