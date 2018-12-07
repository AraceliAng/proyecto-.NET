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

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
        if (obj.sesion(TextBox1.Text, TextBox2.Text) == true)
        {
            Session["nomUsuario"] = obj.strUsu;
            Session["nomRol"] = obj.strRol;
            Response.Write("<Script languaje='javasccript'>alert ('¡Bienvenido :" + obj.strUsu + " - " + obj.strRol + "');</script>");
            Response.Write("<Script languaje='javascript'>document.location.href='empleado.aspx';</script>");
        }

        else
        {
            Response.Write("<Script languaje='javasccript'>alert ('Verifica tus datos');</script>");

        }
    }
}