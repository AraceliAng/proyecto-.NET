<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="empleado.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 183px;
        }
        .style2
        {
            width: 560px;
        }
        .auto-style3 {
            height: 72px;
        }
        .auto-style4 {
            width: 88px;
        }
        .auto-style5 {
            width: 432px;
        }
        .auto-style6 {
            width: 75px;
        }
    </style>
</head>
<body>
    
    <div>
    <center>
        
    <table width="60%" border="0">
    <tr>
    <td colspan="3" align="center" class="auto-style3" >
        <br>        
        <asp:Label ID="Label4" runat="server" Text="PRODUCTOS" Font-Bold="True" 
            Font-Names="Arial Rounded MT Bold" Font-Size="X-Large" ForeColor="#472E40"></asp:Label>
        <br />
         
        
                                                                
                                
        </td>
    </tr>
    
    <tr>
    <td class="auto-style6" align="left">    
        <asp:Label ID="Label1" runat="server" Text="Clave:"  Font-Bold="False" 
            Font-Names="Arial"></asp:Label>
        </td>
    <td class="auto-style5" align="left">    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    <td class="auto-style4">    
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
        </td>
    </tr>

    <tr>
    <td class="auto-style6" align="left">    
        <asp:Label ID="Label2" runat="server" Text="Nombre:" 
            Font-Bold="False" Font-Names="Arial"></asp:Label>
        </td>
    <td class="auto-style5" align="left">    
        <asp:TextBox ID="TextBox2" runat="server" Width="168px"></asp:TextBox>
        </td>
    <td class="auto-style4">    
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Borrar" />
        </td>
    </tr>

    <tr>
    <td class="auto-style6" align="left">    
        <asp:Label ID="Label3" runat="server" Text="Categoria: " Font-Bold="False" 
            Font-Names="Arial"></asp:Label>
        </td>
    <td class="auto-style5" align="left">    
        <asp:TextBox ID="TextBox3" runat="server" Width="310px"></asp:TextBox>
        </td>
    <td class="auto-style4">    
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar" />
        </td>
    </tr>

    <tr>
    <td class="auto-style6" align="left">    
        <asp:Label ID="Label5" runat="server" Text="Precio:" Font-Bold="False" 
            Font-Names="Arial"></asp:Label>
        </td>
    <td class="auto-style5" align="left">    
        <asp:TextBox ID="TextBox4" runat="server" Width="310px"></asp:TextBox>
        </td>
    <td class="auto-style4">    
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Limpiar" />
        </td>
    </tr>

    <tr>
    <td class="auto-style6" align="left">    
        <asp:Label ID="Label6" runat="server" Text="Existencia:" Font-Bold="False" 
            Font-Names="Arial"></asp:Label>
        </td>
    <td class="auto-style5" align="left">    
        <asp:TextBox ID="TextBox5" runat="server" Enabled="True" Width="177px"></asp:TextBox>
        </td>
    <td class="auto-style4">    
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Actualizar" />
        </td>
    </tr>

    <tr>
    <td class="auto-style6" align="left">    <asp:Label ID="Label7" runat="server" Text="Foto:" Font-Bold="False" 
            Font-Names="Arial"></asp:Label></td>
    <td class="auto-style5" align="left">  
        <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    <td class="auto-style4">                                </td>
    </tr>

        <tr>
            <td class="auto-style6" align="left">  
            <td class="auto-style5" align="left">  </td>
            <td class="auto-style4">                                </td>
        </tr>

    <tr>
    <td class="auto-style6" align="left">    </td>
    <td class="auto-style5" align="left">        
        <asp:TextBox ID="TextBox6" runat="server" Width="168px"></asp:TextBox>
        &nbsp;    
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Buscar" />
        </td>
    <td class="auto-style4">                                </td>
    </tr>

    <tr>
    <td colspan="3" align="center">
        <br>
        <asp:GridView ID="GridView1" runat="server" Width="602px" AllowPaging="True" 
            PageSize="5" AutoGenerateColumns="False" ForeColor="Black">
            <AlternatingRowStyle Font-Names="Arial Rounded MT Bold" Font-Size="Small" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="prod_cve_producto" DataNavigateUrlFormatString="empleado.aspx?op=1&amp;cve={0}" DataTextField="PROD_CVE_PRODUCTO" HeaderText="Clave" />
                <asp:BoundField DataField="prod_nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="prod_categoria" HeaderText="Categoría" />
                <asp:BoundField DataField="prod_precio" HeaderText="Precio" />
                <asp:BoundField DataField="prod_existencia" HeaderText="Existencia" />
                <asp:ImageField DataImageUrlField="prod_foto" HeaderText="Foto">
                    <ControlStyle Height="95px" Width="80px" />
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="Black" BorderColor="Black" BorderStyle="Inset" />
            <HeaderStyle Font-Names="Arial" BackColor="#CCCCCC" BorderColor="Silver" />
            <PagerStyle Font-Names="Arial" />
            <RowStyle Font-Names="Arial Rounded MT Bold" Font-Size="Small" />
        </asp:GridView>
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Cerrar Sesión" />
    </td>
    </tr>
                
        
    </table>

    </center>
    </div>
   
</body>
</html>


</asp:Content>

