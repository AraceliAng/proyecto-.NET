using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label5.Text = Session["nomUsuario"].ToString() + "  " + Session["nomRol"].ToString();
        Label2.Text = Session["nomCliente"].ToString();

    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("mision.aspx");
    }
}
