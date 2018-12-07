using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nomCliente"].ToString() == "[no autenticado]" )
        {
            Response.Write("<script language='javascript'>alert('Usted no es cliente registrado');</script>");
            Response.Write("<script language='javascript'>document.location.href='cliente.aspx';</script>");
        }
         
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
         Session["nomCliente"] = "[no autenticado]";
        Response.Write("<script languaje='javascript'>alert('HA CERRADO CORRECTAMENTE SU SESIÓN.')</script>");
        Response.Write("<script languaje='javascript'>document.location.href='cliente.aspx';</script>");
    }

}