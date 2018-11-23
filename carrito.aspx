<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="carrito.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView2" runat="server" Width="602px" AllowPaging="True" 
            PageSize="5" AutoGenerateColumns="False" ForeColor="Black">
        <AlternatingRowStyle Font-Names="Arial Rounded MT Bold" Font-Size="Small" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="pro_cve_producto" DataNavigateUrlFormatString="carrito.aspx?op=1&amp;cve={0}" DataTextField="PRO_CVE_PRODUCTO" HeaderText="Clave" />
            <asp:BoundField DataField="pro_nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="pro_categoria" HeaderText="Categoría" />
            <asp:BoundField DataField="pro_precio" HeaderText="Precio" />
            <asp:BoundField DataField="pro_existencia" HeaderText="Existencia" />
            <asp:ImageField DataImageUrlField="pro_foto" HeaderText="Foto">
                <ControlStyle Height="95px" Width="80px" />
            </asp:ImageField>
        </Columns>
        <FooterStyle BackColor="Black" BorderColor="Black" BorderStyle="Inset" />
        <HeaderStyle Font-Names="Arial" BackColor="#CCCCCC" BorderColor="Silver" />
        <PagerStyle Font-Names="Arial" />
        <RowStyle Font-Names="Arial Rounded MT Bold" Font-Size="Small" />
    </asp:GridView>
</asp:Content>

