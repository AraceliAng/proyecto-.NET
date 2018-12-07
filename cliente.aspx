<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cliente.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
    .auto-style3 {
        width: 49px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr><td></td><td></td>
            <td style="margin-left: 40px">
                <asp:Label ID="Label3" align="center" Font-Names="fontTitulo" runat="server" Text="Debes iniciar sesión para ver el catálogo o en su defecto registrarte"></asp:Label></td>
            </td>
        </tr>
        <td>

        </td>
            <tr>
                <td></td>
                <td><asp:Label ID="Label1" runat="server" Text="REGISTRO"></asp:Label></td>
                <td></td>
                <td><asp:Label ID="Label2" runat="server" Text="LOGIN"></asp:Label></td>                
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>NOMBRE</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>                
                <td></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
               <td>APELLIDO PATERNO</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>                
                <td>USUARIO</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td>APELLIDO MATERNO</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>                
                <td>PASSWORD</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox10" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td>TELEFONO</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>                
                <td></td>
                <td class="auto-style3">
                    <asp:Button ID="Button2" runat="server" Text="INICIAR SESIÓN" OnClick="Button2_Click" />
                </td>
            </tr>
        <tr>
               <td>CORREO</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
               </td>
                <td>&nbsp;</td>                
                <td></td>
                <td class="auto-style3"></td>
            </tr>
        <tr>
               <td>FECHA</td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" TextMode="Date"></asp:TextBox>
               </td>
                <td>&nbsp;</td>                
                <td></td>
                <td class="auto-style3"></td>
            </tr>
        <tr>
               <td>USUARIO</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
               </td>
                <td>&nbsp;</td>                
                <td>&nbsp;</td>
                <td class="auto-style3"></td>
            </tr>
      <tr>
               <td>PASSWORD</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
               </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="REGISTRAR" OnClick="Button1_Click" />
               </td>                
                <td>&nbsp;</td>
                <td class="auto-style3"></td>
            </tr>
    </table>
</asp:Content>

