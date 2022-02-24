using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostel_ERP.security
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] != null)
                {
                    if (!IsPostBack)
                    {
                        GridViewGatePass.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("../index.aspx");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Please Login again')</script>");
            }
        }

        protected void GridViewGatePass_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[7];
                cell.ForeColor = Color.Green;
            }
        }
    }
}