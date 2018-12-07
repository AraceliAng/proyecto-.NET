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
        strSQL = strSQL + " select * from producto ";
        SqlDataAdapter da = new SqlDataAdapter(strSQL, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds, "mostrar");
        return ds;

    }
    // --------------------------------------método agregar-----------------------------------------------------------
    public bool agregar(string nombre, string categoria, string precio, string existencia, string ruta)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " insert into producto (prod_nombre, prod_categoria, prod_precio, prod_existencia, prod_foto) ";
            strSQL = strSQL + " values ('" + nombre + "','" + categoria + "','" + precio + "','" + existencia + "','" + ruta + "')";
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
    // --------------------------------------método borrar-----------------------------------------------------------
    public bool borrar(string id)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " delete  producto";
            strSQL = strSQL + " where prod_cve_producto=" + id;
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
    public bool modificar(string nombre, string categoria, string precio, string existencia, string id, string foto)
    {
        try
        {
            SqlConnection cnn = new SqlConnection(strCadCon);
            string strSQL = "";
            strSQL = strSQL + " update producto set prod_nombre='" + nombre + "',prod_categoria='" + categoria + "',prod_precio='" + precio + "',prod_existencia='" + existencia + "',prod_foto='" + foto;
            strSQL = strSQL + "' where prod_cve_producto=" + id;
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
        string cadSQL = "EXEC SESION_EMP'" + usu + "','" + pwd + "'";
        SqlConnection cnn = new SqlConnection(strCadCon);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = cadSQL;
        cmd.CommandType = CommandType.Text;

        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            dr.Read();
            strUsu = dr.GetValue(0).ToString();
            strRol = dr.GetValue(2).ToString();
            return true;
        }
        else
        {
            strUsu = "";
            strRol = "";
            return false;
        }
    }
    // --------------------------------------método sesion cliente-----------------------------------------------------------
    public bool sesionc(string cliente, string pass)
    {
        string cadSQL = "EXEC SESION_CLI '" + cliente + "','" + pass + "'";
        SqlConnection cnn = new SqlConnection(strCadCon);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = cadSQL;
        cmd.CommandType = CommandType.Text;
        cnn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == true)
        {
            dr.Read();
            strCliente = dr.GetValue(0).ToString();
            return true;
        }
        else
        {
            strCliente = "";
            return false;
        }
    }
    // --------------------------------------método registro cliente-----------------------------------------------------------
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
}