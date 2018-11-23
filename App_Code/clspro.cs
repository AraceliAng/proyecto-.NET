using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//----------------------
using System.Data;
//----------------------
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de clspro
/// </summary>
public class clspro
{
    private string strCadCon;
    public string strUsu;
    public string strRol;
    public string strCliente;
    
	public clspro()
	{
		// TODO: Agregar aquí la lógica del constructor
	}
    public clspro(string cadCon)
    {
        strCadCon = cadCon; // guarda la conexion
    }
    // --------------------------------------método mostrar-----------------------------------------------------------
    public DataSet mostrar()
    {
        SqlConnection cnn = new SqlConnection(strCadCon);
        string strSQL = "";
        strSQL = strSQL + " select pro_cve_producto , pro_nombre , pro_categoria , pro_precio , pro_existencia, pro_foto ";
        strSQL = strSQL + " from producto ";
        SqlDataAdapter da = new SqlDataAdapter(strSQL, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "mostrar");
        return ds;

    }
    // --------------------------------------método agregar-----------------------------------------------------------
    public bool agregar(string nombre, string categoria, string precio, string existencia)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " insert into producto (pro_nombre, pro_categoria, pro_precio, pro_existencia) ";
            strSQL = strSQL + " values ('" + nombre + "','" + categoria + "','" + precio + "','" + existencia + "')";
            SqlCommand cmd = new SqlCommand(strSQL, cnn);
            cmd.CommandType = CommandType.Text;
            cnn.Open();
            int resultado = cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
    }
    // --------------------------------------método borrarEmpleado-----------------------------------------------------------
    public bool borrar(string id)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " delete  producto";
            strSQL = strSQL + " where pro_cve_producto=" + id;
            SqlCommand cmd = new SqlCommand(strSQL, cnn);
            cmd.CommandType = CommandType.Text;
            cnn.Open();
            int resultado = cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
    }
    // --------------------------------------método modificar-----------------------------------------------------------
    public bool modificar(string nombre, string categoria, string precio, string existencia, string id)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " update producto set pro_nombre='" + nombre + "',pro_categoria='" + categoria + "',pro_precio='" + precio + "',pro_existencia='" + existencia;
            strSQL = strSQL + "' where pro_cve_producto=" + id;
            SqlCommand cmd = new SqlCommand(strSQL, cnn);
            cmd.CommandType = CommandType.Text;
            cnn.Open();
            int resultado = cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
    }
    // --------------------------------------método session empleado-----------------------------------------------------------
    public bool sesion(string usu, string pwd)
    {
        //declaracion de variables para la conexion de bd 
        string cadSQL = "EXEC SESION_EMP'" + usu + "','" + pwd + "'";    //-----CONS_ACCESO es un procedimiento 

        //creacion de objetos de conexion y manipulacion de datos 
        SqlConnection cnn = new SqlConnection(strCadCon); //<--------
        //creacion del objeto tipo comando SQL. todo es la configuracion del comando 
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = cadSQL;
        cmd.CommandType = CommandType.Text;

        //ejecución del objeto tipo comando SQL. datareader, solo sirve para leer datos una vez que los tiene pero no retrocede 
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //validacion del resulatado de ejecucion del comando 
        if (dr.HasRows == true)
        {
            dr.Read();
            strUsu = dr.GetValue(0).ToString();//<-----------------nombre del usuario
            strRol = dr.GetValue(2).ToString(); //<-----------------nombre del rol
            return true;
        }
        else
        {
            strUsu = "";
            strRol = "";
            return false;
        }
    }
    // --------------------------------------método session cliente-----------------------------------------------------------
    public bool sesionc(string cliente, string pass)
    {
        //declaracion de variables para la conexion de bd 
        string cadSQL = "EXEC SESION_CLI '" + cliente + "','" + pass + "'";    //-----CONS_ACCESO es un procedimiento 

        //creacion de objetos de conexion y manipulacion de datos 
        SqlConnection cnn = new SqlConnection(strCadCon); //<--------
        //creacion del objeto tipo comando SQL. todo es la configuracion del comando 
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = cadSQL;
        cmd.CommandType = CommandType.Text;

        //ejecución del objeto tipo comando SQL. datareader, solo sirve para leer datos una vez que los tiene pero no retrocede 
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        //validacion del resulatado de ejecucion del comando 
        if (dr.HasRows == true)
        {
            dr.Read();
            strCliente = dr.GetValue(0).ToString();//<-----------------nombre del usuario
            return true;
        }
        else
        {
            strCliente = "";
            return false;
        }
    }
    // --------------------------------------método registro-----------------------------------------------------------
    public bool registro(string nombre, string materno, string paterno, string telefono, string correo, string fecha, string usuario, string pass)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " insert into cliente (cli_nombre, cli_apellido_paterno, cli_apellido_materno, cli_telefono, cli_correo, cli_fecha_registro, cli_usuario, cli_password) ";
            strSQL = strSQL + " values ('" + nombre + "','" + paterno + "','" + materno + "','" + telefono + "','" + correo + "','" + fecha + "','" + usuario + "','" + pass + "')";
            SqlCommand cmd = new SqlCommand(strSQL, cnn);
            cmd.CommandType = CommandType.Text;
            cnn.Open();
            int resultado = cmd.ExecuteNonQuery();
            cnn.Close();
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
    }
    // --------------------------------------método mostrarCarrito-----------------------------------------------------------
    public DataSet mostrarCarrito()
    {
        SqlConnection cnn = new SqlConnection(strCadCon);
        string strSQL = "";
        strSQL = strSQL + " select pro_cve_producto , pro_nombre , pro_categoria , pro_precio , pro_existencia, pro_foto ";
        strSQL = strSQL + " from producto ";
        SqlDataAdapter da = new SqlDataAdapter(strSQL, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "mostrarCarrito");
        return ds;

    }
}