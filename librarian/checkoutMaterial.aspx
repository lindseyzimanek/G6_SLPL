<%@ Page Title="Check Out Material" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="checkoutMaterial.aspx.vb" Inherits="librarian_checkoutMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Check Out Material
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p></p>
    <asp:Label ID="errorlabel" runat="server" Text="" CssClass="delete"></asp:Label>
    <table class="cssgridview">
        <tr>
        <td>User Name:</td>
        <td><asp:TextBox ID="tb_userName" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="Username_FieldValidator" runat="server" ErrorMessage="User Name required" ControlToValidate="tb_userName"></asp:RequiredFieldValidator></td>
      </tr>
        <tr>
       <td> Material ID:</td>
       <td> <asp:TextBox ID="tb_materialID" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="MaterialID_FieldValidator" runat="server" ErrorMessage="MaterialID required" ControlToValidate="tb_materialID"></asp:RequiredFieldValidator></td>
            </tr>
           <tr><td></td>
        <td><asp:Button ID="btn_checkOut" runat="server" Text="Check Out Material" /></td>
               <td></td>
    </tr>
   </table>
</asp:Content>

