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
        try
        {
            clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
            if (obj.registro(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text) == true)
            {
                Response.Write("<script language='javascript'>alert('Registro exitoso');</script>");
                Response.Write("<script language='javascript'>document.location.href='cliente.aspx';</script>");
            }
            else
            {
                Response.Write("<Script languaje='javasccript'>alert ('No se insertaron los datos');</script>");
            }
        }
        catch
        {
            Response.Write("<Script languaje='javasccript'>alert ('Verifique los datos');</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
        if (obj.sesionc(TextBox9.Text, TextBox10.Text) == true)
        {
            Session["nomCliente"] = obj.strCliente;
            Response.Write("<Script languaje='javasccript'>alert ('¡Bienvenido :" + obj.strCliente + "');</script>");
            Response.Write("<Script languaje='javascript'>document.location.href='carrito.aspx';</script>");
        }

        else
        {
            Response.Write("<Script languaje='javasccript'>alert ('No eres usuario');</script>");

        }
    }
}