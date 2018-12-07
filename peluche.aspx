<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="peluche.aspx.cs" Inherits="Default2" %>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.SqlClient"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <!-- Agregue etiqueta y label  par a dibujar todos los elemenntos de la base  de datos 
   <asp:Label ID="Label1" runat="server"></asp:Label>
    -->
    <table width="70%" align="center">
   
  <tr>
     <td>
            <!-- CONEXION A SQL SERVER DESDE EL CLIENTE -->
            <%
                
            string strSQL = "";
            strSQL = strSQL + " Select * from PRODUCTO where prod_categoria= 'Peluches' ";
            SqlConnection cnn = new SqlConnection(Application["cnnConexionProyecto"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = strSQL;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = cnn;
            cnn.Open();            
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows == true) {
                while (dr.Read())
                {  
             %>   
                    <font face="arial" size="2"><%=dr.GetValue(1).ToString()%></font> 
                    <img src="<%=dr.GetValue(5).ToString()%>"  style="width:80px;height:90px" /> &nbsp &nbsp &nbsp
            <%
                    }
            }
            cnn.Close();   
		    %>  
    </td>
  </tr> 
        <tr>
            <td>
    <asp:Button ID="Button9" runat="server" OnClick="Button10_Click" Text="Cerrar Sesión" />
            </td>
        </tr>
</table>
</asp:Content>

