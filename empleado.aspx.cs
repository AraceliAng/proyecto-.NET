using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDAR USO DE VARIABLES DEL QUERYSTRING
        if (Request["op"] == null && Request["cve"] == null)
        {
            // NO SE HAN ENVIADO LAS VARIABLES
            Response.Write("<script language='javascript'>alert('No se han enviado variables');</script>");
        }
        else
        {
            // SI SE RECIBIERON LAS VARIABLES
            Response.Write("<script language='javascript'>alert('" + Request["op"].ToString() + "-" + Request["cve"].ToString() + " ');</script>");
            // VALIDACIÓN DE LAS ACCIONES A REALIZAR
            if (Request["op"].ToString() == "1")
            {
                //CONSULTAR LOS DATOS DEL EMPLEADO Y MOSTRARLOS
                SqlConnection cnn = new SqlConnection(Application["cnnConexionProyecto"].ToString());
                string strSQL = " Select pro_cve_producto, pro_nombre, pro_categoria, pro_precio, pro_existencia ";
                strSQL = strSQL + " From producto Where pro_cve_producto=" + Request["cve"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cmd.CommandText = strSQL;
                cmd.CommandType = CommandType.Text;
                cnn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                TextBox1.Text = dr.GetValue(0).ToString();
                TextBox2.Text = dr.GetValue(1).ToString();
                TextBox3.Text = dr.GetValue(2).ToString();
                TextBox4.Text = dr.GetValue(3).ToString();
                TextBox5.Text = dr.GetValue(4).ToString();

                cnn.Close();
            }
        }
        ////----------------------------------------------------------------------------

        if (Session["nomUsuario"].ToString() == "[no autenticado]" && Session["nomRol"].ToString() == "[no autenticado]")
        {
            Response.Write("<script language='javascript'>alert('Usted no es un usuario autorizado.');</script>");
            Response.Write("<script language='javascript'>document.location.href='sesion.aspx';</script>");
        }

      
        
        GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
        
        clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
        GridView1.DataSource = obj.mostrar();
        GridView1.DataMember = "mostrar";
        GridView1.DataBind();

    }

    void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    // -------------------------------------- Botón agregar-----------------------------------------------------------
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
            if (obj.agregar(TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text) == true)
            {
                Response.Write("<script language='javascript'>alert('Producto registrado.');</script>");
                Response.Write("<script language='javascript'>document.location.href='acceso.aspx';</script>");
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

    // -------------------------------------- Botón borrar-----------------------------------------------------------
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
            if (obj.borrar(TextBox1.Text) == true)
            {
                Response.Write("<script language='javascript'>alert('Producto eliminado.');</script>");
                Response.Write("<script language='javascript'>document.location.href='acceso.aspx';</script>");
            }
            else
            {
                Response.Write("<Script languaje='javasccript'>alert ('No se eliminó el roducto');</script>");
            }
        }
        catch
        {
            Response.Write("<Script languaje='javasccript'>alert ('Verifique los datos');</script>");
        }
    }

    // -------------------------------------- Botón modificar-----------------------------------------------------------
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            clspro obj = new clspro(Application["cnnConexionProyecto"].ToString());
            if (obj.modificar(TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox1.Text) == true)
            {
                Response.Write("<script language='javascript'>alert('Producto modificado.');</script>");
                Response.Write("<script language='javascript'>document.location.href='acceso.aspx';</script>");
            }
            else
            {
                Response.Write("<Script languaje='javasccript'>alert ('No se modificó el producto');</script>");
            }
        }
        catch
        {
            Response.Write("<Script languaje='javasccript'>alert ('Verifique los datos ingresados');</script>");
        }
    }
    // -------------------------------------- Botón limpiar-----------------------------------------------------------
    public void LimpiarTodosTextBox(Control controle)
    {
        foreach (Control ctle in controle.Controls)
        {
            if (ctle is TextBox)
            {
                ((TextBox)ctle).Text = string.Empty;
            }
            else if (ctle.Controls.Count > 0)
            {
                LimpiarTodosTextBox(ctle);
            }
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        LimpiarTodosTextBox(this);
    }
    // -------------------------------------- Botón refresh----------------------------------------------------------
    protected void Button5_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    // -------------------------------------- Botón buscar-----------------------------------------------------------
    protected void Button6_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(Application["cnnConexionProyecto"].ToString());
            string sql = "select pro_cve_producto, pro_nombre, pro_categoria, pro_precio, pro_existencia from producto WHERE pro_cve_producto='" + TextBox6.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.CommandType = CommandType.Text;

            cnn.Open();
            int resultado = cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                TextBox1.Text = Convert.ToString(reader["pro_cve_producto"]);
                TextBox2.Text = Convert.ToString(reader["pro_nombre"]);
                TextBox3.Text = Convert.ToString(reader["pro_categoria"]);
                TextBox4.Text = Convert.ToString(reader["pro_precio"]);
                TextBox5.Text = Convert.ToString(reader["pro_existencia"]);
            }
            cnn.Close();
        }
        catch (SqlException ex)
        {
            Response.Write("<script language='javascript'>alert('No se encontro el producto');</script>");
        }       
    }
    // -------------------------------------- Botón cerrar sesión----------------------------------------------------------
    protected void Button7_Click(object sender, EventArgs e)
    {
        Session["nomUsuario"] = "[no autenticado]";
        Session["nomRol"] = "[no autenticado]";
        Response.Write("<script languaje='javascript'>alert('HA CERRADO CORRECTAMENTE SU SESIÓN.')</script>");
        Response.Write("<script languaje='javascript'>document.location.href='sesion.aspx';</script>");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}