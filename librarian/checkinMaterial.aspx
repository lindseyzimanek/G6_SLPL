<%@ Page Title="Check In Material" Language="VB" MasterPageFile="~/library.master" AutoEventWireup="false" CodeFile="checkinMaterial.aspx.vb" Inherits="librarian_checkinMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">Check In Material
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <p></p>
    <asp:Label ID="errorlabel" runat="server" CssClass="delete" Text=""></asp:Label>
    <table class="cssformview">
        <tr>
     <td>Material ID to be returned:</td>
             <td><asp:TextBox ID="tb_checkInMaterial" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="material_FieldValidator" runat="server" ErrorMessage="Please enter MaterialID" ControlToValidate="tb_checkInMaterial"></asp:RequiredFieldValidator></td>
    </tr>
        <tr>
        <td></td>
    <td><asp:Button ID="btn_checkIn" runat="server" Text="Check In Material" /></td>
        <td></td>
            </tr>
        </table>
</asp:Content>

