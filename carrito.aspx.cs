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
        /*if (Session["nomUsuario"].ToString() == "[no autenticado]" && Session["nomRol"].ToString() == "[no autenticado]")
        {
            Response.Write("<script language='javascript'>alert('Usted no es un usuario autorizado.');</script>");
            Response.Write("<script language='javascript'>document.location.href='sesion.aspx';</script>");
        }
        */
      
        
        GridView2.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
        
        clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
        GridView2.DataSource = obj.mostrarCarrito();
        GridView2.DataMember = "mostrarCarrito";
        GridView2.DataBind();

    }

    void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataBind();
    }
    
}